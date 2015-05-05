.PHONY : clean

pdf:
	./knit pdf
	pandoc -s -S --biblio lipomadsen-seriation-criteria-paper.bib lipomadsen-seriation-criteria-paper.md --template=xelatex-template.tex --latex-engine=xelatex -o lipomadsen-seriation-criteria-paper.tex --natbib --number-sections --listings
	latexmk -pdf lipomadsen-seriation-criteria-paper
	open -a /Applications/Skim.app lipomadsen-seriation-criteria-paper.pdf

md:
	pandoc -s -S --biblio lipomadsen-seriation-criteria-paper.bib lipomadsen-seriation-criteria-paper.md -o lipomadsen-seriation-criteria-paper.md

odt:
	./knit docx
	pandoc -s -S --biblio lipomadsen-seriation-criteria-paper.bib lipomadsen-seriation-criteria-paper.md --reference-odt=reference.odt -o lipomadsen-seriation-criteria-paper.odt

epub:
	./knit epub
	pandoc -s -S --biblio lipomadsen-seriation-criteria-paper.bib lipomadsen-seriation-criteria-paper.md -o lipomadsen-seriation-criteria-paper.epub


clean:
	latexmk -CA
	rm -rf *.log *.bbl *.blg *.out *.md  *.docx lipomadsen-seriation-criteria-paper.tex *.epub
