-- Setup lsp.
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

local capabilities = require("lvim.lsp").common_capabilities()

require("typescript").setup({
  -- disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = { -- pass options to lspconfig's setup method
    on_attach = require("lvim.lsp").common_on_attach,
    on_init = require("lvim.lsp").common_on_init,
    capabilities = capabilities,
  },
})

-- local mason_path = os.getenv("LUNARVIM_RUNTIME_DIR") .. "/mason/"
local mason_path = vim.fn.stdpath("data") .. "/mason/"

require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  debugger_path = mason_path .. "packages/js-debug-adapter", -- Path to vscode-js-debug installation.
  -- debugger_path = "~/local/share/nvim/mason/packages/js-debug-adapter", -- Path to vscode-js-debug installation.
  -- local/share/nvim/mason/packages/js-debug-adapter/
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Tests",
      skipFiles = { "<node_internals>/**" },
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
  }
end

local inlay_hints = {
  includeInlayEnumMemberValueHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayParameterNameHints = "all",
  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayVariableTypeHints = true,
  includeInlayVariableTypeHintsWhenTypeMatchesName = true,
}

-- disable formatting in "tsserver" and "jsonls"
-- https://github.com/LunarVim/LunarVim/discussions/1846
lvim.lsp.on_attach_callback = function(client, _)
  if client.name == "tsserver" or client.name == "jsonls" then
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false

    -- setup for inline hints
    require("lspconfig").tsserver.setup({
      settings = {
        typescript = {
          inlayHints = inlay_hints,
        },
        typescriptreact = {
          inlayHints = inlay_hints,
        },
        javascript = {
          inlayHints = inlay_hints,
        },
      },
      javascrireact = {
        inlayHints = inlay_hints,
      },
    })
  end
end
