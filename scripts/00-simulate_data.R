#### Preamble ####
# Purpose: Simulates Bicycle Theft data for Toronto from 2014 to 2023
# Author: Taejun Um
# Date: 27 September 2024
# Contact: taejun.um@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(4020)

number_of_occurrences <- 100

# Define the range of dates
start_date <- as.Date("2014-01-01")  # Start date
end_date <- as.Date("2022-12-31")    # End date

# Create a sequence of dates between the start and end date
date_sequence <- seq(from = start_date, to = end_date, by = "day")
sample_date <- sample(date_sequence, 100)
year_value <- format(sample_date, "%Y")

#Create a set of premises
sample_premises <- c("Apartment", "Commercial", "Educational", "House", "Other",
                     "Outside", "Transit")
sample_months <- sample(c("January", "February", "March", "April", "May", "June", 
                   "July", "August", "September", "October", "November", "December"), 100, replace = TRUE)
sample_hour <- sample(1:23, 100, replace = TRUE)

simulated_data <-
  tibble(
    id = 1:100,
    occ_date = sample_date,
    occ_year = year_value,
    occ_month = sample_months,
    occ_hour = sample_hour,
    premises_type = sample(sample_premises, 100, TRUE),
    bike_cost = round(rgamma(100, 3, 0.005), 2),
    cost_group =
      case_when(
        bike_cost < 500 ~ "< $500",
        bike_cost < 1000 ~ "$500 < $1000",
        bike_cost < 1500 ~ "$1000 < $1500",
        bike_cost < 2000 ~ "$1500 < $2000",
        bike_cost >= 2000 ~ "$2000 <"
      )
    )

####Write CSV
write_csv(simulated_data, file = "data/raw_data/simulated.csv")
