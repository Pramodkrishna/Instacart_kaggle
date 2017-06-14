setwd("/home/pramod/Documents/Kaggle/Instacart_kag/")
library(data.table)
library(dplyr)
library(ggplot2)
library(knitr)
library(stringr)
library(DT)
library(plyr)
library(plotly)
library(MASS)
aisle <- read.csv('aisles.csv',stringsAsFactors = F)
depart <- read.csv("departments.csv",stringsAsFactors = F)
order <- read.csv("orders.csv",stringsAsFactors = F,nrows = 1000000)
product <- read.csv("products.csv",stringsAsFactors = F)
prod_prior <- read.csv("order_products__prior.csv",stringsAsFactors = F,nrows = 1000000)
prod_train <- read.csv("order_products__train.csv",stringsAsFactors = F)

#Merge the data 
mydata <- merge(product,depart)

mydata1 <- merge(mydata,aisle)

table(order$eval_set)
colnames(mydata1)

#merge  with the order_prior details."Meaning merge mydata1 with prod_prior df"  

mydata2 <- merge(mydata1,prod_prior)
colnames(mydata2)

#Taking a small subset of the data 
sample_data <- (mydata2[1:1000,])
sample_random <- sample_data[sample(nrow(sample_data), 500), ]

#Viz + Analysis 
#Fucntion init
#'Converts data to factor/table format for easy plotting'
# Plotting the data with respect to the variable

var_freq <- function(x){
data_x <- as.data.frame(table(x))
head(data_x)
ggplot(data = data_x,aes(x = data_x$x,y = data_x$Freq)) + geom_point()
}

# Viz plots  Analysis and deducing the inferences by plotting them 
var_freq(sample_random$department)
#Produce department has the highest order

var_freq(sample_random$product_id)
#Product Id 45 has been the most purchased 

var_freq(sample_random$aisle_id)
#Aisle 83 has the item which has the highest order 

var_freq(sample_random$department_id)

var_freq(sample_random$aisle)

var_freq(sample_random$department)

var_freq(sample_random$add_to_cart_order)


var_freq(sample_random$reordered)

