lvim.builtin.which_key.mappings["c"] = { "<cmd>nohlsearch<cr>", "Clear Highlight" }


lvim.builtin.which_key.mappings["b"] = {
  name = "Buffers",
  j = { "<cmd>BufferLinePick<cr>", "Jump" },
  f = { "<cmd>Telescope buffers initial_mode=insert<cr> i", "Find" },
  b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
  n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
  -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
  e = {
    "<cmd>BufferLinePickClose<cr>",
    "Pick which buffer to close",
  },
  h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
  l = {
    "<cmd>BufferLineCloseRight<cr>",
    "Close all to the right",
  },
  D = {
    "<cmd>BufferLineSortByDirectory<cr>",
    "Sort by directory",
  },
  L = {
    "<cmd>BufferLineSortByExtension<cr>",
    "Sort by language",
  },
}

lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  b = { "<cmd>Telescope git_branches<>", "Checkout branch" },
  c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
  f = { "<cmd>Telescope find_files<cr>", "Find files" },
  t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
  s = { "<cmd>Telescope grep_string<cr>", "Find String" },
  h = { "<cmd>Telescope help_tags<cr>", "Help" },
  H = { "<cmd>Telescope highlights<cr>", "Highlights" },
  i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
  l = { "<cmd>Telescope resume<cr>", "Last Search" },
  M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
  R = { "<cmd>Telescope registers<cr>", "Registers" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  C = { "<cmd>Telescope commands<cr>", "Commands" },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Test (Jest)",
  r = { "<cmd>:lua require\"jester\".run()<cr>", "Run test under cursor" }
}

