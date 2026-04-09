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
