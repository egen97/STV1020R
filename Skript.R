##############Preamble###
setwd("C:/Users/egen9/OneDrive/Documents/UiO/Master_STV7R-seminarer/Seminar 6")
library("tidyverse")


Data <- read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-02-26/full_trains.csv",
                 stringsAsFactors = F)

Data <- Data %>%
  mutate(Date = as.Date(sprintf("%d-%02d-01", year, month)))


ggplot(Data) +
  geom_histogram(aes(avg_delay_late_at_departure), fill = "red", aplha = .10) +
  geom_histogram(aes(avg_delay_late_on_arrival), fill = "blue", aplha = .23) +
  theme_classic() 

Data$Late_Often <- ifelse(Data$num_late_at_departure >= 100, 1, 0)

mean(Data$avg_delay_late_at_departure, na.rm = TRUE)
sd(Data$avg_delay_late_at_departure, na.rm = TRUE)
summary(Data$avg_delay_late_at_departure)
quantile(Data$avg_delay_late_at_departure)

Data$num_late_at_departure_log <- log(Data$num_late_at_departure +1)
 
 
#Korrelasjon og Bivariat

Data %>%
  select(journey_time_avg, num_of_canceled_trains, num_late_at_departure,
         avg_delay_late_at_departure) %>%
  cor(use = "complete.obs")



cor.test(Data$avg_delay_late_at_departure, Data$journey_time_avg)  

ggplot(Data, aes(journey_time_avg, avg_delay_late_at_departure)) +
  geom_point() +
  geom_smooth(method = "lm")


Mod1 <- lm(avg_delay_late_at_departure ~ journey_time_avg, Data, na.action = "na.exclude")
summary(Mod1) #Jounry time er signifkant på 0,05 nivå, men justert R^2 er svært lav på 0,000000. Dette er er en dålig modell

ggplot(Data, aes(journey_time_avg, journey_time_avg)) +
  geom_point() 

