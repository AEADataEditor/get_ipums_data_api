
# initialize Renv
#
#install.packages("renv")
#renv::init()

# install packages

global.libraries <- c("devtools","rprojroot","ipumsr")


# Function to install libraries

pkgTest <- function(x)
{
	if (!require(x,character.only = TRUE))
	{
		install.packages(x,dep=TRUE)
		if(!require(x,character.only = TRUE)) stop("Package not found")
	}
	return("OK")
}

## Add any libraries to this line, and uncomment it.


results <- sapply(as.list(global.libraries), pkgTest)

#renv::snapshot()

# Use this code to create/save the IPUMS API key.
# Run this interactively (do not save the key).
# If you manually copied ".Renviron.template" to ".Renviron", 
# you do not need to do this step.



if ( file.exists(".Renviron") ) {
    message("A .Renviron file exists. If you want to override it, delete it first.")
} else {
set_ipums_api_key("paste-your-key-here", save=TRUE)
}

print(sessionInfo())
