################ Packages Required ##########


library(rmarkdown)
library(arules)
library(arulesViz)
#install.packages("igraph")
library(igraph)


########### Understanding and reading the data #####
Groceries<-read.csv(file.choose())
View(Groceries)
colnames(Groceries)
nrow(Groceries)#[1] 15295
ncol(Groceries)#[1] 4
str(Groceries)


summary(Groceries)



###### Association model #####
#### apriori algorithm ####

rules <- apriori(Groceries,parameter=list(support=0.002, confidence = 0.5))

rules

inspect(head(sort(rules, by = "lift")))



######## Exploratory Data analysis###########

plot(rules)#### Scatter plot



head(quality(rules))

plot(rules, method = "grouped")


#plot(rules,method = "scatterplot")




plot(rules,method = "graph")

