#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto.
# Author: Taejun Um
# Date: 27 September 2024
# Contact: taejun.um@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#Codes from opendata website only downloads first 32000 rows of observations.
#Therefore, I decided to use read_csv function save full datasets.

#### Download data ####

#Downloading all data from opendatatoronto directly to get all observations.
all_data <- read_csv("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/c7d34d9b-23d2-44fe-8b3b-cd82c8b38978/resource/55136dac-26b1-4028-b9f5-7c2344f94153/download/bicycle-thefts%20-%204326.csv")
write_csv(all_data, "data/raw_data/raw_data.csv")
