# Name: Haeley Griffin
# Date:9/28/18

# Run the below only if the library is not already installed.
# install.packages(dslabs)

 library(dslabs)
 library(dplyr)
 library(tidyverse)
 data(us_contagious_diseases)

#Question 1.
 
 dat <- filter(us_contagious_diseases, disease == "Measles", state != "Alaska", state != "Hawaii")
 dat <- mutate(dat, per100000rate = (((count*100000)/population)*(weeks_reporting/52)))
 
#Question 2.
 
 dat <- filter(dat, disease == "Measles", state == "California")
 ggplot(data = dat, mapping = aes(x = year, y = per100000rate)) + geom_vline(xintercept = 1965) + geom_line()
 
#Question 3.
 
 dat_caliFocus$yearBlock[dat_caliFocus$year >= 1950 & dat_caliFocus$year <= 1959] <- "1950’s"
 dat_caliFocus$yearBlock[dat_caliFocus$year >= 1960 & dat_caliFocus$year <= 1969] <- "1960’s"
 dat_caliFocus$yearBlock[dat_caliFocus$year >= 1970 & dat_caliFocus$year <= 1979] <- "1970’s"
 
 ggplot(data = dat_caliFocus) + geom_histogram(mapping = aes(x = year,  y = count, fill = yearBlock), position = "dodge", stat ="identity")
 ggplot(data = dat_caliFocus) + geom_histogram(mapping = aes(x = year,  y = sqrt(count), fill = yearBlock), position = "dodge", stat= "identity")
 
#Question 4.

 dat_USFocus$yearBlock[dat_USocus$year >= 1950 & dat_USFocus$year <= 1959] <- "1950’s"
 dat_USiFocus$yearBlock[dat_USFocus$year >= 1960 & dat_USFocus$year <= 1969] <- "1960’s"
 dat_USFocus$yearBlock[dat_USFocus$year >= 1970 & dat_USFocus$year <= 1979] <- "1970’s"
 ggplot(data = dat_USFocus) + geom_histogram(mapping = aes(x = year,  y = sqrt(count), fill = yearBlock), position = "dodge", stat= "identity")
 ggplot(data = dat_USFocus) + geom_histogram(mapping = aes(x = year,  y = count, fill = yearBlock), position = "dodge", stat= "identity")
 
#Question 5.
 
 dat <- mutate(dat_USFocus, per100000rate = (((count*100000)/population)*(weeks_reporting/52)))
 ggplot(data = dat, mapping = aes(x=year, y=state)) + geom_tile(mapping = aes(fill = per100000rate))
 
#Question 6.
 
 #https://www.cdc.gov/ncbddd/autism/documents/ASDPrevalenceDataTable2016.pdf
 #In this report of data I found could not be plotted but I did see that the number for autism did increase. 
 





