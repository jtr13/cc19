# script to compile list of students and pull request numbers from CourseWorks assignment for use in creating an index by name

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

pulls <- map(files, get_pulls) %>%
  unlist()

df <- tibble(ccnames, pulls)

write_csv(tibble(ccnames, pulls), "pull_nums2.csv")


###################

# script to get list of merged pull requests from GitHub
# see: https://github.com/jennybc/analyze-github-stuff-with-r

library(gh)
owner <- "jtr13"
repo <- "cc19"
pr_list <-
  gh("/repos/:owner/:repo/pulls", owner = owner, repo = repo,
     state = "all", .limit = Inf)

pr_df <- tibble(
  number = map_int(pr_list, "number"),
  user.login = map_chr(pr_list, ~.x[["user"]][["login"]]),
  merged_at = map_chr(pr_list, "merged_at", .default = NA)
)

# list of merged pull requests
merged <- pr_df %>% filter(!is.na(merged_at)) %>% pull(number) %>% sort()

# CourseWorks pull request numbers
# manually copied and pasted into new spreadsheet
cwpr <- read_csv("~/Downloads/Book1.csv", col_names  = FALSE) %>% pull(X1) %>% sort()

# pull requests listed in CourseWorks but not merged

cwpr[!(cwpr %in% merged)]

# real pull requests not listed in CourseWorks -- most are internal, can tell from user login:

pr_missing <- merged[!(merged %in% cwpr)]

pr_df %>% filter(number %in% pr_missing) %>%
  arrange(number) %>%
  filter(!(user.login %in% c("jtr13", "bojum", "skyetim", "Yingyu-Cao"))) #internal

