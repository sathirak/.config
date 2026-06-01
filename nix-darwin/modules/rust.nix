{
  config,
  pkgs,
  username,
  ...
}:
let
  rustVersion = "1.93";
in
{
  home.packages = with pkgs; [
    rustup
    cargo-generate
    pkg-config
    libiconv
    openssl
  ];

  home.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };

  home.activation.rustup-setup = ''
    # Ensure rustup is initialized and the specific version is installed
    export PATH="$PATH:${pkgs.rustup}/bin"

    echo "Syncing Rust version to: ${rustVersion}"

    # Install the specific toolchain if not present
    rustup toolchain install ${rustVersion}

    # Set it as the default
    rustup default ${rustVersion}

    # Optional: Install standard components if they exist for this old version
    # Note: rust-analyzer didn't exist in 1.19.3, so we check before adding
    for component in rustfmt clippy; do
      rustup component add $component || echo "Component $component not available for ${rustVersion}"
    done
  '';
}
