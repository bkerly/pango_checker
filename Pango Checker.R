library(tidyverse) # for data manipulation
library(jsonlite) # for reading JSON

#Read in files
input_file <- read_csv("variants.csv") %>%
  `colnames<-`(c("Variant","Count"))

address <- "https://github.com/cov-lineages/lineages-website/raw/master/_data/lineage_data.full.json"
variant_list <- jsonlite::fromJSON(address)

# Make the JSON list legible for R
variants <- do.call(rbind,variant_list) %>%
  as.data.frame()  %>%
  select(Lineage)

# Check the lists against one another -------------------------------------

in_pango <- input_file %>%
  filter(Variant %in% variants$Lineage)

not_in_pango <- input_file %>%
  filter(!(Variant %in% variants$Lineage))


# Write output ------------------------------------------------------------

write_csv(in_pango, "in_pango.csv")
write_csv(not_in_pango, "not_in_pango.csv")

