if has("cscope")
   " gtags cscope:
   set csprg=gtags-cscope
   set csto=1
   set cst

   " Turn off cscope notification messages so you don't get warnings during
   " vim startup
   set nocsverb

   " Load cscope/gtags.
   " First thing we look for is the GTAGS file in current directory,
   " or parent, or grand parent, ... and include that if found.

   " relies on existence of "findup" script.
   let g:gtagsdir = system("findup GTAGS")
   if !v:shell_error
      execute "cs add ".g:gtagsdir."/GTAGS"
   else
      " Didn't find gtags, do the same search for cscope.out and add if found.
      let g:cscopedir = system("findup cscope.out")
      if !v:shell_error
         set csprg=cscope
         execute "cs add ".g:cscopedir."/cscope.out"
      endif
   endif

   " Turn cscope notification messages back on now that startup is done
   set csverb "is needed?

   nmap <leader>gs :cs find s <C-R>=expand("<cword>")<CR><CR> " find C symbol "
   nmap <leader>gg :cs find g <C-R>=expand("<cword>")<CR><CR> " find defintion "
   nmap <leader>gc :cs find c <C-R>=expand("<cword>")<CR><CR> " find functions calling this "
   nmap <leader>gt :cs find t <C-R>=expand("<cword>")<CR><CR> " find this text "
   nmap <leader>ge :cs find e <C-R>=expand("<cword>")<CR><CR> " find this egrep pattern "
   nmap <leader>gf :cs find f <C-R>=expand("<cfile>")<CR><CR> " find this file"
   nmap <leader>gi :cs find i ^<C-R>=expand("<cfile>")<CR><CR> " find files including this one"
   nmap <leader>gd :cs find d <C-R>=expand("<cword>")<CR><CR> " find functions called by this one"

   "" Once you've done a cs (cscope) query, if there are multiple tags, F9 goes
   "" to previous, F10 goes to the next one
   nmap <C-[> :tp<CR>
   nmap <C-]> :tn<CR>
endif
