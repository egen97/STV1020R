###################
###Seminar 3######
#################
library(tidyverse)
setwd("C:/Users/egen9/OneDrive/Documents/UiO/Master_STV/R-seminarer/Seminar 3")
Data <- read.csv("War_Data.csv", stringsAsFactors = F)

summary(Data)
#write.csv(Data, "War_Data.csv", row.names = F)
Data$log_Mil_Per <- log(Data$Mil_Per[which(is.na(Data$Mil_Per)==F)])

table(exp(Data$log_Mil_Per) == Data$Mil_Per)
#Har skjedd noe rart, fordi -9 burde vært NA
#Prøve igjen

Data$Mil_Per <- ifelse(Data$Mil_Per < 1, NA, Data$Mil_Per) 


Data <- Data %>%
  drop_na(Mil_Per) %>%
  mutate(log_Mil_Per = log(Mil_Per))

table((exp(Data$log_Mil_Per)) == Data$Mil_Per) #Hm, fortsatt feil

table(round(exp(Data$log_Mil_Per)) == Data$Mil_Per)# Oh, avrundingsfeil
log(3)
exp(1.098612) == log(3)

#Hva var IFELSE() greia?
#La oss se på major_power variabelen

summary(Data$Major_Power) #Hm, enten 1 eller NA? Vanskelig å kjøre statistikk på det..
#Med ifelse kan vi omkode variablene
Data$Major_Power <- ifelse(is.na(Data$Major_Power) == T, 0, Data$Major_Power)
summary(Data$Major_Power)

cor(Data$log_Mil_Per, Data$High_Act, use = "complete.obs")

#Ccode kan ikke være integer
#Country_Names should be factor

#NA registerert som -(some number) flere steder

