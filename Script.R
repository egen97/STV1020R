#################################################
#########Seminar 5 ##############################
#################################################


######################################################
######I dagens seminar skal vi se nærmere på##########
######regresjonsanalyse. Som dere sikkert husker######
#####husker fra forelesning, så bygger OLS på flere###
#####forutsetninger. Når vi gjør analyse i R vil ofte#
#####programmet gi oss et resultat selvom disse ikke##
#####er oppfylt. I dag skal vi derfor se på hvordan###
#####vi kan sjekke at disse er oppfylt.###############



#################################################################################################
#### Som vanlig starter scriptet med et preamble hvor vi setter WD, laster inn pakker, og Data###
#################################################################################################
setwd("C:\\Users\\egen9\\OneDrive\\Documents\\UiO\\Master_STV\\R-seminarer\\Seminar 5")
library(tidyverse)
Data <- read.csv("https://raw.githubusercontent.com/egen97/STV1020R/master/Data.csv", stringsAsFactors = F)
#####################################################
###Som dere husker fra sist kan vi her laste ned#####
##dataene fra en link. Om dere åpner den vil dere####
##se at det er samme type fil som vi har lastet ned##
##fra Canvas før.####################################
#####################################################



#######################################################################
##Datasettet vårt består av 13 variabler fra European Sosial Survey####
##Beskrivelse av variablene vil dere finne i kodeboken.################
#######################################################################


str(Data) #Ved å bruke str() kan vi få en rask oversikt over datene.
          #Ved å sammenligne med kodeboken kan vi se at målenivået på en del av variablene ikke stemmer.
          #Om vi legger variablene inn i en regresjon vil vi fortsatt få et svar, men vi vet at dette ikke stemmer.

Mod1 <- lm(Stemme ~ Nyheter + Alder  + Kjonn, data = Data, na.action = "na.exclude")
summary(Mod1) #Her kan vi se at R gir oss en modell, med signifikante resultater, men hvordan skal vi tolke den?
              #Siden "Stemme" er registrert som en "integer" gir ikke R oss noen feil, så derfor må vi sjekke at regresjonen er riktig.


###################################################################
####Det første vi må gjøre er derfor å omkode variablene###########
####Fra kodeboken kan vi se at det er 2 variabler som ikke#########
####er numeriske. En er dikotom, men det krever ingen forandring###
###################################################################


##På stemming haddet det vært praktisk å la det stå partinavnene,
##heller enn tall.

Data$Parti <- ifelse( #Lager en ny variabel så jeg ikke overskriver den gamle om det skulle skje noe feil
  Data$Stemme == 1, "Rødt",
  ifelse(Data$Stemme == 2, "SV",
  ifelse(Data$Stemme == 3, "AP",
  ifelse(Data$Stemme == 4, "Venstre",
  ifelse(Data$Stemme == 5, "KrF",
  ifelse(Data$Stemme == 6, "SP",
  ifelse(Data$Stemme == 7, "Høyre",
  ifelse(Data$Stemme == 8, "FrP",
  ifelse(Data$Stemme == 9, "Kystpartiet",
  ifelse(Data$Stemme == 10, "MDG",
  ifelse(Data$Stemme == 11, "Annet",
         NA)))))))))))

#Når vi har gjort en omkoding vil vi ofte sjekke at denne er gjort riktig, det kan vi gjøre
#gjennom et table()

table(Data$Stemme, Data$Parti)

#table() kan vi også bruke for å lage krysstabeller

table(Data$Kjonn, Data$Parti)
#Bruk prop.table(table()) for å få prosenter
prop.table(table(Data$Kjonn, Data$Parti))


######################################################
###Den neste variabelen vi må omkode er utdanning#####
###Her er det så mange nivåer at gjøre om til navn####
##blir upraktisk, men vi må gjøre om til factor med###
##rikige nivåer#######################################
######################################################

summary(Data$Utdanning) #Her kan vi se at det er noen tydelige feil, i og med at 5555 ikke er en gyldig verdi
                        #Det første vi kan gjøre er å fjerne de som er over 14.


Data$Utdanning <- ifelse(Data$Utdanning > 14, NA, Data$Utdanning)
summary(Data$Utdanning)
#Det neste vi nå må gjøre er å omkode den til en faktor med riktige nivåer

Data$Utd_F <- factor(Data$Utdanning,
                            levels = c(1:14)) #"Levels =" er hvor jeg definerer nivåene, "1:14" betyr bare
                                              #alle tallene mellom 1 og 14.

#Vi kan sjekke at ble gjort rikig gjennom levels(Data$Utdanning) og table()
levels(Data$Utd_F)
table(Data$Utd_F, Data$Utdanning)



###Nå som vi har dataene vår slik vi vil ha dem kan vi begynne med analyse
###Kan vi f.eks. med disse dataene se lønnsforskjeller mellom kjønn?

ggplot(Data, (aes(Inntekt))) +
  geom_bar() +
  facet_wrap(~Kjonn)  #Med geom_bar får vi et histogram av inntekt, facet_wrap deler det videre opp etter kjønn
  

mean(Data$Inntekt[which(Data$Kjonn == 1)], na.rm = T) #Med mean kan vi få ut gjennomsnittsinntekt for hvert kjønn
mean(Data$Inntekt[which(Data$Kjonn == 2)], na.rm = T)

round(prop.table(table(Data$Kjonn, Data$Inntekt)),2) #Proptable gjør at vi får prosentene i hver kategori



###Vi kan også lage en korrelasjonsmatrise med cor()
cor(Data) #Om vi bare legger inn datasettet vil vi få beskjed a "x" må være numerisk
          #Skal vi gjøre dette må vi derfor lage et datasett med kun de numeriske variablene

Num_Data <- Data %>%
  select(-c(Utdanning, Parti, Stemme, Utd_F)) #Siden vi skal beholde de fleste er det lettere
                                       #å definere de vi ikke skal ha, og putte "-" foran.
cor(Num_Data) #Nå vi kjører den nå får vi nesen bare NA, dette er fordi vi ikke har definert hva en skal gjøre med
              #missing-data.

cor(Num_Data, use = "complete.obs") #Her ber jeg den kun bruke komplette observasjoner

#Med korrelasjonsmatrisen har vi et gått utgangspunkt for å se hvilke variabler som kan ha en sammenheng
#Her kan vi f.eks. se at det er en sterk sammenheng, mellom nyheter og rettferdige.
#For å plotte to variabler mot hverandre bruker vi geom_point

ggplot(Data, aes(Nyheter, Tillit)) +
  geom_point(alpha = .5) +
  scale_x_log10() +
  geom_smooth(method = "lm")






################################
############Regresjonsanalyse###
###############################


#Fra forrige gang husker vi at vi kan gjøre regresjonsanalyse med lm() funksjonen

Mod2 <- lm(Tillit ~ Nyheter + Alder + Kjonn + Inntekt, Data, na.action = "na.exclude") #Her må vi huske "na.action =" for å kunne bruke data med missing
summary(Mod2) #Nå vi tolker denne må vi huske hva variablene er. "Kjonn" er dikotom, med 1 som mann
              #altså må vi legge til denne 2 ganger for å finne kvinne.
              

#Utdanning har vi på ordinalnivå, denne må vi altså ha dummyer for om vi skal ha den i regresjonen
#Siden vi allerede har kodet den som faktor gjør R dette automatisk

Mod3 <- lm(Tillit ~ Nyheter + Alder + Kjonn + Inntekt + Utd_F, Data, na.action = "na.exclude")
summary(Mod3) #Legg merke til at det ikke er noen effekt for F2, denne er satt som referanse og er altså en del av konstantleddet
              #Dere vil også legge merke til at F1 ikke er der, men det er nok heller fordi ingen har det.


#######################
######Diagnostiering###
#######################


############################################################################################
###########Når vi har en modell vill vi gjerne sjekke at denne oppfyller kravene til OLS####
###########Det vi først vil sjekke er at restleddene er normalfordelte######################
############################################################################################


Data$resid <- resid(Mod3) #resid() gir oss residualene til modellen
summary(Data$resid)

ggplot(Data, aes(resid)) +
  geom_density()

ggplot(Data, aes(sample = resid)) +
  stat_qq()


###Vi kan også se på hvordan predikerte verdier passer overens med faktiske verdier

Data$pred <- Mod3$fitted.values #Her kan vi se at vi får et problem med at lengden på dataene er annerledes
                                #Dette er fordi modellen har fjernet NA. For å fikse dette må vi lage et nytt 
                                #datasett uten NA i.

Data_Complete <- Data %>%
  drop_na(Tillit, Nyheter, Alder, Kjonn, Inntekt, Utd_F) #Her sier jeg at jeg vil fjerne alle rader som har NA
                                                         #på en av disse variablene.

Data_Complete$pred <- Mod3$fitted.values

#Nå kan vi plotte de faktiske variablene opp mot de predikerte

ggplot(Data_Complete, aes(pred, Tillit)) +
  geom_point() +
  geom_smooth(method = "lm", se = F)


#Vi kan også plotte residualene opp mot de predikerte variablene for å se etter outliers, autokorrelasjon, og at sammenhenger er linær
ggplot(Data_Complete, aes(pred, resid)) +
  geom_point() +
  geom_line(y = 0)
