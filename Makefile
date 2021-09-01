all:
	kramdown -i kramdown -o latex cv.md --no_auto_ids > cv.tex
	kramdown -i kramdown -o html cv.md --no_auto_ids > cv.html
	Rscript format.R
	pdflatex mrm_cv.tex
	pdflatex mrm_cv.tex
	rm *.aux *.log *.out cv.tex
