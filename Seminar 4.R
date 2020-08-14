##########################################
###########Seminar 4: Regresjonsanalyse##
########################################

#################################################################################
#####I dagens seminar skal vi se på hvordan vi kan gjøre en OLS-analyse i R######
#################################################################################

Data <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-27-2020.csv", stringsAsFactors = F)
###Her laster vi inn dataene fra en nettside, om dere åpner nettsiden vil dere se at det er en CSV-fil, samme type som vi har jobbet med fra før. 
### I dagens seminar skal vi hovedsakelig jobbe med tidyverse og moments, vi må derfor laste inn dette:

library(tidyverse)
library(moments)
#Vi må også huske å sette working directory
setwd("C:/Users/Eric/OneDrive/Documents/UiO/Master_STV/R-seminarer/Seminar 4")


###Nå som vi har data, kan vi begynne med analyse. For å gjøre dette er det visse ting vi må gå igjennom:
# 1. Hva slags data har vi?
# 2. Er dataene i den formen vi ønsker dem?
# 3. Er kravene for regresjonsanalyse tilfredsstilt?

####Det første spørsmålet løses best ved å se på dataene,
###og hvordan det er formatert.

str(Data)#Ved å bruke str() (forkortellse for structure) får vi opp hvilke variabler vi har, og
         #hvilken klasse de har. Her kan vi se at vi har 12 variabler, men bl.a. antall døde, 
         #sted, antall smittede ++. 
        #De fleste variablene er integeres eller characters. 

####For vårt datasett er det er par ting jeg vil forandre på nå: Om vi ser på
####"Province_State" variabelen er denne tom for land som ikke har stater/provinser.
####Her vil jeg at det heller bare skal stå navnet på landet. 

Data$Province_State <- ifelse(Data$Province_State == "",
                              Data$Country_Region,
                              Data$Province_State)

###Dataene inneholder også noen variabler som vi ikke vet hva/ikke skal bruke.
##Når vi er sikre på at vi ikke skal bruke dem, er det like lett å bare droppe
##de fra datasettet.

Data <- Data %>%
  select(-c("FIPS", "Admin2")) #Her bruker jeg "-" foran variabelnavnene, for å vise at jeg ønsker å beholde
                               #alle andre enn de jeg skriver.


####Fram til nå har vi for det meste sett på univariat statistikk, sånn som gjennomsnitt og median###
mean(Data$Deaths)
median(Data$Deaths)


##Vi har også sett på hvordan vi kan plotte fordeling:

ggplot(Data, aes(Deaths)) +
  geom_density()

ggplot(subset(Data, Data$Deaths > 300), aes(Deaths)) + #Plotte for undergrupper
  geom_density(fill = "darkred") +
  theme_classic()

skewness(Data$Deaths) #Høyreskjev
kurtosis(Data$Deaths) #Spiss fordeling



#For bivariat statistikk har vi gått igjennom korrelasjonstester:

cor.test(Data$Deaths, Data$Confirmed) #Sterk positiv korrelasjon

#Se på sammenhenger
US <- subset(Data, Data$Country_Region == "US")

ggplot(US, aes(Deaths, Confirmed)) +
  facet_wrap(~Province_State)+
  geom_point()

###Når det kommer til formen på datene har vi så langt sett på litt forskjellige former for transformasjon:


##Log transformering

Data$Deaths_Log <- log(Data$Deaths+1)
table((Data$Deaths == round(exp(Data$Deaths_Log)))) #Bruke table for å sjekke at det er riktig
#Vi kan også standardisere/sentrere på gjennomsnitt

Data$Deaths_St <- Data$Deaths - mean(Data$Deaths)
table(Data$Deaths == Data$Deaths_St + mean(Data$Deaths))


###Nå kan vi begynne å se på regresjonsanalyse ###
#Nå vi skal bruke ols kjører vi funksjonen lm(), og skriver inn formelen
#En regresjonsformel har formen: Y = B0 + B1*X1 + B2*X2...BN*XN +ei
#B'ne, eller regresjonskoeffisientene, og feilen (ei) blir estimert av R
#Altså må vi bare fylle inn variablene:

lm(Deaths ~ Confirmed, data = Data)
#Når vi bare skriver inn formelen, får vi kun ut koeffsientene, ofte ønsker vi mer enn dette.
#Derfor bruker vi summary() foran lm()

summary(lm(Deaths ~ Confirmed, data = Data))      
#Nå får vi ut i tilegg signifikansnivå, R^2, og en del annen informasjon

#Ofte har vi lyst til å gjøre flere ting med modellen, derfor er det nyttig å lagre den som et objekt:

Mod1 <- lm(Deaths ~ Confirmed, data = Data)
summary(Mod1)



#Om vi vill ha en multivariat regresjonsanalyse må vi legge til de andre variablene i formelen

Mod2 <- lm(Deaths ~ Confirmed + Recovered, Data, na.action = "na.omit") #Dette datasettet har ikke missing, men dette er evt. hvordan vi hadde håndtert det
summary(Mod2)


###I forrige seminar så vi litt på hvordan vi kan plotte regresjoner:

ggplot(Data, aes(Confirmed, Deaths)) +
  geom_point() +
  geom_smooth(method = "lm")



#For å undersøke modellen vil vi gjerne legge til predikerte verdier, og residualene til datasettet
#Når vi kjører en regresjonsanalyse kaster den ut de radene som har NA/missing. Hadde vi hatt det måtte
#vi derfor laget et nytt datasett med kun komplette observasjoner. Siden vi er så heldige og ikke ha
#missing kan vi bare fortsette. 

Data$fitted <- Mod2$fitted.values
Data$resid <- resid(Mod2)

ggplot(Data, aes(resid)) +
  geom_density() #Oppgave logtransformering




