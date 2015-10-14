setlocal sw=4 ts=4 sts=4 nosmartindent

" -- Set filetype for common django filenames
augroup pythondjango
	au BufNewFile,BufRead admin.py     setlocal filetype=python.django
	au BufNewFile,BufRead urls.py      setlocal filetype=python.django
	au BufNewFile,BufRead models.py    setlocal filetype=python.django
	au BufNewFile,BufRead views.py     setlocal filetype=python.django
	au BufNewFile,BufRead settings.py  setlocal filetype=python.django
	au BufNewFile,BufRead forms.py     setlocal filetype=python.django
augroup END
