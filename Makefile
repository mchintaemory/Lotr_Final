install:
	Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv'); renv::restore()"

report.html: LOTR_code.Rmd code/02_render_report.R LOTRtable
	Rscript code/02_render_report.R

LOTRtable:
	Rscript code/code1.R
	Rscript code/code2.R

.PHONY: clean
clean:
	rm -f output/*.rds
	rm -f LOTR_code.html