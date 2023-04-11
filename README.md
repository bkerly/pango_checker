#pango_checker

The purpose of this little repository is to check if a CSV of SARS-CoV-2 variant names and counts are all names of PANGO lineages, or are something else. I suppose it could check if any set of data contains PANGO lineages, if you wanted for some reason!

Anyway, Tye Harlow asked me to do this since reading in JSON files can be a little tricky. Why are they so big? I don't know.

The script take as input a CSV of variant names and counts (or really any second column of data) and access a JSON file of PANGO lineages from the GitHub linked here: https://cov-lineages.org/lineage_list.html.

The script outputs two CSVs; one called "in_pango.csv" which is the data from the input CSV that matched a PANGO lineage, and a second one called "not_in_pango.csv" which is what it sounds like.