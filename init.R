
# initialize Renv

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



print(sessionInfo())
