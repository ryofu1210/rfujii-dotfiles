
" vimconfig保存後、reload
autocmd! bufwritepost $MYVIMRC source %
" autocmd! bufwritepost $MYVIMRC echo 'reload vimconfig'

set encoding=utf-8
set shell=/bin/zsh
set shiftwidth=2
set tabstop=2 "タブで移動する文字数を制御. デフォルト8文字
set expandtab " タブ挿入時にタブ記号ではなく半角スペースを使用します
set textwidth=0
set autoindent " 新しい行の挿入時にインデントを現在行と同じにします
set smartindent "	{}等を考慮してインデントを一段後ろへ設定します
set hlsearch
set clipboard=unnamed
set number
set wrap " 画面の端で行を折り返す
syntax on
set list listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%,space:_ "タブや改行文字、末尾の半角スペースなど、通常は非表示の文字を表示する
set helplang=ja,en
set autoread "ファイルが他で変更されている場合に自動的に読み直します

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes " 行番号の更に左に目印桁を表示します

set cursorline " カーソル位置がある行をハイライトします

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" set conceallevel=0
" hi link HelpBar Normal
" hi link HelpStar Normal

" vim-plugでプラグ管理 https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'preservim/nerdtree'
" Plug 'ntk148v/vim-horizon'

Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
" Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lambdalisue/fern.vim'
Plug 'vim-jp/vimdoc-ja' " vim helpを日本語化
Plug 'lambdalisue/gina.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sainnhe/gruvbox-material'
Plug 'pantharshit00/vim-prisma'
" Plug 'brglng/vim-im-select'

""" 以下の記事を参考にVimをVSCodeライクにした
" VimをVSCodeライクにする
" https://qiita.com/youichiro/items/b4748b3e96106d25c5bc#%E3%82%AB%E3%83%A9%E3%83%BC%E3%82%B9%E3%82%AD%E3%83%BC%E3%83%A0%E3%82%92vscode%E3%83%A9%E3%82%A4%E3%82%AF%E3%81%AB%E3%81%99%E3%82%8B
"
" いい感じのステータスバーを表示する https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" vscode likeのテーマ
Plug 'tomasiser/vim-code-dark'
" ファイルツリーにgitの差分を表示する
Plug 'lambdalisue/fern-git-status.vim'
" ファイルツリーにファイルのアイコンを表示する
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
" " gitで変更のある行の差分を表示する
" Plug 'airblade/vim-gitgutter'
" ファイルを検索する
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" coc-graphqlのインストールに必要なplugin
" https://github.com/felippepuhle/coc-graphql
Plug 'jparise/vim-graphql'

""" coc-nvimがあるため、tsuquyomiはもう不要
" " tsuquyomiに必要なplugin
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" " VimをTypeScript IDEライクにするplugin
" " https://honmushi.com/2020/04/04/tsukuyomi-vim-ts/
" " 補完(completion): i modeで<C-x> <C-o>
" " 定義元ジャンプ(navigation definition): 進む<C-]> 戻る<C-t>
" " 参照先一覧表示: <C-^>
" " 保存時にsyntax, semantic error表示
" " tsconfigはローカルを優先.見つからなければglobal
" Plug 'Quramy/tsuquyomi', { 'do': 'npm -g install typescript' }

" svelte syntax highlight plugin
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'tpope/vim-commentary'
call plug#end()

" tablineを表示する。tablineってどこのこと？
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'codedark'
let g:fern#renderer = 'nerdfont'

" map prefix
let g:mapleader = "\<Space>"
nnoremap <Leader> <Nop>
xnoremap <Leader> <Nop>
nnoremap [dev]    <Nop>
xnoremap [dev]    <Nop>
nmap     m        [dev]
xmap     m        [dev]
nnoremap [ff]     <Nop>
xnoremap [ff]     <Nop>
nmap     z        [ff]
xmap     z        [ff]
inoremap <silent> <C-[> <ESC>
inoremap <silent> jj <ESC>
inoremap <silent> っｊ <ESC>
" nnoremap [lsp] <Nop>
" nmap l [lsp]

"" 単語を{}で囲う
nmap \p i{<ESC>ea}<ESC>
"
"" 設定ファイル再読み込み
" :source $MYVIMRC
" reloadしたいがうまくいかない
" nmap <leader>r :<C-u>source $MYVI RC<CR>:echo 'rejoad vimconfig' 

"" :nohで検索した選択ハイライトを解除 


""" basic map設定
" craftzdogのmap設定を参考
" https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/lua/craftzdog/maps.lua

" カーソル位置から単語頭までを削除するみたい。この設定がどう役立つのかよくわからない

" クリップボードにコピーしないで削除
" キーワード削除時もコピーしないようにしたいがうまくいかない
" https://qiita.com/YumaInaura/items/e9bb84ff814588171e4f
nnoremap x "_x
" nnoremap dw "_dw


" Select all
" keymap.set('n', '<C-a>', 'gg<S-v>G')
nmap <C-a> gg<S-v>G

" うまく動かない
" -- New tab
" keymap.set('n', 'te', ':tabedit')
nmap te :tebedit<Return>
" -- Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" -- Move window
map sh <C-w>h
nmap sk <C-w>k
nmap sj <C-w>j
nmap sl <C-w>l

" -- Resize window
nmap s<left> <C-w><
nmap s<right> <C-w>>
nmap s<up> <C-w>+
nmap s<down> <C-w>-

" -- nohlsearch
" nmap <silent> <C-.> :<C-u>nohlsearch

" このあたりのキーマップは下記を参考
" https://knowledge.sakura.ad.jp/23121/#i-13
" スペース + wでファイル保存
nnoremap <Leader>w :w<CR>

" カーソル下の単語を、置換後の文字列の入力を待つ状態にする
nnoremap <Leader>re :%s;\<<C-R><C-W>\>;g<Left><Left>;

" Escを2回押すとハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR>

" Ctrl + j と Ctrl + k で 段落の前後に移動
nnoremap <C-j> }
nnoremap <C-k> {



"" coc.nvim
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint8', 'coc-prettier', 'coc-git', 'coc-fzf-preview', 'coc-lists', 'coc-prisma', 'coc-graphql', 'coc-svelte']

""" coc-nvimの設定は公式のExample vim configurationを参考 https://github.com/neoclide/coc.nvim

" この辺が何やっているのかよくわからない
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
"
" Use <c-space> to trigger completion.
inoremap <silent> <expr> <C-Space> coc#refresh()

"" <space>fでコードフォーマット
function! s:coc_typescript_settings() abort
  nnoremap <silent> <buffer> <leader>f :<C-u>CocCommand eslint.executeAutofix<CR>:CocCommand prettier.formatFile<CR>
endfunction

augroup coc_ts
  autocmd!
  autocmd FileType typescript,typescriptreact call <SID>coc_typescript_settings()
  " autocmd FileType typescript,typescriptreact nnoremap <Leader>w call <SID>coc_typescript_settings(); :w<CR>
augroup END

"" Kでドキュメンテーションを参照
" ローカル関数(関数名にs:をつけたfuction)をマップに定義する場合、<SID>をつける
" :<C-u>でコマンドラインの行頭から削除
nnoremap <silent> K       :<C-u>call <SID>show_documentation()<CR>
function! s:show_documentation() abort
  if index(['vim','help'], &filetype) >= 0
    execute 'h ' . expand('<cword>')
  elseif coc#rpc#ready()
    call CocActionAsync('doHover')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" ファイル全体をformatできるため、これは不要
" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" nmap     <silent> [dev]rn <Plug>(coc-rename)
" nmap     <silent> [dev]a  <Plug>(coc-codeaction-selected)iw

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> [dev]d  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> [dev]e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> [dev]c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> [dev]o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> [dev]s  :<C-u>CocList -I symbols<cr>
" この意味がよくわからない
" Do default action for next item.
nnoremap <silent><nowait> [dev]j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> [dev]k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> [dev]p  :<C-u>CocListResume<CR>

"" fzf-preview
" let $BAT_THEME                     = 'gruvbox-dark'
" let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'gruvbox-dark'

" nnoremap <silent> <C-p>  :<C-u>CocCommand fzf-preview.FromResources buffer project_mru project<CR>
" nnoremap <silent> [ff]s  :<C-u>CocCommand fzf-preview.GitStatus<CR>
" nnoremap <silent> [ff]gg :<C-u>CocCommand fzf-preview.GitActions<CR>
" nnoremap <silent> [ff]b  :<C-u>CocCommand fzf-preview.Buffers<CR>
" nnoremap          [ff]f  :<C-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<Space>
" xnoremap          [ff]f  "sy:CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"

" nnoremap <silent> [ff]q  :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>
" nnoremap <silent> [ff]rf :<C-u>CocCommand fzf-preview.CocReferences<CR>
" nnoremap <silent> [ff]d  :<C-u>CocCommand fzf-preview.CocDefinition<CR>
" nnoremap <silent> [ff]t  :<C-u>CocCommand fzf-preview.CocTypeDefinition<CR>
" nnoremap <silent> [ff]o  :<C-u>CocCommand fzf-preview.CocOutline --add-fzf-arg=--exact --add-fzf-arg=--no-sort<CR>

"" fern
"" Space-eでFinderが開くのはたぶんこの設定のおかげ
nnoremap <silent> <Leader>e :<C-u>Fern . -drawer<CR>
nnoremap <silent> <Leader>E :<C-u>Fern . -drawer -reveal=%<CR>
let g:fern#default_hidden=1 " 隠しファイルを表示

" fernのkeybinding
" S-n new-file
" S-k new-dir
" S-d remove
" m   move
" C-r rename

" Fernのkeybindingのカスタム設定を行う場合、ここに書く
" https://github.com/lambdalisue/fern.vim#customize
function! s:init_fern() abort
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

"" treesitter
"lua <<EOF
"require('nvim-treesitter.configs').setup {
"  ensure_installed = {
"    "typescript",
"    "tsx",
"  },
"  highlight = {
"    enable = true,
"  },
"}
"EOF

colorscheme codedark 

"" git操作
" g]で前の変更箇所へ移動する
nnoremap g[ :GitGutterPrevHunk<CR>
" g[で次の変更箇所へ移動する
nnoremap g] :GitGutterNextHunk<CR>
" ghでdiffをハイライトする
nnoremap gh :GitGutterLineHighlightsToggle<CR>
" gpでカーソル行のdiffを表示する
nnoremap gp :GitGutterPreviewHunk<CR>
" 記号の色を変更する
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red

"" 反映時間を短くする(デフォルトは4000ms)
set updatetime=250

"" fzf.vim
" Ctrl+pでファイル検索を開く
" git管理されていれば:GFiles、そうでなければ:Filesを実行する
"
" 2022/10/31修正
" GFilesだと、gitで管理していない新規ファイルが検索結果に含まれない
" プロジェクト外のファイルまで検索結果に含めてしまうという問題があるので、
" :Filesの検索に統一する
fun! FzfOmniFiles()
  :Files
  " let is_git = system('git status')
  " if v:shell_error
  "   :Files
  " else
  "   :GFiles
  " endif
endfun
nnoremap <C-p> :call FzfOmniFiles()<CR>

" Ctrl+gで文字列検索を開く
" <S-?>でプレビューを表示/非表示する
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
\ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
\ <bang>0)
nnoremap <C-g> :Rg<CR>

" frでカーソル位置の単語をファイル検索する
nnoremap fr vawy:Rg <C-R>"<CR>
" frで選択した単語をファイル検索する
xnoremap fr y:Rg <C-R>"<CR>

" fbでバッファ検索を開く
nnoremap fb :Buffers<CR>
" fpでバッファの中で1つ前に開いたファイルを開く
nnoremap fp :Buffers<CR><CR>
" flで開いているファイルの文字列検索を開く
nnoremap fl :BLines<CR>
" fmでマーク検索を開く
nnoremap fm :Marks<CR>
" fhでファイル閲覧履歴検索を開く
nnoremap fh :History<CR>
" fcでコミット履歴検索を開く
nnoremap fc :Commits<CR>
