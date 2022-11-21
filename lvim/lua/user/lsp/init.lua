require("user.lsp.languages.ts-js")
-- local lspconfig =

lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.installer.setup.automatic_installation = false

lvim.lsp.installer.setup.ensure_installed = {
  "tsserver",
  "graphql",
  "sumneko_lua",
  "jsonls",
  "groovyls",
  "yamlls",
}
