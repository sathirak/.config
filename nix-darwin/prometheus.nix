{ config, pkgs, ... }:

let
  prometheusConfig = pkgs.writeText "prometheus.yml" ''
    global:
      scrape_interval: 15s

    scrape_configs:
      - job_name: 'node_exporter'
        static_configs:
          - targets: ['localhost:9000']

    # Optional: help Prometheus map OTel attributes to labels
    otlp:
      promote_resource_attributes:
        - service.name
        - service.instance.id
  '';

  grafanaConfig = pkgs.writeText "grafana.ini" ''
    [server]
    http_port = 3000
    http_addr = 127.0.0.1

    [paths]
    data = /var/lib/grafana/data
    logs = /var/lib/grafana/logs
    plugins = /var/lib/grafana/plugins
    provisioning = /var/lib/grafana/provisioning

    [security]
    admin_user = admin
    admin_password = admin
  '';

  grafanaDatasources = pkgs.writeText "datasources.yaml" ''
    apiVersion: 1
    datasources:
      - name: Prometheus
        type: prometheus
        access: proxy
        url: http://127.0.0.1:9090
        isDefault: true
        jsonData:
          timeInterval: "1s"
  '';
in
{
  services.prometheus.exporters.node = {
    enable = true;
    port = 9000;
    enabledCollectors = [
      "cpu"
      "meminfo"
      "netdev"
    ];
  };

  launchd.daemons.prometheus = {
    # Added --web.enable-otlp-receiver
    # This enables the gRPC receiver on port 9090 by default
    command = "${pkgs.prometheus}/bin/prometheus --config.file=${prometheusConfig} --storage.tsdb.path=/var/lib/prometheus --web.enable-otlp-receiver";
    serviceConfig = {
      KeepAlive = true;
      RunAtLoad = true;
      StandardOutPath = "/var/log/prometheus.out.log";
      StandardErrorPath = "/var/log/prometheus.err.log";
    };
  };

  launchd.daemons.grafana = {
    # We use a script to ensure directories exist and link the datasource config
    script = ''
      # Setup directories (Grafana is picky about write permissions)
      export G_HOME=/var/lib/grafana
      mkdir -p $G_HOME/{data,logs,plugins,provisioning/datasources}

      # Link the provisioning file so Grafana finds Prometheus on startup
      ln -sf ${grafanaDatasources} $G_HOME/provisioning/datasources/prometheus.yaml

      # Start Grafana
      # We explicitly set --homepath to the Nix store location
      exec ${pkgs.grafana}/bin/grafana server \
        --config ${grafanaConfig} \
        --homepath ${pkgs.grafana}/share/grafana
    '';

    serviceConfig = {
      KeepAlive = true;
      RunAtLoad = true;
      StandardOutPath = "/var/log/grafana.out.log";
      StandardErrorPath = "/var/log/grafana.err.log";
      # Run as root to match your Prometheus setup, or change to a specific user
      UserName = "root";
    };
  };

  system.activationScripts.postActivation.text = ''
    sudo mkdir -p /var/lib/prometheus
    sudo chown -R _prometheus-node-exporter /var/lib/prometheus || true
    sudo mkdir -p /var/lib/grafana
    sudo chmod 755 /var/lib/grafana
  '';
}
