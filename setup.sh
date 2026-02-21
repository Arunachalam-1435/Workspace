#!/bin/bash
set -e

#colored variables
MAGNETA_BG="\033[45m"
GREEN="\033[32m"
RESET="\033[0m"

echo -e "${GREEN}${MAGNETA_BG}********************Updating System********************${RESET}"
sudo apt update && sudo apt upgrade -y
echo -e "${GREEN}${MAGNETA_BG}********************Installing Dependencies********************${RESET}"
sudo apt install git curl ripgrep -y
echo -e "${GREEN}${MAGNETA_BG}********************Installing Neovim********************${RESET}"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
sudo mkdir -p /opt/nvim
sudo mv nvim-linux-x86_64.appimage /opt/nvim/nvim
sudo ln -sf /opt/nvim/nvim /usr/local/bin/nvim
echo -e "${GREEN}${MAGNETA_BG}********************Installing Tmux********************${RESET}"
sudo apt install tmux -y
echo -e "${GREEN}${MAGNETA_BG}********************Installing Plug for Neovim plugin management********************${RESET}"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo -e "${GREEN}${MAGNETA_BG}********************Configuring Neovim********************${RESET}"
mkdir -p ~/.config/nvim
cat <<NONSENSE > ~/.config/nvim/init.vim
set termguicolors
set number
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set splitbelow
set splitright
set clipboard=unnamedplus
syntax enable

call plug#begin()
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'windwp/nvim-autopairs'
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim'
Plug 'catppuccin/nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'Mofiqul/dracula.nvim'
Plug 'sainnhe/sonokai'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
call plug#end()
lua require('nvim-autopairs').setup {}

"Set a default colorscheme
colorscheme dracula

"NERDTree Keybindings
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Terminal Keybindings
nnoremap <leader>tt :split \| terminal<CR>
nnoremap <leader>tv :vsplit \| terminal<CR>

" Buffer Keybindings

" Use Ctrl + Right Arrow to go to next buffer
nnoremap <C-Right> :bnext<CR>
" Use Ctrl + Left Arrow to go to previous buffer
nnoremap <C-Left> :bprev<CR>
" Use Leader + q to close the current buffer
nnoremap <leader>q :bd<CR>
" Use Leader + vs to create vertical scratch space without saving it
nnoremap <leader>vs :vnew<CR>:setlocal buftype=nofile bufhidden=hide noswapfile<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Telescope Keybindings ---
" Find Files (Project-wide)
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" Live Grep (Search text inside files)
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" List Open Buffers
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" Git Search (Commits)
nnoremap <leader>gc <cmd>Telescope git_commits<cr>

" Git Status (Files changed)
nnoremap <leader>gs <cmd>Telescope git_status<cr>

" Color scheme selection
nnoremap <leader>ft :Telescope colorscheme<CR>

" Find EVERYTHING (including hidden and gitignored files)
nnoremap <leader>fa <cmd>Telescope find_files hidden=true no_ignore=true<cr>

" --- Optional: UI Customization (Lua) ---
lua << EOF
require('telescope').setup{
  defaults = {
    prompt_prefix = " 🔍 ",
    selection_caret = "➔ ",
    layout_config = {
      horizontal = { preview_width = 0.5 },
    },
  },
  pickers = {
	  colorscheme = {
		enable_preview = true
		  }
	  }
}
EOF
NONSENSE
nvim --headless +PlugInstall +qall
echo -e "${GREEN}${MAGNETA_BG}********************Configuring Tmux********************${RESET}"
cat <<NONSENSE > ~/.tmux.conf
# Use 'r' to reload our tmux configurations
unbind r
bind r source-file ~/.tmux.conf
# Use 'Ctrl+s' instead of use 'Ctrl+b'
set -g prefix C-Space
bind C-Space send-prefix 
# Enable mouse. So we can scroll and change pane width & height
set -g mouse on
# Set the tmux status bar at the top
set-option -g status-position top
# Use vim keys to move instead of use arrow keys
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R
# To set the window number 1 instead of starting it from 0
set -g base-index 1
NONSENSE
echo -e "${GREEN}${MAGNETA_BG}********************Setup Completed Successfully********************${RESET}"
