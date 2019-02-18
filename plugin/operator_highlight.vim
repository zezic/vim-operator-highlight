" Copyright (C) 2011 by Strahinja Markovic
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

if exists( 'g:loaded_operator_highlight' )
  finish
else
  let g:loaded_operator_highlight = 1
endif

if !exists( 'g:ophigh_color_gui' )
  let g:ophigh_color_gui = "cyan"
endif

if !exists( 'g:ophigh_highlight_link_group' )
  let g:ophigh_highlight_link_group = ""
endif


if !exists( 'g:ophigh_color' )
  let g:ophigh_color = "cyan"
endif

if !exists( 'g:ophigh_filetypes' )
  let g:ophigh_filetypes = ['cpp']
endif

fun! s:HighlightOperators()
  if index(g:ophigh_filetypes, &filetype) == -1
    return
  endif

  " for the last element of the regex, see :h /\@!
  " basically, searching for "/" is more complex since we want to avoid
  " matching against "//" or "/*" which would break C++ comment highlighting
  syntax match OperatorChars "\^\|?\|+\|-\|\*\|:\|<\|>\|&\||\|!\|\~\|%\|=\|/\(/\|*\)\@!"
  syntax match Noise "(\|)\|{\|}\|\[\|\]\|;\|\.\|,\|::\|->"

endfunction

au Syntax * call s:HighlightOperators()
au ColorScheme * call s:HighlightOperators()
