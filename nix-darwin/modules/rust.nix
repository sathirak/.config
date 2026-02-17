{
  config,
  pkgs,
  username,
  ...
}:
{
  home.packages = with pkgs; [
    rustup
    cargo-generate
    pkg-config
    libiconv
  ];

  home.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };

  # Low-resource rust-analyzer config: fewer threads, less cache priming, smaller LRU.
  # Applied globally for any editor (Neovim, VS Code, etc.) that uses rust-analyzer.
  home.file.".config/rust-analyzer/rust-analyzer.toml".text = ''
    # Low power / reduced memory settings (macOS battery, large workspaces)
    [rust-analyzer]
    numThreads = 1

    [rust-analyzer.cachePriming]
    enable = false

    [rust-analyzer.lru]
    capacity = 32

    [rust-analyzer.cargo]
    allTargets = false
  '';

  # NOTE: Add "cargo install ..." things as necessary to the activation script
  home.activation.rustup-components = ''
    # Set up Rust environment
    ${pkgs.rustup}/bin/rustup default stable
    # Ensure all required rustup components are installed
    REQUIRED_COMPONENTS="rust-analyzer rustfmt clippy"
    for component in $REQUIRED_COMPONENTS; do
      if ! ${pkgs.rustup}/bin/rustup component list --installed | grep -q "^$component.*(installed)"; then
        echo "Installing missing Rust component: $component"
        ${pkgs.rustup}/bin/rustup component add $component
      else
        echo "Rust component already installed: $component"
      fi
    done
  '';
}
