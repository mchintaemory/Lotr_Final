suppressPackageStartupMessages({
  library(here)
  library(rmarkdown)
})

# Set project root
here::i_am("code/02_render_report.R")

# Render the Rmd in the report/ folder
rmarkdown::render(
  input       = here::here("report", "Lotr_code.Rmd"),
  output_file = "report.html",
  output_dir  = here::here()
)