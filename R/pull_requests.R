# script to compile list of students and pull request numbers for use in creating an index by name

# Download submissions from Courseworks, unzip

library(tidyverse)
library(rvest)

path <- "~/Downloads/github_pull_nums"

ccnames <- list.files(path) %>%
  str_remove("_.*")

files <- file.path(path, list.files(path))

get_pulls <- function(url) {
  page <- read_html(url)
  link <- page %>% html_node("a") %>% html_text()
  if (!is.na(link) && str_sub(link, 1, 5) == "Click") {
    link <- page %>% html_node("a") %>% html_attr("href")
    }
  if (is.na(link)) {
    link <- page %>% html_node("span p") %>% html_text()
    }
  if (is.na(link)) {
    link <- page %>% html_node("p") %>% html_text()
    }
  link
}

pulls2 <- map(files, get_pulls) %>%
  unlist()

df <- tibble(ccnames, pulls, pulls2)

write_csv(tibble(ccnames, pulls), "pull_nums.csv")
