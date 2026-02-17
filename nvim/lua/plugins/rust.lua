-- Rust via rust-analyzer (lspconfig only, no rustaceanvim, no clippy).
-- Low-resource settings to reduce memory/CPU (aligned with ~/.config/rust-analyzer/rust-analyzer.toml).
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            check = { command = "check" },
            checkOnSave = { command = "check" },
            numThreads = 1,
            cachePriming = { enable = false },
            lru = { capacity = 32 },
            cargo = { allTargets = false },
          },
        },
      },
    },
  },
}
