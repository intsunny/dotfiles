" Nvim configuration (compatible with vim 8)

" FEATURES
""""""""""""""""""""""""""""""
" - Have multiple clickable tabs like modern IDE's
" - Be more mouse driven
" - Have modern syntax and white space handling

" GOALS
""""""""""""""""""""""""""""""
" - Document everything.
"     These settings are rarely changed. It is all that more important to
"     document why a setting exists.
" - Be minimal in derivations of default behavior.
"     Ops people do not always have the luxury of selecting editors or
"     editor settings.
" - Default to nvim defaults.
"     Manually specify nvim defaults to ensure vim 8 also changes
"     Nvim provides a quick overview of various default differences:
"     https://neovim.io/doc/user/vim_diff.html
" - For non-plugin settings, be fully backwards compatible with vim 8.

" PLUGINS
""""""""""""""""""""""""""""""
" nerdtree - file browsing
" airline - advanced status and mouse clickale tab line
" fzf - code and file search
" coc - code completion

" ONE FUNDAMENTAL/MASSIVE CHANGE
""""""""""""""""""""""""""""""
" By default 'delete' behaves more like 'cut' than actual delete
" This can be rather annoying, especially with more mouse interaction
" Remap keys to use the blackhole register so that contents in the
" clipboard are not overridden by delete actions.
nnoremap dd "_dd
vnoremap dd "_dd
nnoremap x "_x
vnoremap x "_x


" GENERAL SETTINGS
set belloff=all         " Turn off the bell for all actions.
                        " https://neovim.io/doc/user/options.html#'belloff'
set complete=.,w,b,u,t  " Modify how code completion works in insert and replace mode
                        " Defaults differ on vim 8.
                        " https://neovim.io/doc/user/options.html#'complete'
set history=1000        " Set history to 1000
                        " https://neovim.io/doc/user/options.html#'history'
set viminfo+=!          " TODO: Document this
                        " https://neovim.io/doc/user/vim_diff.html#nvim-defaults

" File handling
set autoread  " Read external changes to a file currently open.
              " Not default in vim 8.
              " https://neovim.io/doc/user/options.html#'autoread'
set fsync     " Run system library fsync() after writing a file
              " Default in vim 8, not on nvim.
              " https://neovim.io/doc/user/options.html#'fsync'

" BACKUP SETTINGS
set backup
if has('nvim')
  set backupdir=~/.local/share/nvim/backup  " https://neovim.io/doc/user/options.html#'backupdir'
  set undodir=~/.local/share/nvim/undodir   " https://neovim.io/doc/user/options.html#'undodir'
else
  set backupdir=~/.vim/backups              " https://vimhelp.org/options.txt.html#'backupdir'
  set undodir=~/.vim/undodir                " https://vimhelp.org/options.txt.html#'undodir'
endif

" MOUSE SETTINGS
set mouse=a             " This enables visual mouse support in all modes
                        " https://neovim.io/doc/user/options.html#'mouse'
if !has('nvim')
  set ttymouse=xterm2   " Set mouse type to work in screen
                        " https://neovim.io/doc/user/vim_diff.html#nvim-features-removed
                        " https://vimhelp.org/options.txt.html#'ttymouse'
endif
set clipboard+=unnamed  " Use the OS clipboard
                        " https://neovim.io/doc/user/options.html#'clipboard'

" Window style
if has('nvim')
  set display=lastline,msgsep  " TODO: Document this.
                               " https://neovim.io/doc/user/options.html#'display'
endif
set laststatus=2               " Always have the last window have a status line. Vim 8 defaults differ.
                               " https://neovim.io/doc/user/options.html#'laststatus'
set lazyredraw                 " Improve performance when using plugins and macros. Not default on vim 8.
                               " https://neovim.io/doc/user/options.html#'lazyredraw'
set ruler                      " Show ruler. Not default on vim 8.
                               " https://neovim.io/doc/user/options.html#'ruler'
set showcmd                    " Show command in last line of screen. Not default in vim 8.
                               " https://neovim.io/doc/user/options.html#'showcmd'
set number			  	           " Show line numbers.
                               " https://neovim.io/doc/user/options.html#'number'
set ttyfast                    " Always set in nvim. Not default in vim 8.
                               " https://neovim.io/doc/user/vim_diff.html#nvim-features-removed


" Editing
nnoremap Q <nop>                " Fuck ex mode. Burn it with the fire of a thousand suns.
filetype plugin indent on       " TODO: Document this.
                                " https://neovim.io/doc/user/vim_diff.html#nvim-features-removed
set autoindent                  " Continue indentation from previous line. Not default on vim 8.
                                " https://neovim.io/doc/user/options.html#'autoindent'
set backspace=indent,eol,start  " Change behavior of backspace key. Vim 8 defaults differ.
                                " https://neovim.io/doc/user/options.html#'backspace'
set formatoptions=tcqj          " TODO: Document this.
                                " https://neovim.io/doc/user/options.html#'formatoptions'
set showmatch                   " Show matching brackets when text indicator is over them. Not default in vim 8.
                                " https://neovim.io/doc/user/options.html#'showmatch'
set matchtime=2                 " Tenths of a second to show a matching paren. Vim 8 defaults differ.
                                " https://neovim.io/doc/user/options.html#'matchtime'
set smartindent                 " TODO: Document this.
                                " TODO: Verify this is overridable by 'filetype plugin indent on'
                                " https://neovim.io/doc/user/options.html#'smartindent'
set startofline                 " Do not move the cursor to the front of the line for various commands.
                                " Not default in vim 8.
                                " https://neovim.io/doc/user/options.html#'startofline'
set ttimeoutlen=50              " Time in milliseconds to wait for a key code sequence to complete.
                                " Not enabled by default in vim 8,
                                " https://neovim.io/doc/user/options.html#'ttimeoutlen'
set whichwrap+=<,>,h,l          " Make vim move to the prior/next line when reaching the first/last character
                                " in a line. Ironically not recommended by nvim or vim.
                                " https://neovim.io/doc/user/options.html#'whichwrap'
set wildmenu                    " Enables "enhanced mode" of command-line completion. Not default in vim 8.
                                " https://neovim.io/doc/user/options.html#'wildmenu'
if has('nvim')
  set wildoptions=pum,tagfile   " Change how command line completion is done. Vim 8 defaults differ.
                                " https://neovim.io/doc/user/options.html#'wildoptions'
endif
set wrap                        " Wrap long lines. Not default on vim 8.
                                " https://neovim.io/doc/user/options.html#'wildoptions'
syntax on
" TODO: cursor styles

" Searching
set hlsearch    " Highlight search results. Not default on vim 8.
                " https://neovim.io/doc/user/options.html#'hlsearch'
set ignorecase  " Ignore case when searching
                " https://neovim.io/doc/user/options.html#'ignorecase'
set incsearch   " Show matches as they are typed. Not default on vim 8.
                " https://neovim.io/doc/user/options.html#'incsearch'

" TABS
set expandtab     " Use spaces instead of tabs (aka softtabs)
                  " https://neovim.io/doc/user/options.html#'expandtab'
set shiftwidth=2  " Set (auto)indents to two spaces
                  " https://neovim.io/doc/user/options.html#'shiftwidth'
set smarttab      " TODO: Document this. Not default on vim 8.
                  " https://neovim.io/doc/user/options.html#'smarttab'
set tabstop=2     " Set tabs to two spaces
                  " https://neovim.io/doc/user/options.html#'tabstop'

" Plugins
"  - all plugin settings are for nvim only
"  - all plugins use vim-plug
"  - Install in *nix like so:
"      curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   - Install plugins in vim: :PlugInstall

if has('nvim')

  " Install needed plugins
  call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Depends on fzf and ripgrep binaries
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'preservim/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  call plug#end()

  " Airline
  let g:airline#extensions#tabline#enabled = 1          " Automatically displays all buffers when there's only one tab open.
                                                        " search: https://github.com/vim-airline/vim-airline
  let g:airline#extensions#tabline#buffer_nr_show = 1   " Show buffer numbers on tabs

  " coc
  " coc is configured below

  " Nerd tree
  " The below automatically opens nerdtree, and quits nerdtree if the last
  " buffer has been closed
  augroup nerdtree_open
      autocmd!
      autocmd VimEnter * NERDTree | wincmd p
      autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  augroup END
  let NERDTreeMapOpenInTab='\r'  " Open file in new tab
  let NERDTreeMinimalUI = 1      " Hide bookmarks label
  let NERDTreeMouseMode = 2      " Use the mouse to open files

endif  " End of if has('nvim')

" coc configuration
" These settings are directly copied from: https://github.com/neoclide/coc.nvim/blob/master/README.md
if has('nvim')
	" TextEdit might fail if hidden is not set.
	set hidden

	" Give more space for displaying messages.
	set cmdheight=2

	" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
	" delays and poor user experience.
	set updatetime=300

	" Don't pass messages to |ins-completion-menu|.
	set shortmess+=c

	" Always show the signcolumn, otherwise it would shift the text each time
	" diagnostics appear/become resolved.
	set signcolumn=yes

	" Use tab for trigger completion with characters ahead and navigate.
	" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
	" other plugin before putting this into your config.
	inoremap <silent><expr> <TAB>
			 \ pumvisible() ? "\<C-n>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-space> coc#refresh()

	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
	" position. Coc only does snippet and additional edit on confirm.
	if exists('*complete_info')
		inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
	else
		imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	endif

	" Use `[g` and `]g` to navigate diagnostics
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window.
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
		else
			call CocAction('doHover')
		endif
	endfunction

	" Highlight the symbol and its references when holding the cursor.
	autocmd CursorHold * silent call CocActionAsync('highlight')

	" Symbol renaming.
	nmap <leader>rn <Plug>(coc-rename)

	" Formatting selected code.
	xmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)

	augroup mygroup
		autocmd!
		" Setup formatexpr specified filetype(s).
		autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
		" Update signature help on jump placeholder.
		autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end

	" Applying codeAction to the selected region.
	" Example: `<leader>aap` for current paragraph
	xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)

	" Remap keys for applying codeAction to the current line.
	nmap <leader>ac  <Plug>(coc-codeaction)
	" Apply AutoFix to problem on the current line.
	nmap <leader>qf  <Plug>(coc-fix-current)

	" Introduce function text object
	" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
	xmap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap if <Plug>(coc-funcobj-i)
	omap af <Plug>(coc-funcobj-a)

	" Use <TAB> for selections ranges.
	" NOTE: Requires 'textDocument/selectionRange' support from the language server.
	" coc-tsserver, coc-python are the examples of servers that support it.
	nmap <silent> <TAB> <Plug>(coc-range-select)
	xmap <silent> <TAB> <Plug>(coc-range-select)

	" Add `:Format` command to format current buffer.
	command! -nargs=0 Format :call CocAction('format')

	" Add `:Fold` command to fold current buffer.
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	" Add `:OR` command for organize imports of the current buffer.
	command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

	" Add (Neo)Vim's native statusline support.
	" NOTE: Please see `:h coc-status` for integrations with external plugins that
	" provide custom statusline: lightline.vim, vim-airline.
	set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

	" Mappings using CoCList:
	" Show all diagnostics.
	nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions.
	nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
	" Show commands.
	nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
	" Find symbol of current document.
	nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
	" Search workspace symbols.
	nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
	" Do default action for next item.
	nnoremap <silent> <space>j  :<C-u>CocNext<CR>
	" Do default action for previous item.
	nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
	" Resume latest coc list.
	nnoremap <silent> <space>p  :<C-u>CocListResume<CR> 
endif  " End of if has('nvim') for coc
