FROM rocker/tidyverse:4.5.1

RUN mkdir /project
WORKDIR /project

COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir -p renv/.cache
ENV RENV_Paths_CACHE=renv/.cache

RUN Rscript -e "install.packages('renv', repos= 'https://cloud.r-project.org/'); renv::restore(prompt = FALSE)"

COPY . /project

RUN mkdir -p report

CMD ["Rscript", "-e", "rmarkdown::render('report/Lotr_code.Rmd', output_dir = 'report')"]