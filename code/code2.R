
lotr<- read.csv("lotr_characters.csv")
here::i_am(
  "code/code2.R"
)
LOTR_Race_Dist <- ggplot(lotr, aes(x = race))+
  geom_bar()+   # histogram of categorical variable = bar chart
  labs(
    title = "Distribution of Characters by Race",
    x = "Race",
    y = "Count"
  )+
  theme(axis.text.x = element_text(angle = 45))

saveRDS(
  LOTR_Race_Dist,
  file = here::here("output", "LOTR_Race_dist.rds")
)