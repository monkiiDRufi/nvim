if exists('current_compiler')
  finish
endif
let current_compiler = 'novel'

" helper function to expand all markdown chapters
function! AllChapters()
  let novelfiles=join(glob('*.md', 1, 1), ' ')
  let capitulos=join(glob('capitulos/*.md', 1, 1), ' ')
  return novelfiles . ' ' . capitulos
endfunction

" compiler command
let &l:makeprg = 'pandoc ' . AllChapters() . ' -o "novel.pdf" --pdf-engine=xelatex --include-in-header=preable.tex'
CompilerSet errorformat=%f:%l:%c:%m
