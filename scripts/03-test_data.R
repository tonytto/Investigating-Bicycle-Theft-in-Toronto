#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Taejun Um
# Date: 24 September 2024
# Contact: taejun.um@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have simulated data
# Any other information needed? None.s


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Test data ####
data <- read_csv("data/raw_data/simulated.csv")

#Test1 Check occ_date is in date form
"Date" == class(data$occ_date)

#Test2 Check occ_year has a proper year
all(format(data$occ_date, "%Y") == data$occ_year)

#Test3 Check if premises_types have correct value
premises_test <- c("Apartment", "Commercial", "Educational", "House", "Other",
                   "Outside", "Transit")
all(data$premises_type %in% premises_test)

#Test4 Check if bike_cost is correctly assigned for each observation
data$bike_cost

#Test5 Test for NAs
all(!is.na(data))