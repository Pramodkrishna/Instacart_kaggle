setwd("/home/pramod/Documents/Kaggle/Instacart_kag/")
library(data.table)
library(dplyr)
library(ggplot2)
library(knitr)
library(stringr)
library(DT)
aisle1 <- read.csv('aisles.csv',stringsAsFactors = F)
depart1 <- read.csv("departments.csv",stringsAsFactors = F)
order1 <- read.csv("orders.csv",stringsAsFactors = F,nrows = 1000000)
product1 <- read.csv("products.csv",stringsAsFactors = F)
prod_prior <- read.csv("order_products__prior.csv",stringsAsFactors = F,nrows = 1000000)
prod_train <- read.csv("order_products__train.csv",stringsAsFactors = F)


#mydata <- merge(product1,depart1)

mydata1 <- merge(mydata,aisle1)

table(order1$eval_set)
colnames(mydata1)
#prod1, aisle1, departments 
#merge  with the order_prior details."Meaning merge mydata1 with prod_prior df"  
#order_id,	add_to_cart_order ,	reordered,	product_name	

unique(mydata1$product_name)


product_name <- as.data.frame(table(mydata1$product_name))


