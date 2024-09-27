#### Preamble ####
# Purpose: Tests simulated and cleaned data of bicycle theft data
# Author: Taejun Um
# Date: 27 September 2024
# Contact: taejun.um@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have simulated data
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

#### Test data ####
# data <- read_csv("data/raw_data/simulated.csv")
data <- read_csv("data/analysis_data/analysis_data.csv")


#Test1 Check occ_date is in date form
"Date" == class(data$occ_date)

#Test2 Check occ_year has a proper year
all(format(data$occ_date, "%Y") == data$occ_year)

#Test3 Check occ_month has a proper value
all(data$occ_month %in% c("January", "February", "March", "April", "May", "June", 
                          "July", "August", "September", "October", "November", "December"))

#Test4 Check occ_hour has a proper value
all(data$occ_hour %in% 1:23)

#Test5 Check if premises_types have correct value
premises_test <- c("Apartment", "Commercial", "Educational", "House", "Other",
                   "Outside", "Transit")
all(data$premises_type %in% premises_test)

#Test6 Check if bike_cost is correctly assigned for each observation
incorrect_rows <- data %>%
  filter(
    (bike_cost < 500 & cost_group != "< $500") |
      (bike_cost >= 500 & bike_cost < 1000 & cost_group != "$500 < $1000") |
      (bike_cost >= 1000 & bike_cost < 1500 & cost_group != "$1000 < $1500") |
      (bike_cost >= 1500 & bike_cost < 2000 & cost_group != "$1500 < $2000") |
      (bike_cost >= 2000 & cost_group != "$2000 <")
  )
nrow(incorrect_rows) == 0

#Test7 Test for NAs
all(!is.na(data))