###############
# PLOS Database
###############

#Load the library
library(rplos)

##Search across PLoS papers in various sections of papers
##======================================================
# searchplos is a general search,
# and in this case searches for the term "Machine Learning" and 
#returns the DOI's of matching papers

Search1 <- searchplos(q= "Machine Learning", 
                      fl=c("id", "publication_date",
                           "abstract", "title", "journal"),
                      limit=100)

#to see the structure of Search1
str(Search1)

#basiccally we have meta and data
attributes(Search1)

#Meta data represent how many articles found in the database
Search1$meta

#Data represent the information that we request Eg:100 article
Search1$data

#we can view our results 
View(Search1$data)

#write the results into csv file
write.csv(Search1$data, file="Plos-ML.csv",
          row.names = F)
