# Wrapper program to read in IPUMS extracts

source("setup.R",echo=TRUE)   # this handles paths and libraries
source("functions.R")         # Store functions here
source("config.R",echo=TRUE)  # This configures what is to be downloaded
                              # THIS FILE SHOULD BE EDITED!


# define years
numbers <- c(23,24)


# call function for all years
for (i in 1:length(numbers)) {
  extract_from_ipums(numbers[i])
}

