# *------------------------------------------------------------------
# | PROGRAM NAME: prepare_file_system
# | FILE NAME: 00_prepare_file_system.R
# | DATE: 09/15/2017
# | CREATED BY:  Jim Stagge         
# *----------------------------------------------------------------
# | PURPOSE:  This script will install any packages needed for the subsequent
# |				code and create the output folder structure to hold results.     
# |
# *------------------------------------------------------------------
# | UPDATES:               
# |
# |
# *------------------------------------------------------------------
 
### Clear any existing data or functions.
rm(list=ls())


###########################################################################
###  Check for necessary packages and install if needed
###########################################################################
### Set a list of packages
list_of_packages <- c("assertthat", "zoo", "data.table", "ggplot2", "fitdistrplus", "maps", "gridExtra", "ggrepel", "dataRetrieval", "missMDA", "reshape2", "svglite", "lubridate", "glmnet")

	
### Determine which packages are missing
package_list <- installed.packages()[,"Package"]
installed_test <- (list_of_packages %in% package_list)
packages_needed <- list_of_packages[!installed_test]

### If packages are missing, install them
if(length(packages_needed)) install.packages(packages_needed)

### A few packages have issues in the CRAN repository, must be installed from github
require(devtools)
install_github("dkahle/ggmap")
install_github("topepo/caret")

###########################################################################
## Set the Paths
###########################################################################
### Path for Data and Output	
data_path <- "../data"
output_path <- "../output"
global_path <- "./global_func"
function_path <- "./functions"

###########################################################################
###  Generate folder structure
###########################################################################
### Create output folder
dir.create(output_path)

### Create subfolders
dir.create(file.path(output_path, "figures"))
dir.create(file.path(output_path, "observed_utah_flow"))
dir.create(file.path(output_path, "pca_chronol"))
dir.create(file.path(output_path, "paleo_reconst"))



