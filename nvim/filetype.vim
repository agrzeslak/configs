augroup filetypedetect
  " Help filetype detection
  autocmd BufRead *.plot set filetype=gnuplot
  autocmd BufRead *.md set filetype=markdown
  autocmd BufRead *.lds set filetype=ld
  autocmd BufRead *.tex set filetype=tex
  autocmd BufRead *.trm set filetype=c
  autocmd BufRead *.xlsx.axlsx set filetype=ruby

  " Prevent accidental writes to buffers that shouldn't be edited
  autocmd BufRead *.orig set readonly
  autocmd BufRead *.pacnew set readonly

  " Mail
  autocmd BufRead,BufNewFile /tmp/mutt* setfiletype mail
  autocmd Filetype mail setlocal spell tw=72 colorcolumn=73
  autocmd Filetype mail setlocal fo+=w

  " Git commit message
  autocmd Filetype gitcommit setlocal spell tw=72 colorcolumn=73

  " nftables
  autocmd BufRead,BufNewFile *.nft setfiletype nftables

  " Shorter columns in text
  autocmd Filetype tex setlocal spell tw=80 colorcolumn=81
  autocmd Filetype text setlocal spell tw=80 colorcolumn=81
  autocmd Filetype markdown setlocal spell tw=80 colorcolumn=81

  " Follow Rust code style rules
  autocmd Filetype rust setlocal tw=100 colorcolumn=101

  " Black auto-formatter max line length of 88
  autocmd Filetype python setlocal tw=88 colorcolumn=89

  " File types with 2 spaces for indentation
  autocmd FileType javascript,
                  \javascriptreact,
                  \markdown,
                  \typescript,
                  \typescriptreact,
                  \vim
                  \ setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab

  " Script for automatically closing tags
  autocmd Filetype html,xml,xsl,php source ~/.config/nvim/scripts/closetag.vim
augroup END
