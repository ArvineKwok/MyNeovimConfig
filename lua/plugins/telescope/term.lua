local M = {}

local Terminal = require("toggleterm.terminal").Terminal

-- Git client
local git_tui = "lazygit"
-- local git_tui = "gitui"

-- Docker
local docker_lazydocker = "lazydocker"

-- Docker ctop
local docker_ctop = "ctop"

-- Docker dockly
local docker_dockly = "dockly"

-- Committizen
local git_cz = "git cz"

-- Tokei
local tokei = "tokei"

-- Bottom
local bottom = "btm"

-- navi
local navi = "navi fn welcome"

local git_client = Terminal:new {
  cmd = git_tui,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
}

local docker_client = Terminal:new {
  cmd = docker_lazydocker,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
}

local docker_ctop_client = Terminal:new {
  cmd = docker_ctop,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
}

local docker_dockly_client = Terminal:new {
  cmd = docker_dockly,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
}

local git_commit = Terminal:new {
  cmd = git_cz,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
}

local project_info = Terminal:new {
  cmd = tokei,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
  close_on_exit = false,
}

local system_info = Terminal:new {
  cmd = bottom,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
  close_on_exit = true,
}

local interactive_cheatsheet = Terminal:new {
  cmd = navi,
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
  close_on_exit = false,
}

function M.git_client_toggle()
  git_client:toggle()
end

function M.docker_client_toggle()
  docker_client:toggle()
end

function M.docker_ctop_toggle()
  docker_ctop_client:toggle()
end

function M.docker_dockly_toggle()
  docker_dockly_client:toggle()
end

function M.git_commit_toggle()
  git_commit:toggle()
end

function M.project_info_toggle()
  project_info:toggle()
end

function M.system_info_toggle()
  system_info:toggle()
end

function M.interactive_cheatsheet_toggle()
  interactive_cheatsheet:toggle()
end

-- Open a terminal
local function default_on_open(term)
  vim.cmd "stopinsert"
  vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
end

function M.open_term(cmd, opts)
  opts = opts or {}
  opts.size = opts.size or vim.o.columns * 0.5
  opts.direction = opts.direction or "vertical"
  opts.on_open = opts.on_open or default_on_open
  opts.on_exit = opts.on_exit or nil

  local new_term = Terminal:new {
    cmd = cmd,
    dir = "git_dir",
    auto_scroll = false,
    close_on_exit = false,
    start_in_insert = false,
    on_open = opts.on_open,
    on_exit = opts.on_exit,
  }
  new_term:open(opts.size, opts.direction)
end
return M
