library(tidyverse)
library(rvest)
PHRASES=c()
MEANING=c()
for (i in c(LETTERS[1:23], "XYZ")) {
  data <-
    read_html(paste0("https://www.englishclub.com/ref/Phrasal_Verbs/", i, "/"))
  col1 <-
    data %>% html_nodes("h3") %>% html_text() %>% gsub("^[\n]$", "", .) %>% gsub("\n", " ", .)
  col1 <-
    data %>% html_nodes("h3") %>% html_text() %>% gsub("^\n", "", .) %>% gsub("\n$", "", .) %>% gsub("\n", " ", .)
  col2 <-
    data %>% html_nodes("#ec-main") %>% html_nodes(".linkdescription") %>% html_text()
  # print(col1)
  # print(col2)
  PHRASES = c(PHRASES, col1)
  MEANING = c(MEANING, col2)
}
phrases <- tibble(PHRASES,MEANING)

devtools::use_data(phrases, overwrite = TRUE)

