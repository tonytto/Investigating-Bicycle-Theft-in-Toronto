#### Preamble ####
# Purpose: Cleans the raw data and add new variable to categorize bike cost.
# Author: Taejun Um
# Date: 24 September 2024
# Contact: taejun.um@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have downloaded the data
# Any other information needed? None.

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data <-
  raw_data|>
  select("_id", OCC_DATE, OCC_YEAR, OCC_MONTH, OCC_HOUR, PREMISES_TYPE, BIKE_COST)|>
  janitor::clean_names()

cleaned_data <-
  cleaned_data |>
  mutate(
    cost_group =
      case_when(
        bike_cost < 500 ~ "< $500",
        bike_cost < 1000 ~ "$500 < $1000",
        bike_cost < 1500 ~ "$1000 < $1500",
        bike_cost < 2000 ~ "$1500 < $2000",
        bike_cost >= 2000 ~ "$2000 <"
      ),
    cost_group = 
      factor(cost_group, levels = c("< $500", "$500 < $1000", "$1000 < $1500", "$1500 < $2000", "$2000 <"))
  ) 


cleaned_data<-
  cleaned_data|>
  filter(occ_year > 2013, occ_year < 2024)|> 
  tidyr::drop_na()

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
