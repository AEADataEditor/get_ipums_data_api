# configuration parameters


# set api key from .Renviron
set_ipums_api_key(Sys.getenv("API_KEY")) 
basepath <- rprojroot::find_root(rprojroot::has_file("setup.R"))


# directory with extract definitions
# Save any extract defitions here 
extract_defs <- file.path(basepath,"json")
# while it is actually a JSON file, some browsers will 
# save it as a TXT file. Specify how you saved them here.
extract_defs.ext <- "json"
#extract_defs.ext <- "txt"

# define the output format
extract_output <- "stata"

# directory to save extracts
extractbase <- file.path(basepath,"extracts")

for ( dir in list(extractbase) ) {
  if (file.exists(dir)) {
    message("Found ",dir)
  } else {
    dir.create(file.path(dir),recursive=TRUE)
  }
}
