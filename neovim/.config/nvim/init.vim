call plug#begin()


Plug 'thedenisnikulin/vim-cyberpunk'
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle'} |
	\ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'github/copilot.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bryanmylee/vim-colorscheme-icons'
Plug 'ryanoasis/vim-devicons'
Plug 'yassinebridi/vim-purpura'
Plug 'joshdick/onedark.vim'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'evanleck/vim-svelte'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

if (has("termguicolors"))
	set termguicolors
endif

syntax on
colorscheme tokyonight-night
let g:airline_theme='hybrid'

set mouse=a
set clipboard+=unnamedplus
set nocompatible
set termguicolors
set number relativenumber
set nofoldenable

"self closing tags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.js,*.jsx, *.tsx, *.svelte'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx, *.tsx, *.svelte'
let g:closetag_shortcut = '>'

"keybinds
map <C-s> :Files<CR>
map <C-n> :NERDTreeToggle<CR>


"
" NERDTree
"

" Start NERDTree and put the cursor back in the other window.
silent! autocmd VimEnter * NERDTree | wincmd p

"Close NERDTree on file close
silent! autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
			\ && b:NERDTree.isTabTree()) | q | endif


"
" CoC 
"
let g:coc_global_extensions = ['coc-tsserver', 'coc-svelte','coc-tailwindcss', 'coc-prettier'] 

nnoremap <silent> K :call CocAction('doHover')<CR>

"use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
			\ coc#pum#visible() ? coc#pum#next(1) :
			\ CheckBackspace() ? "\<Tab>" :
			\ coc#refresh()

"Prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
map <C-p> :Prettier<CR>
