# analysis of contributions
library(dplyr)

remove_blank_lines <- function(filecontents) {
  filecontents[nchar(filecontents) > 0]
}

rmds <- list.files(pattern = ".Rmd")

contents <- lapply(rmds, readLines) %>%
  lapply(trimws) %>%
  lapply(remove_blank_lines)

len <- lapply(contents, length) %>% unlist()

df <- data.frame(filename, len)

library(ggplot2)


df %>%
  filter(len < 25) %>%
  ggplot(aes(reorder(filename, len), len)) + geom_point() + coord_flip()

chapters <- df %>% filter(len > 25) %>%
  select(filename)

write_csv(chapters, "internal/chapters.csv")
