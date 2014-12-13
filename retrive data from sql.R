library("RMySQL")

con <- dbConnect(MySQL(), user="root", password="889092",
                 dbname="winnie")

life<- dbReadTable(con, "life_expectancy")
