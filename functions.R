# 
# function to extract data
extract_from_ipums <- function(number) {
  setwd(extract_defs)
  extract_name <- paste0("usa_extract_",number,".",extract_defs.ext) # name extract
  
  extract_definition <- define_extract_from_json(extract_name)
  submitted_extract <- submit_extract(extract_definition)
  submitted_extract <- get_extract_info(submitted_extract)
  downloadable_extract <- wait_for_extract(submitted_extract, max_delay_seconds = 150)
  ddi_file <- download_extract(downloadable_extract, download_dir = extractbase, overwrite=TRUE)
  
  # unzip dat.gz file
  #base_filename <- file_path_sans_ext(basename(ddi_file))
  #R.utils::gunzip(file.path(paste0(extractbase, "/", base_filename, ".dat.gz")))
  
  # rename file
  #setwd(extractbase)
  #file.rename(from = paste0(base_filename, ".dat"), to = paste0(year, "_raw.dat")) # rename dat file
  #file.rename(from = paste0(base_filename, ".xml"), to = paste0(year, "_raw.xml")) # rename xml file
  
  message(paste("extract completed for", number, sep=" "))
}
