here::i_am(
  "code/code1.R"
)

lotr<- read.csv("lotr_characters.csv")
lotr <- lotr %>%
  mutate(
    gender = str_to_lower(gender),
    gender = if_else(str_detect(gender, "male"), "Male",
                     if_else(str_detect(gender, "female"), "Female", NA_character_))
  )

table_LOTR_Race <- lotr |>
  select("race", "gender") |>
  tbl_summary(
    by = race,
    include = gender,
    missing= "no",
    label = list(gender~"Gender")
  ) |>
  modify_spanning_header(
    all_stat_cols() ~ "**Race**" 
  ) %>%
  add_overall() %>% 
  modify_caption("**Gender distribution by Race**")
table_LOTR_Race

saveRDS(
  table_LOTR_Race,
  file = here::here("output", "table_LOTR_Race.rds")
)
