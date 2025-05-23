" This is a minimal Vim config that's geared to be useful on new machines.
" All new configs will go into Neovim.

" Bootstrap vim-plug.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins
call plug#begin()
" Let Tim Pope set sensible defaults for us.
Plug 'tpope/vim-sensible'

" Optionally manage fzf here. Neovim does the same.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git-release plugins.
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" Cosmetic plugins.
Plug 'vim-airline/vim-airline', { 'tag': 'v0.11' }
Plug 'sheerun/vim-polyglot', { 'tag': 'v4.17.0' }
Plug 'altercation/vim-colors-solarized'
Plug 'ryanoasis/vim-devicons'
Plug 'psliwka/vim-smoothie'
call plug#end()

" Load some standard configs.
set number
set ignorecase
set smartcase
set mouse=a
set hlsearch
set background=dark
syntax on
syntax enable
" colorscheme solarized

if executable('fzf')
  " Remap ctrl-P to execute fzf.
  nnoremap <silent> <C-p> :Files<CR>
  " Show previews with fzf window.
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
endif

if executable('fd')
  " Use fd for fzf searches.
  let $FZF_DEFAULT_COMMAND = 'fd --type f'
endif

" Source custom configs (not under version control).
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
