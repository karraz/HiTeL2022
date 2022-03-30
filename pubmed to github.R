#############################
# Abstract Download in Bulk
############################

#Objective:
# To download all abstracts in the Pubmed and Plos database into 
# one file. 

###################
# Pubmed Database
###################
#Scrapping data from NCBI including Pubmed database
# library(devtools)
# install_github("skoval/RISmed") #do not install from CRAN (contain bugs)

#calling the library
library(RISmed)

#Set search query
search_topic <- "Machine Learning"

#Search the articles in Pubmed database
search_query <- EUtilsSummary(search_topic, 
                              retmax=100, 
                              mindate=2019,
                              maxdate=2022)
#Here, we ask for 100 (default=1000) articles regarding to 
# our search topic published between 2019 and 2022

# To see how many results and search term used
summary(search_query)

#NOTES:
# MeSH terms are official words or phrases selected 
# to represent particular biomedical concepts. 
#EDAT-Entrez Date is the date the citation was added to PubMed.

#To see the query id for downloaded articles
QueryId(search_query)

#Begin to download all the elements in the articles
records<- EUtilsGet(search_query, type="efetch")
class(records)
View(records)


#To select important elements in the downloaded articles
pubmed_data <- data.frame('Title'=ArticleTitle(records),
                          'Abstract'=AbstractText(records),
                          'Year'=YearPubmed(records))
names(pubmed_data)
head(pubmed_data$Title,4)
head(pubmed_data$Abstract,3)
View(pubmed_data)


#To save the data into excel csv file
write.csv(pubmed_data,
          file="LR Machine Learning.csv", 
          row.names = F)












