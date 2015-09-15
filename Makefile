.PHONY : clean

pdf:
	./knit pdf
	pandoc -s -S --biblio madsenlipo2016-seriation-criteria.bib madsenlipo2016-seriation-criteria.md --template=xelatex-template.tex --latex-engine=xelatex -o madsenlipo2016-seriation-criteria.tex --natbib --number-sections --listings
	latexmk -pdf madsenlipo2016-seriation-criteria
	open -a /Applications/Skim.app madsenlipo2016-seriation-criteria.pdf

md:
	pandoc -s -S --biblio madsenlipo2016-seriation-criteria.bib madsenlipo2016-seriation-criteria.md -o madsenlipo2016-seriation-criteria.md

odt:
	./knit docx
	pandoc -s -S --biblio madsenlipo2016-seriation-criteria.bib madsenlipo2016-seriation-criteria.md --reference-odt=reference.odt -o madsenlipo2016-seriation-criteria.odt

epub:
	./knit epub
	pandoc -s -S --biblio madsenlipo2016-seriation-criteria.bib madsenlipo2016-seriation-criteria.md -o madsenlipo2016-seriation-criteria.epub


clean:
	latexmk -CA
	rm -rf *.log *.bbl *.blg *.out *.md  *.docx madsenlipo2016-seriation-criteria.tex *.epub
