" vimtex - LaTeX plugin for Vim
"
" Maintainer: Karl Yngve Lervåg
" Email:      karl.yngve@gmail.com
"

function! vimtex#imaps#init_options() " {{{1
  call vimtex#util#set_default('g:vimtex_imaps_enabled', 1)
  call vimtex#util#set_default('g:vimtex_imaps_leader', '`')
  call vimtex#util#set_default('g:vimtex_imaps_disabled', [])
  call vimtex#util#set_default('g:vimtex_imaps_list', [
        \ { 'lhs_rhs' : ['...',   '\dots'],               'leader' : '' },
        \ { 'lhs_rhs' : ['<m-i>', '\item '],              'leader' : '' },
        \ { 'lhs_rhs' : ['__',    '_\{$1\}'],             'leader' : '',   'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['^^',    '^\{$1\}'],             'leader' : '',   'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['((',    '\left($1\right)'],     'leader' : '',   'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['[[',    '\left[$1\right]'],     'leader' : '',   'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['{{',    '\left\\{$1\right\\}'], 'leader' : '',   'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['i',     '\int_{$1}^{$2}'],      'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['S',     '\sum_{$1}^{$2}'],      'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['/',     '\frac{$1}{$2}'],       'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['0',     '\emptyset'],           'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['6',     '\partial'],            'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['8',     '\infty'],              'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['=',     '\equiv'],              'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['\',     '\setminus'],           'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['.',     '\cdot'],               'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['*',     '\times'],              'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['<',     '\leq'],                'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['>',     '\geq'],                'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['~',     '\tilde{$1}'],          'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['^',     '\hat{$1}'],            'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : [':',     '\dot{$1}'],            'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['_',     '\bar{$1}'],            'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['lim',   '\lim_{$1}'],           'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['qj',    '\downarrow'],          'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['ql',    '\leftarrow'],          'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['qh',    '\rightarrow'],         'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['qk',    '\uparrow'],            'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['qJ',    '\Downarrow'],          'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['qL',    '\Leftarrow'],          'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['qH',    '\Rightarrow'],         'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['qK',    '\Uparrow'],            'wrapper' : 's:wrap_math_ultisnips'},
        \ { 'lhs_rhs' : ['a',     '\alpha'],              'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['b',     '\beta'],               'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['c',     '\chi'],                'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['d',     '\delta'],              'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['e',     '\varepsilon'],         'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['f',     '\varphi'],             'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['g',     '\gamma'],              'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['h',     '\eta'],                'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['k',     '\kappa'],              'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['l',     '\lambda'],             'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['m',     '\mu'],                 'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['n',     '\nu'],                 'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['p',     '\pi'],                 'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['q',     '\theta'],              'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['r',     '\rho'],                'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['s',     '\sigma'],              'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['t',     '\tau'],                'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['u',     '\upsilon'],            'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['w',     '\omega'],              'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['z',     '\zeta'],               'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['A',     '\Alpha'],              'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['B',     '\Beta'],               'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['G',     '\Gamma'],              'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['D',     '\Delta'],              'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['E',     '\Epsilon'],            'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['Z',     '\Zeta'],               'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['Y',     '\Eta'],                'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['F',     '\Phi'],                'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['G',     '\Gamma'],              'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['L',     '\Lambda'],             'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['N',     '\Nabla'],              'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['Q',     '\Theta'],              'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['R',     '\varrho'],             'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['T',     '\Tau'],                'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['U',     '\Upsilon'],            'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['W',     '\Omega'],              'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['X',     '\Xi'],                 'wrapper' : 's:wrap_math'},
        \ { 'lhs_rhs' : ['Y',     '\Psi'],                'wrapper' : 's:wrap_math'},
        \])
endfunction

" }}}1
function! vimtex#imaps#init_script() " {{{1
  let s:has_ultisnips = exists('*UltiSnips#Anon')
endfunction

" }}}1
function! vimtex#imaps#init_buffer() " {{{1
  if !g:vimtex_imaps_enabled | return | endif

  for l:map in g:vimtex_imaps_list
    call vimtex#imaps#add_map(l:map)
  endfor
endfunction

" }}}1

function! vimtex#imaps#add_map(map) " {{{1
  let l:lhs = a:map.lhs_rhs[0]
  if index(g:vimtex_imaps_disabled, l:lhs) >= 0 | return | endif

  let l:rhs = a:map.lhs_rhs[1]
  if match(l:rhs, '$1') > 0 && !s:has_ultisnips | return | endif

  let l:leader = get(a:map, 'leader', g:vimtex_imaps_leader)
  let l:wrapper = get(a:map, 'wrapper', '')

  " Escape leader if it exists
  if l:leader !=# '' && !hasmapto(l:leader, 'i')
    silent execute 'inoremap <silent><buffer>' l:leader . l:leader l:leader
  endif

  " Apply wrapper
  if l:wrapper !=# '' && exists('*' . l:wrapper)
    let l:rhs = call(l:wrapper, [l:lhs, l:rhs])
  endif

  " Add mapping
  silent execute 'inoremap <silent><buffer>' l:leader . l:lhs l:rhs
endfunction

" }}}1

"
" Wrappers
"
function! s:wrap_math(lhs, rhs) " {{{1
  return '<c-r>=<sid>is_math() ? ' . string(a:rhs)
        \ . ' : ' . string(a:lhs) . '<cr>'
endfunction

" }}}1
function! s:wrap_ultisnips(lhs, rhs) " {{{1
  return a:lhs . '<c-r>=UltiSnips#Anon('''
        \ . a:rhs . ''', ''' . a:lhs . ''', '''', ''i'')<cr>'
endfunction

" }}}1
function! s:wrap_math_ultisnips(lhs, rhs) " {{{1
  return a:lhs . '<c-r>=<sid>is_math() ? '
        \ . 'UltiSnips#Anon(''' . a:rhs . ''', ''' . a:lhs . ''', '''', ''i'')'
        \ . ': ''''<cr>'
endfunction

" }}}1

"
" Helper functions
"
function! s:is_math() " {{{1
  return match(map(synstack(line('.'), max([col('.') - 1, 1])),
        \ 'synIDattr(v:val, ''name'')'), '^texMathZone[A-Z]$') >= 0
endfunction

" }}}1

" vim: fdm=marker sw=2
