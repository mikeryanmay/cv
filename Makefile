all:
	kramdown -i kramdown -o latex cv.md --no_auto_ids > cv.tex
	kramdown -i kramdown -o html cv.md --no_auto_ids > cv.html
	Rscript format.R
	pdflatex cv_main.tex
	pdflatex cv_main.tex
	rm *.aux *.log *.out cv.tex
