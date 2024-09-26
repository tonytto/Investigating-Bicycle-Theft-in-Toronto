#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto.
# Author: Taejun Um
# Date: 24 September 2024
# Contact: taejun.um@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#Following codes are direct copy from opendata website. However, it only downloads first 32000 rows of observations.
#Therefore, I decided to use read_csv function save full datasets.

#### Download data ####


# get package
# package <- show_package("c7d34d9b-23d2-44fe-8b3b-cd82c8b38978")
# package
# 
# # get all resources for this package
# resources <- list_package_resources("c7d34d9b-23d2-44fe-8b3b-cd82c8b38978")
# 
# # identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
# datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))
# 
# # load the first datastore resource as a sample
# the_raw_data <- filter(datastore_resources, row_number()==1) %>% get_resource()
# the_raw_data
# 
# #### Save data ####
# write_csv(the_raw_data, "data/raw_data/raw_data.csv") 

#Downloading all data from opendatatoronto directly to get all observations.
all_data <- read_csv("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/c7d34d9b-23d2-44fe-8b3b-cd82c8b38978/resource/55136dac-26b1-4028-b9f5-7c2344f94153/download/bicycle-thefts%20-%204326.csv")
write_csv(all_data, "data/raw_data/raw_data.csv")
