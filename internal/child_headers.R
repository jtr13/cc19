# Decreases header levels for child documents:
#    # -> ##
#    ## -> ###
#    ### -> #### ... {-}
# Does not distinguish between text and code chunks so comments in code chunks will get an extra #

library(dplyr)
library(stringr)

child_headers <- function(filename) {
  readLines(filename) %>%
    str_replace("^###", "@H3@") %>%
    str_replace("^##", "@H2@") %>%
    str_replace("^#", "##") %>%
    str_replace("@H2@", "###") %>%
    str_replace("(?:@H3@)(.*$)", "####\\1 {-}")

}
