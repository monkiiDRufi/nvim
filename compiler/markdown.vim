if exists('current_compiler')
    finish
endif

let current_compiler='markdown'
CompilerSet makeprg=pandoc\ \"%\"\ -o\ \"%:r.pdf\"
CompilerSet errorformat=%f:%l:%c:%m
