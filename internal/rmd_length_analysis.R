# analysis of contributions
library(dplyr)

library(tidyverse)

# find short chapters to make children

remove_blank_lines <- function(filecontents) {
  filecontents[nchar(filecontents) > 0]
}

rmds <- list.files(pattern = ".Rmd")

contents <- lapply(rmds, readLines) %>%
  lapply(trimws) %>%
  lapply(remove_blank_lines)

len <- lapply(contents, length) %>% unlist()

df <- data.frame(rmds, len)


df %>%
  filter(len < 25) %>%
  ggplot(aes(reorder(filename, len), len)) + geom_point() + coord_flip()

shortchapters <- df %>% filter(len <= 20) %>%
  select(rmds)

# short chapters still in _bookdown.yml:

yaml <- readLines("_bookdown.yml")

index <- lapply(shortchapters$rmds, function(x) grep(pattern = x, x = yaml)) %>% unlist

yaml[index]
