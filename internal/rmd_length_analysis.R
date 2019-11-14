# analysis of contributions

remove_blank_lines <- function(filecontents) {
  filecontents[nchar(filecontents) > 0]
}

rmds <- list.files(pattern = ".Rmd")

contents <- lapply(rmds, readLines) %>%
  lapply(trimws) %>%
  lapply(remove_blank_lines)

len <- lapply(contents, length) %>% unlist()

df <- data.frame(rmds, len)

library(ggplot2)

df %>%
  filter(len < 50) %>%
  ggplot(aes(reorder(rmds, len), len)) + geom_point() + coord_flip()
