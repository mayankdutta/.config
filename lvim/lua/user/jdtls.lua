local M = {}

local user_opts = {
  name = "jdtls",
  use_lombok_agent = true,
  on_attach = function(...)
    require("jdtls.dap").setup_dap_main_class_configs()
    require("jdtls").setup_dap({ hotcodereplace = "auto" })
    require("jdtls.setup").add_commands()

    require("lvim.lsp").common_on_attach(...)
  end,
}

local _, server = require("nvim-lsp-installer.servers").get_server("jdtls")
local root_dir = require("nvim-lsp-installer.server").get_server_root_path("jdtls")
local installer_opts = server:get_default_options()

M.config = {}
M.setup = function()
  if not vim.tbl_isempty(M.config) then
    installer_opts.on_new_config(M.config, root_dir)
    return M.config
  end

  local jdtls = require "jdtls"
  local extendedCapabilities = jdtls.extendedClientCapabilities
  extendedCapabilities.resolveAdditionalTextEditsSupport = true

  local lvim_common_opts = require("lvim.lsp").get_common_opts()
  local opts = vim.tbl_deep_extend("force", lvim_common_opts, installer_opts, user_opts, {
    settings = {
      extendedClientCapabilities = extendedCapabilities,
    },
  })

  -- https://github.com/williamboman/nvim-lsp-installer/issues/501#issuecomment-1050664641
  -- fill in the correct 'cmd'
  installer_opts.on_new_config(opts, root_dir)

  M.config = opts
  return M.config
end

return M
