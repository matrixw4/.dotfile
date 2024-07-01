return {
  "rcarriga/nvim-notify",
  opts = {
    stages = "static",
    max_height = function() return math.floor(vim.opt.lines * 0.75) end,
    max_width = function() return math.floor(vim.opt.columns * 0.75) end,
    on_open = function(win) vim.api.nvim_win_set_config(win, { zindex = 100 }) end,
    fps = 5,
    level = 1,
    timeout = 1000,
  },
}
