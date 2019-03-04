library(tidyverse)
library(rvest)
PHRASES=c()
MEANING=c()
for (i in c(LETTERS[1:23], "XYZ")) {
  data <-
    read_html(paste0("https://www.englishclub.com/ref/Phrasal_Verbs/", i, "/"))
  col1 <- data %>% html_nodes("h3.linktitle") %>%
    html_text() %>% stringr::str_replace_all("\n"," ") %>% stringr::str_trim(side = "both")
  
  col2 <- data %>% html_nodes("div.linkdescription") %>%
    html_text() %>% stringr::str_replace_all("\n"," ") %>% stringr::str_trim(side = "both")
  
  # print(col1)
  # print(col2)
  PHRASES = c(PHRASES, col1)
  MEANING = c(MEANING, col2)
}
phrases <- tibble(PHRASES,MEANING)

devtools::use_data(phrases, overwrite = TRUE)

