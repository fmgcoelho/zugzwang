FILE=main

all: $(FILE).pdf

clean:
	rm -f *~ \#*
	rm -f *.bbl *.blg *.fdb_* *.fls *.log *.out $(FILE).pdf

%.pdf: %.tex
	latexmk -output-format=pdf $<

