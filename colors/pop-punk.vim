" Pop-Punk
"
" by Jeff Auriemma
" @bignimbus

scriptencoding utf8

set t_Co=256
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"
let g:colors_name = "pop-punk"

" Palette

let s:white = ['#ffffff', 231]
let s:gray_1 = ['#1a1a1a', 102]
let s:gray_2 = ['#2e373e', 102]
let s:gray_3 = ['#3a3a3a', 102]
let s:gray_4 = ['#767c88', 109]
let s:gray_5 = ['#8b8a7c', 109]
let s:gray_6 = ['#909da8', 103]
let s:gray_7 = ['#939aa8', 103]
let s:black = ['#000000', 16]
let s:eggshell = ['#ffffcd', 230]
let s:mauve = ['#e4dfff', 189]
let s:blue = ['#0088ff', 33]
let s:teal = ['#40e0d0', 44]
let s:magenta = ['#c526ff', 165]
let s:burgundy = ['#5f2a5f', 53]
let s:red_1 = ['#d70061', 161]
let s:red_2 = ['#ff0044', 196]
let s:orange = ['#ff9d00', 214]
let s:sun = ['#ffdd00', 214]
let s:yellow = ['#ffff00', 226]
let s:pink = ['#f9e0f5', 225]
let s:green = ['#3ad900', 40]
let s:cobalt_1 = ['#306b8f', 24]
let s:cobalt_2 = ['#445291', 24]

let s:none      = ['NONE', 'NONE']

" User Configuration

if !exists('g:pop_punk_bold')
  let g:pop_punk_bold = 1
endif

if !exists('g:pop_punk_italic')
  let g:pop_punk_italic = 1
endif

if !exists('g:pop_punk_underline')
  let g:pop_punk_underline = 1
endif

if !exists('g:pop_punk_undercurl') && g:pop_punk_underline != 0
  let g:pop_punk_undercurl = 1
endif

if !exists('g:pop_punk_inverse')
  let g:pop_punk_inverse = 1
endif

if !exists('g:pop_punk_colorterm')
  let g:pop_punk_colorterm = 1
endif

" Script Helpers

let s:attrs = {
      \ 'bold': g:pop_punk_bold == 1 ? 'bold' : 0,
      \ 'italic': g:pop_punk_italic == 1 ? 'italic' : 0,
      \ 'underline': g:pop_punk_underline == 1 ? 'underline' : 0,
      \ 'undercurl': g:pop_punk_undercurl == 1 ? 'undercurl' : 0,
      \ 'inverse': g:pop_punk_inverse == 1 ? 'inverse' : 0,
      \}

function! s:h(scope, fg, ...) " bg, attr_list, special
  let l:fg = copy(a:fg)
  let l:bg = get(a:, 1, ['NONE', 'NONE'])

  let l:attr_list = filter(get(a:, 2, ['NONE']), 'type(v:val) == 1')
  let l:attrs = len(l:attr_list) > 0 ? join(l:attr_list, ',') : 'NONE'

  let l:special = get(a:, 3, ['NONE', 'NONE'])
  " Falls back to coloring foreground group on terminals because
  " nearly all do not support undercurl
  " if l:special[0] !=# 'NONE' && l:fg[0] ==# 'NONE' && !has('gui_running')
  "   let l:fg[0] = l:special[0]
  "   let l:fg[1] = l:special[1]
  " endif

  let l:hl_string = [
        \ 'highlight', a:scope,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:attrs, 'cterm=' . l:attrs,
        \ 'guisp=' . l:special[0],
        \]

  execute join(l:hl_string, ' ')
endfunction

" User Interface

set background=dark

" Required as some plugins will overwrite
call s:h('Normal', s:white, s:black)

call s:h('StatusLine', s:white, s:black, [s:attrs.bold])
call s:h('StatusLineNC', s:white, s:black, [s:attrs.bold])
" call s:h('StatusLineTerm', s:none, s:bglighter, [s:attrs.bold])
" call s:h('StatusLineTermNC', s:none, s:bglight)
call s:h('WildMenu', s:none, s:gray_6)
call s:h('Cursor', s:black, s:mauve)
call s:h('CursorLine', s:none, s:gray_1)
call s:h('CursorColumn', s:none, s:gray_1)
call s:h('CursorLineNr', s:yellow, s:none)
call s:h('Debug', s:gray_5, s:none)
call s:h('DiffAdd', s:none, s:gray_3)
call s:h('DiffChange', s:eggshell, s:cobalt_1)
call s:h('DiffDelete', s:red_2, s:none)
" call s:h('DiffRemoved', s:red_2, s:none)
call s:h('DiffText', s:eggshell, s:burgundy)
call s:h('Directory', s:blue, s:none)
call s:h('ErrorMsg', s:red_2, s:none)
call s:h('FoldColumn', s:gray_1, s:gray_6, [s:attrs.italic])
call s:h('Folded', s:gray_1, s:gray_6, [s:attrs.italic])
call s:h('IncSearch', s:white, s:blue)
call s:h('LineNr', s:gray_7, s:black)
" call s:h('MoreMsg', s:gray_7, s:black)
call s:h('NonText', s:gray_2, s:none)
call s:h('Pmenu', s:white, s:gray_2)
call s:h('PmenuSbar', s:none, s:gray_2)
call s:h('PmenuSel', s:white, s:red_1)
call s:h('PmenuThumb', s:none, s:cobalt_1)
" call s:h('Question', s:none, s:gray_7)
call s:h('Search', s:white, s:blue)
call s:h('SignColumn', s:gray_1, s:black)
call s:h('TabLine', s:black, s:gray_7)
call s:h('TabLineFill', s:black, s:gray_7)
call s:h('TabLineSel', s:white, s:black, [s:attrs.bold])
call s:h('Title', s:white, s:none)
call s:h('VertSplit', s:gray_7, s:black, [s:attrs.bold])
call s:h('Visual', s:gray_1, s:mauve)
" call s:h('VisualNOS', s:gray_1, s:mauve)
call s:h('WarningMsg', s:gray_1, s:sun)

" Syntax

" Required as some plugins will overwrite
call s:h('MatchParen', s:white, s:blue)
" call s:h('Conceal', s:cyan, s:none)

call s:h('SpecialKey', s:sun, s:none)

call s:h('Comment', s:blue, s:none, [s:attrs.italic])
" call s:h('Underlined', s:blue, s:none, [s:attrs.italic])
call s:h('Todo', s:orange, s:black)

call s:h('Error', s:red_2, s:none)
call s:h('SpellBad', s:none, s:none, [s:attrs.undercurl], s:red_2)
" call s:h('SpellLocal', s:none, s:none, [s:attrs.undercurl], s:red_2)
call s:h('SpellCap', s:none, s:none)
" call s:h('SpellRare', s:none, s:none)

call s:h('Constant', s:red_2, s:none)
call s:h('String', s:green, s:none)
call s:h('Character', s:red_2, s:none)
hi! link Character Constant
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant

call s:h('Identifier', s:teal, s:none)
call s:h('Function', s:teal, s:none, [s:attrs.bold])

call s:h('Statement', s:orange, s:none, [s:attrs.bold])
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Operator Statement
hi! link Exception Statement
call s:h('Keyword', s:sun, s:none, [s:attrs.bold])

call s:h('PreProc', s:magenta, s:none)
hi! link Include PreProc
hi! link PreCondit PreProc
call s:h('Define', s:gray_5, s:none)
call s:h('Macro', s:sun, s:none)
call s:h('StorageClass', s:teal, s:none, [s:attrs.bold])
hi! link Typedef StorageClass
call s:h('Structure', s:orange, s:none, [s:attrs.bold])

call s:h('Type', s:teal, s:none, [s:attrs.bold])

call s:h('Delimiter', s:gray_5, s:none)

call s:h('Special', s:magenta, s:none, [s:attrs.bold])
call s:h('SpecialComment', s:blue, s:none, [s:attrs.bold])
call s:h('Tag', s:orange, s:none)

call s:h('CocErrorFloat', s:red_2, s:none, [s:attrs.bold])
call s:h('CocWarningFloat', s:orange, s:none, [s:attrs.bold])

" hi! link helpHyperTextJump PopPunkLink
" hi! link helpCommand PopPunkPurple
" hi! link helpExample PopPunkGreen
" hi! link helpBacktick Special
" hi! link ColorColumn  PopPunkBgDark
" call s:h('DiffAdded', s:none, s:gray_3)