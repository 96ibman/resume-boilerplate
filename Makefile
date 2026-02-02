all: resume_en.pdf

resume_en.pdf: details.yml template.tex
	pandoc empty.md --metadata-file=details.yml --template=template.tex --pdf-engine=pdflatex --pdf-engine-opt=-interaction=nonstopmode -o resume_en.pdf

clean:
	if exist *.pdf del *.pdf
	if exist *.log del *.log
	if exist *.aux del *.aux