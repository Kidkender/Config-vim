return function(opts)
  opts = opts or {}
  
  opts.sources = opts.sources or { "filesystem", "buffers", "git_status" }
  
  opts.open_files_do_not_replace_types = opts.open_files_do_not_replace_types or { "terminal", "Trouble", "trouble", "qf", "Outline" }
  
  opts.filesystem = opts.filesystem or {}
  opts.filesystem.bind_to_cwd = false
  opts.filesystem.follow_current_file = { enabled = true }
  opts.filesystem.use_libuv_file_watcher = true
  opts.window = opts.window or {}
  opts.window.mappings = opts.window.mappings or {}
  opts.window.mappings["l"] = "open"
  opts.window.mappings["h"] = "close_node"
  opts.window.mappings["<space>"] = "none"
  opts.window.mappings["Y"] = {
    function(state)
      local node = state.tree:get_node()
      local path = node:get_id()
      vim.fn.setreg("+", path, "c")
    end,
    desc = "Copy Path to Clipboard",
  }
  opts.window.mappings["O"] = {
    function(state)
      require("lazy.util").open(state.tree:get_node().path, { system = true })
    end,
    desc = "Open with System Application",
  }
  opts.window.mappings["P"] = { "toggle_preview", config = { use_float = false } }
  
  opts.default_component_configs = opts.default_component_configs or {}
  opts.default_component_configs.indent = {
    with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
    expander_collapsed = "",
    expander_expanded = "",
    expander_highlight = "NeoTreeExpander",
  }
  opts.default_component_configs.git_status = {
    symbols = {
      unstaged = "󰄱",
      staged = "󰱒",
    },
  }
  local function on_move(data)
    if Snacks and Snacks.rename then
      Snacks.rename.on_rename_file(data.source, data.destination)
    end
  end
  
  local events = require("neo-tree.events")
  opts.event_handlers = opts.event_handlers or {}
  vim.list_extend(opts.event_handlers, {
    { event = events.FILE_MOVED, handler = on_move },
    { event = events.FILE_RENAMED, handler = on_move },
  })
  
  require("neo-tree").setup(opts)
  
  vim.api.nvim_create_autocmd("TermClose", {
    pattern = "*lazygit",
    callback = function()
      if package.loaded["neo-tree.sources.git_status"] then
        require("neo-tree.sources.git_status").refresh()
      end
    end,
  })
end
