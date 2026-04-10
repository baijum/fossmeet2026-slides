.PHONY: all clean

all: slides.pdf

slides.pdf: slides.tex
	pdflatex slides.tex
	pdflatex slides.tex

clean:
	rm -f slides.pdf slides.aux slides.log slides.nav slides.out slides.snm slides.toc slides.vrb
