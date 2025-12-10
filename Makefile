all: install report.html

install:
	Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv'); renv::restore()"

report.html: report/Lotr_code.Rmd
	Rscript -e "rmarkdown::render('report/Lotr_code.Rmd', output_file = 'report.html', output_dir = '.')"

dockerreport:
	mkdir -p report
	docker run --rm \
		-v "$(pwd)/report:/project/report" \
		lotrdock

.PHONY: clean
clean:
	rm -f output/*.rds
	rm -f report.html
	rm -f report/Lotr_code.html