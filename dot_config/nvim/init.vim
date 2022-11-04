" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: Jie

" ==================== Editor behavior ====================
syntax on    " highlight your code
set nospell
set fileencodings=ucs-bom,utf-8,default,latin1
set foldlevel=99     
"set autoindent       
set ts=4            
set shiftwidth=4   
set expandtab     
set hidden
set undofile
set undodir=~/.local/share/nvim/undo
set background=dark
set termguicolors
set nrformats+=alpha
set path+=**
set wildmenu
set vb
set relativenumber
set nu
set cursorline  " Add a line to where your cursor are
set wrap
set showcmd
set scrolloff=5

set ignorecase
set smartcase
set hlsearch
exec "nohlsearch"
set incsearch




" ==================== Basic Mapping ====================

let maplocalleader = "'"
let mapleader = " "

imap jk <esc>
nmap ; :
nmap S :w<CR>
nmap Q :q<CR>
nmap J 5j
nmap K 5k
nnoremap n nzz
nnoremap N Nzz
nnoremap s <nop>
nnoremap <LEADER>/ :nohlsearch<CR>

"add \v automatically when i search 
nmap / /\v
map <silent> <C-e> :NERDTreeToggle<CR>
nnoremap <leader>rc :vsplit $HOME/.config/nvim/init.vim<cr>
nnoremap <leader>src :source $HOME/.config/nvim/init.vim<cr>
"Toggle the undo graph
nnoremap <F5> :MundoToggle<CR>
nnoremap <leader>n :cnext<cr>
nnoremap <leader>N :cprevious<cr>
"Toggle of paste mode
nnoremap <leader>sp :set paste<cr>
nnoremap <leader>sP :set nopaste<cr>


" ==================== Insert Mode Complement ====================
" inoremap ( ()<esc>i
" inoremap [ []<esc>i
inoremap <> <><esc>i
" inoremap { {}<esc>i
" inoremap ` ``<esc>i
" inoremap ' ''<esc>i
" inoremap " ""<esc>i
"skip out the block like ) > ] } " '
" inoremap )) <esc>f)a
" inoremap }} <esc>f}a
inoremap >> <esc>f>a
" inoremap ]] <esc>f]a
" inoremap "" <esc>f"a
" inoremap '' <esc>f'a


" ==================== Adding things in normal mode ====================
"to enter a \n when in the mode of normal
nnoremap <leader><cr> i<cr><esc>
"Add ;
nnoremap <leader>; mqA;<esc>`q


" ==================== Window management ====================
nnoremap <LEADER>g <C-w>h
nnoremap <LEADER>j <C-w>j
nnoremap <LEADER>k <C-w>k
nnoremap <LEADER>l <C-w>l
" splite the screens to up (horizontal), down (horizontal), left (vertical),
" right (vertical)
nnoremap sg :set nosplitright<CR>:vsplit<CR>:set splitright<CR> 
nnoremap sj :set splitbelow<CR>:split<CR>
nnoremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR> 
nnoremap sl :set splitright<CR>:vsplit<CR> 
" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>
" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H
" Press <LEADER> + q to close the window below the current window
" noremap <LEADER>q <C-w>j:q<CR>


" ==================== Terminal management ====================
noremap tt :set splitright<CR>:vsplit<CR>:terminal<CR>


" ==================== Install plugins with vim-plug ====================
call plug#begin('$HOME/.config/nvim/plugged')


"Markdown
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'} 
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
"Plug 'preservim/vim-markdown'
"Plug 'tamlok/vim-markdown'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }

"Python 
Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'tomtom/tcomment_vim' 
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'Yggdroot/indentLine' 

"Perl
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'bmeneg/coc-perl', {'do': 'yarn install && yarn build'}

"Status line
Plug 'vim-airline/vim-airline'
Plug 'godlygeek/tabular'
" Plug 'itchyny/lightline.vim'

"LaTeX
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

"File finder
""Plug 'yggdroot/leaderf', { 'do': ':LeaderfInstallCExtension' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

"Themes
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'  
" Plug 'mhartington/oceanic-next'
" Plug 'mg979/vim-xtabline'

"Visulize some original function
Plug 'junegunn/vim-peekaboo' "To peek the contents of the register when you hit \" or @ in normal mode
Plug 'simnalamburt/vim-mundo' "Visualising the undo tree
Plug 'scrooloose/nerdtree'
Plug 'kien/rainbow_parentheses.vim'

"The premier Vim plugin for Git
Plug 'tpope/vim-fugitive'

"Enhance text edit
Plug 'tpope/vim-surround' "To add surrounders
Plug 'gcmt/wildfire.vim' "To select text in surrounders
Plug 'fidian/hexmode' "Hex eidting in vim
Plug 'mileszs/ack.vim'
"Plug 'mg979/vim-visual-multi'  多光标
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-translator' " Translator
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vista.vim'

"quickfix
Plug 'kevinhwang91/nvim-bqf'

"highlighter
Plug 'RRethy/vim-illuminate'

"Ultisnips
Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

"Complement
"Plug 'valloric/youcompleteme'
"Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Use release branch (recommend)
Plug 'yaegassy/coc-nginx', {'do': 'yarn install --frozen-lockfile'}

" lazygit
Plug 'kdheepak/lazygit.nvim'

call plug#end()


" ==================== Mundo -- undo tree ====================
let g:mundo_width=60
let g:mundo_preview_hight=40
let g:mundo_right=1
let g:mundo_help = 1
let g:mundo_header = 1


" ==================== Gruvbox ====================
" g:gruvbox_transparent_bg = 1
colorscheme gruvbox
let g:airline_theme='gruvbox'


" ==================== Markdown ====================
" nnoremap <LEADER>pm :InstantMarkdownPreview<CR>

let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
let g:markdown_enable_folding = 1
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_mermaid = 1
"let g:instant_markdown_autoscroll = 0
" let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1


" ==================== LaTeX ====================
" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
"let g:vimtex_view_method = 'zathura'
"let g:vimtex_view_method = 'okular'
" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_enabled = 1

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
"let maplocalleader = ","


" ==================== Lazygit ====================
noremap <c-g> :LazyGit<CR>
let g:lazygitfloating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed


" ==================== UltiSnips ====================
"Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
"     - https://github.com/Valloric/YouCompleteMe
"   " - https://github.com/nvim-lua/completion-nvim
set runtimepath+=~/.vimultisnips_rep
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetStorageDirector='~/.vim/UltiSnips'
"   " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" ==================== Fzf ====================


" ==================== tcomment_vim ====================
"nnoremap ci cl
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cn g>c
vmap <LEADER>cn g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<


" ==================== coc.nvim ====================
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-vimlsp',
    \ 'coc-marketplace',
    \ 'coc-python',
    \ 'coc-clangd',
    \ 'coc-texlab',
    \ 'coc-sh',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-yaml',
    \ 'coc-perl',
    \ 'coc-snippets',]
    " \ 'coc-markmap',
    " \ 'coc-go',
    " \ 'coc-nginx'
    " \ 'coc-docker'

set hidden " The file which are not write will be hidden in buffer
set updatecount=100 " swap 
set shortmess+=c " less message

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" if has('nvim')
  inoremap <silent><expr> <c-o> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" " Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
" GoTo code navigation. where the function is defined.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> <LEADER>h :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
omap <leader>a  <Plug>(coc-codeaction-selected)


" ==================== coc-snippets ====================
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)


" ==================== vim-illuminate ====================
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=underline


" ==================== fzf ====================
nnoremap <LEADER>ff :<C-u>FZF<CR>
nnoremap <LEADER>fn :<C-u>FZF /home/jie/Blog/source/_posts/<CR>
nnoremap <LEADER>fb :Buffers<CR>
nnoremap <LEADER>fa :Ag<space>
nnoremap <LEADER>fh :History:<CR>


" ==================== xtabline ====================
" let g:xtabline_settings = {}
" let g:xtabline_settings.enable_mappings = 0
" let g:xtabline_settings.enabled = 1
" let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
" let g:xtabline_settings.enable_persistance = 0
" let g:xtabline_settings.last_open_first = 1


" ==================== airline ====================
""let g:airline#extensions#tabline#enabled = 1


" ==================== vim-which-key ====================
nnoremap <LEADER>wk :WhichKey '<space>'<CR>


" ==================== vim-translator ====================
" nnoremap <silent> <Leader>t <Plug>Translate
vnoremap <silent> <LEADER>t <Plug>TranslateV
" nnoremap <silent> <LEADER>h <Plug>TranslateH
" g:translator_target_lang='en'


" ==================== vim-table-mode ====================
let b:table_mode_corner='+'


" ==================== rainbow_parentheses.vim ====================
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" ==================== vista.vim ====================
nnoremap <LEADER>pf :Vista!!<CR>

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


" ==================== lightline.vim ====================
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'readonly', 'filename', 'modified', 'method' ] ]
"       \ },
"       \ 'component_function': {
"       \   'method': 'NearestMethodOrFunction'
"       \ },
"       \ }


" ==================== nvim.bqf ====================
nnoremap <LEADER>qo :copen<CR>
nnoremap <LEADER>qc :cclose<CR>


" ==================== vim-latex-live-preview ====================
nnoremap <LEADER>pl :LLPStartPreview<CR>
let g:livepreview_previewer = 'okular'
set updatetime=1000
" let g:livepreview_engine = 'your_engine' . ' [options]'
" let g:livepreview_texinputs = '/path1/to/files//:/path2/to/files//'
" let g:livepreview_use_biber = 1
" let g:livepreview_cursorhold_recompile = 0


" ====================  oceanic-next.vim ====================
" For Neovim 0.1.3 and 0.1.4
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" " Or if you have Neovim >= 0.1.5
" if (has("termguicolors"))
"  set termguicolors
" endif
"
" colorscheme OceanicNext
" let g:airline_theme='oceanicnext'
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" hi Normal guibg=NONE ctermbg=NONE
" hi LineNr guibg=NONE ctermbg=NONE
" hi SignColumn guibg=NONE ctermbg=NONE
" hi EndOfBuffer guibg=NONE ctermbg=NONE

" ==================== markdown-preview.nvim ====================
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1
" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0
" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0
" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''
" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''
" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0
" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''
" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''
" use a custom port to start server or empty for random
let g:mkdp_port = ''
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'light'
nnoremap <LEADER>pm <Plug>MarkdownPreview


" ==================== markmap ====================
nnoremap <LEADER>pn :!markmap %<CR>
