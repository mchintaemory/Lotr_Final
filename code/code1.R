suppressPackageStartupMessages({
  library(dplyr)
  library(stringr)
  library(gtsummary)
  library(here)
  library(readr)
})

# set project root
here::i_am("code/code1.R")

# read data from project root
lotr <- read_csv(here("lotr_characters.csv"))

# build gtsummary table
table_LOTR_Race <- lotr |>
  mutate(
    gender = str_to_lower(gender),
    gender = case_when(
      str_detect(gender, "male")   ~ "Male",
      str_detect(gender, "female") ~ "Female",
      TRUE                         ~ NA_character_
    )
  ) |>
  select(race, gender) |>
  tbl_summary(
    by      = race,
    missing = "no",
    label   = list(gender ~ "Gender")
  ) |>
  modify_spanning_header(all_stat_cols() ~ "**Race**") |>
  add_overall() |>
  modify_caption("**Gender distribution by Race**")

# ensure output dir exists
dir.create(here("output"), showWarnings = FALSE)

# save, do NOT print
saveRDS(
  table_LOTR_Race,
  file = here("output/table_LOTR_Race.rds")
)

invisible(NULL)