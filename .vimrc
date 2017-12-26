"* syntastic+flake8+pylint
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Vimjas/vim-python-pep8-indent'
"* Хоткеи для pep8, убирания хвостовых пробелов.
"* Подсветка ошибок синтакиса, необъявленных переменных и неиспользуемых переменных в питоне
Plugin 'scrooloose/syntastic'
"* Нормальные цвета для выделенных слов и прочие нормальные цвета
Plugin 'flazz/vim-colorschemes'

call vundle#end()            " required

set nocompatible
set bs=2
set fileencoding=utf8
set encoding=utf8
set showmode
set mousehide
set hlsearch
set incsearch
set formatoptions+=cro

"Что мне нужно:
"
"1. Подсветка синтаксиса
syntax on

"* 4 пробела вместо таба в js и python и html.
set ts=4
set expandtab
set softtabstop=4
set shiftwidth=4
set smartindent
set smarttab " ???
set colorcolumn=81
"* Показ хвостовых пробелов и убирание их в js и python по сохранению,
"F5 в normal mode удаляет trailing spaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
autocmd BufWritePre * %s/\s\+$//e


"* Показ номеров строк
set number

"* Перенос строк
filetype indent plugin on

"* Маппинг русских буков
set keymap=russian-jcukenwin
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" Раскладка по умолчанию - английская
set iminsert=0
" аналогично для строки поиска и ввода команд
set imsearch=0

" Делается только для react-hot-reload, иначе работает через раз
set backupcopy=yes

"* http://stackoverflow.com/questions/130734/how-can-one-close-html-tags-in-vim-quickly
"mkdir ~/.vim/scripts/
"cp closetag.vim ~/.vim/scripts/
"ctrl+_ - close tag
au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim

"* http://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END


"* Чуть более удобные табы
nnoremap <C-A-PageUp> gt
nnoremap <C-A-PageDown> gT

" Делаем так, чтоб syntastic сам не дергался проверять python автоматом,
" иначе ужасно тормозит
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
nnoremap <C-]> :SyntasticCheck<CR>

"* Цвета
colorscheme railscasts " Можно варьировать, есть куча разных цветовых схем
"set termguicolors
"let ayucolor="light"
"colorscheme ayu

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" поддержка virtualenv
let g:pymode_virtualenv = 1

