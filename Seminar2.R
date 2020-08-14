# 
# # Velkommen til 2. Seminar!
# 
# Først: Er det noen spørsmål/kommentarer til hjemmeoppgavene? Har alle forstått indeksering og `which()?`.  
# 
# I dagens seminar skal vi dekke følgende emner:
#   
# 1. [Organisering av arbeidet ditt i R](#organisering)
# 2. [Laste inn datasett](#datasett)
# 3. [Statistiske mål](#statistikk)
# 4. [Grafikk](#grafikk) 
# 5. [Tabulering](#tabulering)
# 6. [Mer om logiske tester](#logisk)
# 7. [Lagre output](#lagre) 
#                 
# Noen av disse emnene har dere allerede kjennskap til gjennom introduksjonen jeg lagde til seminaret. 

# Det er valgfritt å kode underveis, men jeg anbefaler dere å gjøre det så lange dere klarer å følge med.
#                 
# Etter introduksjonen bruker vi 5 minutter på spørsmål om disse temaene i plenum. 
# Oppgavene gir dere mer informasjon, og muligheten til å øve på å tilegne dere mer kunnskap om R delvis på egenhånd, en sentral ferdighet for å lykkes med R senere.
# Dersom mange får problemer med samme oppgave, gir jeg mer ytdypende forklaring i plenum. 
# Ellers finner dere mer informasjon om tabulering og grafikk i canvas),
# og mer om de andre emnene lengre ned i dette dokumentet.  
#                 
# De siste minuttene bruker vi på å snakke om oppgavene og annet dere måtte lure på i plenum. 
# Jeg skal også gå gjennom lagring av forskjellige typer output i R: plot, datasett og script.
#                 
# # [Organisering av arbeid i R](#organisering)
#                 
# Organisering av arbeid er viktig for å lykkes med **R**.
# Dersom du holder orden i scriptene dine, og koder fint og oversiktlig, med gode kommentarer, kommer du til å gjøre mindre feil. 
# Det blir også lettere for fremtidsversjonen av deg, og for andre å få glede av koden din. Det er såpass mye å tjene på god organisering at vi skal bruke de neste minuttene
# på dette emnet. 
#                   
#                  
#                   
#  ## Organisering av script 
#                   
# I første omgang skal vi fokusere på oppsett av `R-script`, dere skal få noen nyttige tips som vil gi dere gode vaner. Jeg rekker imidlertid ikke gjennom alle gode prinsipper, [her er noen flere forslag til hvordan du kan skrive god kode](https://google.github.io/styleguide/Rguide.xml). Jeg har lagt en [mal i mappen scripts](https://raw.githubusercontent.com/langoergen/stv1020R/master/scripts/seminar2.R) dere kan kopiere og bruke til dagens seminar, dere trenger derfor ikke å skrive alt jeg gjennomgår om oppsett av script. Dette scriptet, `seminar2.R` inneholder også oppgavene til dagen seminar.
#                 
#  ### Kommentering
# Som dere kanskje har lagt merke til, kan vi bruke `#` til å kommentere kode i R.
# Bruk kommentarer flittig, det hjelper fremtids-deg og andre å lese å forstå koden din. 
#                 
# I R-studio kan vi også lage seksjoner av kode, som man kan folde sammen. For å prøve dette, skriv `#### tekst ####` (flere `#` går også). På venstre side av tekstlinjen vil dere se en pil, skriv en setning kode under pilen og trykk på den.
# Sammen med meningsfulle overskrifter, et innebygget søkesystem og godt kommentert kode, hjelper dette folde-systemet deg til å finne rask frem i R-scriptet ditt.
#                 
#  Jeg anbefaler at dere starter R script med en overskrift, samt en kort beskrivelse av R scriptet etter headingen deres ved hjelp av `#`. 
#                 
# ### Renske R.
#  Dersom vi skal kjøre et nytt script, er det ofte ønskelig å fjerne objekter/arbeid fra andre script vi jobber med. Dette kan vi gjøre med `rm()`. 
#  Jeg pleier å benytte `rm(list=ls())`, som fjerner alle objekter vi har lagret i R.
#  R-scriptet deres bør fungere etter denne kommandoen, kjører dere flere R-scrip bør
#  være laget slik at de fungerer uavhengig av hverandre.               
# ### Working directory
#  Working directory er den mappen R forventer å hente å lagre filer i. Dere må spesifisere en sti gjennom mappene deres dersom dere vil hente filer
# fra andre steder på pcen. Jeg anbefaler derfor at dere lager en ny mappe for hvert nye prosjekt med R, og at dere lagrer alle filer knyttet til prosjektet 
# (data, bilder, script, figurer) her. For å finne ut hvilken mappe dere jobber fra for øyeblikket, kan vi bruke `getwd()`. 
# For å bestemme at en mappe skal være våres working directory bruker vi `setwd()`. 
# I script dere skal dele med andre, fjern innholdet fra `setwd()`. Her er en demonstrasjon av `setwd()`, som fungerer litt ulikt på windows og mac/linux:
# #                   

setwd("C:/Users/Navn/R/der/du/vil/jobbe/fra") # For windows
setwd("~/R/der/du/vil/jobbe/fra")             # For mac/linux
              
                
### Pakker 
# R er *open-source* software, som gjør det mulig for brukere å lage sine egne tilleggspakker til R. 
# Det finnes over **10 000** slike pakker, mange av dem inneholder mange funksjoner som løser spesifikke oppgaver mer effektivt enn grunninstallasjonen av R.
# Vi installerer nye pakker med `install.packages("pakkenavn")`. For å bruke installerte pakker, må vi laste inn pakkene med `library(pakkenavn)`. 
# Dersom dere skal dele kode, sett `#` foran `install.packages()`, slik at koden ikke kjøres, 
# det er kjedelig å sette i gang et script som installerer 10 pakker man allerede har på nytt. Inkluder imidlertid `library`. 
# Et godt tips er å skrive hvilken versjon av en pakke du bruker i en kommentar etter `library()`, da pakker noen ganger endres slik at koden din ikke fungerer. 
# Det er mulig å laste inn historiske versjoner av pakker, dermed bidrar dette også til å sikre reproduserbarhet. Her er et eksempel på installasjon og innlasting av pakker: 
                  

#### Kjør denne koden dersom du ikke har installert pakkene:
#install.packages(dplyr)
#install.packages(ggplot2)
#install.packages(haven)
                
#### Laster inn pakker:
library(dplyr)
library(ggplot2)
library(haven)
                
                
#                 
# Vi installerer og laster inn alle pakker vi trenger etter `setwd()`. Etter at vi har lastet inn pakkene vi trenger, er vi ferdig med å skrive preamble til scriptet, 
# resten av scriptet deler vi inn i seksjoner ved hjelp av `#### overskrift ####`. Dere bør nå ha en preamble som ser omtrent slik ut:
#                   

 #################################
 #### R seminar 2           ######
 #################################
                
 ## 1. Organisering av arbeidet ditt i R
 ## 2. Laste inn datasett
 ## 3. Statistiske mål (univariat og bivariat)
 ## 4. Grafikk (plot, ggplot)
 ## 5. Tabulering
 ## 6. Lagre output (write.csv, script, ggsave)
                
 ## Disse temaene er viktig grunnlag for å lykkes med dataanlyse i R. 
## Jeg bruker mye av det vi gjennomgår i all dataanalyse jeg gjør.
                
## Fjerner objekter fra R:
rm(list=ls())
                
 ## Setter working directory
 setwd("C:/Users/Navn/R/der/du/vil/jobbe/fra")
                
## Installerer pakker (fjerne '#' og kjør dersom en pakke ikke er installert)
 # install.packages(ggplot2)
 # install.packages(dplyr)
 # install.packages(haven)
                
 ## Laster inn pakker:
library(ggplot2)
library(dplyr)
library(haven)
                
 #### Overskrift 1 #####
## Kort om hva jeg skal gjøre/produsere i seksjonen
2+2 # her starter jeg å kode, som regel skal vi importere datasett her.
               
                
#Denne organiseringen hjelper deg og andre med å finne frem i scriptet ditt, samt å oppdage feil. 
                  
### Flere tips: 
# 1. Start en ny seksjon med en kommentar der du skriver hva du skal produsere i seksjonen, forsøk å bryte oppgaven ned i så mange små steg som du klarer. Dette gjør det ofte lettere å finne en fremgangsmåte som fungerer.
#2. Test at ny kode fungerer hele tiden, fjern den koden som ikke trengs til å løse oppgavene du vil løse med scriptet ditt (skriv gjerne i et eget R-script du bruker som kladdeark dersom du famler i blinde). Forsøk å kjøre gjennom større segmenter av koden en gang i blant. Hele scriptet skal fungere dersom du fjerner alle objekter med `rm(list = ls())`, og deretter kjører all koden i scriptet.
#                 
#                 
# ### Prosjekter og mappestruktur
#                 
# R lar deg opprette **projects**, som gir mye nyttig funksjonalitet for arbeid med og deling av større prosjekter (som seminarene i STV 1020). En særdeles nyttig egenskap ved **projects**, er at filene og mappene som utgjør prosjektet kan flyttes rundt på pcen din uten at referanser til filer slutter å fungere. Dette er særdeles nyttig ved deling av kode, eller dersom du vil arbeide fra en annen pc. Les mer [her](https://nicercode.github.io/blog/2013-04-05-projects/) 
#                 
# For å opprette et prosjekt trykker dere på `File` oppe til venstre i Rstudio. Deretter trykker dere på `New Project`. Dere kan nå lage et prosjekt i en ny eller i en eksisterende mappe. Velg ny mappe (new directory), sett type til default, og velg et navn på mappen prosjektet tar utgangspunkt i. Til slutt velger dere hvor på pcen den nye prosjektmappen skal lagre (f.eks. "Documents"). Når dere har opprettet et prosjekt i en ny mappe, kan dere lagre script i denne mappen. Dere kan også lage et mappesystem som starter i prosjkektmappen. Det kan for eksempel være fint med en mappe for data, en for script og en for bilder. 
#                 
#                 
# # [Laste inn datasett i R](#datasett)
#                 
# R lar deg laste inn datasett fra tekst, excel-filer, andre statistikkprogramm, internett og sikkert fra andre kilder også. 
# Funksjoner for å laste inn ulike filtyper vil ha litt ulik form. For ulike filtyper (e.g. `.csv`, `.txt` eller `.Rdata`), 
# finnes det egne funksjoner. Under har jeg lagt inn noen eksempler (her antas det at **working directory** er satt til mappen filen er lagret i).
# I denne koden lagres datasettet **"datasett"**, som er lagret som en fil på pcen din, som objektet `data` i R.
#                 
       #OBS: Siden "datasett" objektet her ikke finnes så vil man få en feilmelding nå         
               
load("datasett.Rdata") # .Rdata er R sitt eget filformat - merk: load oppretter objekt direkte
data <- read.csv("datasett.csv") # .csv er en filtype som brukes mye, og som stammer fra excel.
data <- read.table("datasett.txt") # Beslektet med read.csv. Har argumenter for å angi strukturen til tabeller
 data <- read_spss("datasett.sav")  # Leser .sav og .por filer fra SPSS, funksjonen stammer fra pakken haven
data <- read_stata("datasett.dat")  # Leser .dat filer fra STATA, funksjonen stammer fra pakken haven
                
                
#La oss laste inn et ekte datasett, som dere skal bruke i dagens seminar i fellesskap. 
#Vi skal laste inn en `.csv` fil med `read.csv()`. #Datasettet finner dere på seminarsiden "personstemmer.csv"

personst <- read.csv("personstemmer.csv", stringsAsFactors = F, sep=";") #her forteller jeg R at radene er skillt med ; i .csv filen (for å lese inn .csv må man ofte gjøre dette)
               
names(personst) # Gir deg navn i et objekt, for datasett er dette variabelnavn.
str(personst)    # Denne koden gir deg en oversikt over innholdet og strukturen til objekter.
                
head(personst)  # Denne koden printer de øverste radene i datasettet i Console
               
tail(personst)  # Denne koden printer de nederste radene i datasettet i Console
               

# Statistiske mål
                
#I introduksjonen til dagens seminar har dere sett på forskjellige funksjoner for univariat deskriptiv statistikk. 
#Forhåpentligvis har dere nå en formening om hva som foregår her (her bruker jeg eksempeldatasettet mtcars, det ligger allerede inne i R):
                  
             
summary(mtcars$mpg) # mpg er miles per gallon, enhetene er biltyper
              
sd(mtcars$mpg) #standardavvik
    
mean(mtcars$mpg) #gjennomsnitt
                
#                 
# I dagens seminar vil dere få oppgaver som også tar for seg bivariat statistikk, 
# med korrelasjonsmål. Til dette formålet skal vi bruke funksjonene `cor()` og `cor.test()`.
# Her er en forklaring av hvordan funksjonene virker, og demonstrasjon av hva slags output de gir:

# generell syntaks for variabler i datasett: cor(data$variabel1, data$variabel2)
# output i Console er et tall som angir korrelasjon (pearsons r)

  
cor(mtcars$mpg, mtcars$cyl) # Eksempel 
               
#Funksjonen `cor()` har blant annet argumenter som lar deg bestemme hvordan missing skal håndteres (argumentet `use()`), og hvilken korrelasjonskoeffisient som skal beregnes (argumentet `method`). Dersom du ikke angir en bestemt korrelasjonskoeffisient beregnes **pearsons r**. Bruk `?cor()` for mer informasjon
                
# generell syntaks for variabler i datasett: cor.test(): cor.test(datasett$variabel1, datasett$variabel2)
# output gir nå også konfidensintervall, t-test, frihetsgrader og p-verdi for t-testen. 
# 0 - hypotesen er at det ikke er korrelasjon mellom variabel1 og variabel2.

cor.test(mtcars$mpg, mtcars$cyl)
              
                
# I tillegg til å la deg bruke forskjellige korrelasjonskoeffisienter og metoder for å håndtere missing, gir `cor.test()` mulilgheten til å spesifisere andre 0 - hypoteser med argumentet `alternative =`. 
                
# [Grafikk](#grafikk)
                
#Dette emnet skriver jeg om i dokumentet til forrige seminar, Vi kommer stort sett bare til å bruke `ggplot()` funksjonen for plotting i seminarene.
                
#Her viser jeg hvordan vi lager et spredningsplot ved hjelp av argumentet `geom_point()`.
                
ggplot(mtcars, aes(x = mpg, y = cyl)) + geom_point()
              
#slik lager jeg en pdf fil av dette plottet
ggsave("Filnavn.filtype")

#**Bonus:** Det finnes utrolig mange muligheter for å pynte på `ggplot`, her er to lenker som hjelper deg med å finne fine farger til plottene dine: 
                  
# 1. [Farger fra scener i filmene til Wes Anderson](http://blog.revolutionanalytics.com/2014/03/give-your-r-charts-that-wes-anderson-style.html)
# 2. [De mest dominerende fargene i en jpeg fil](http://blog.revolutionanalytics.com/2015/03/color-extraction-with-r.html)
                

# [Tabulering](#tabulering)
                
#Dette emnet har jeg også skrevet om i [dokumentet til forrige seminar]
#. Det viktigste er at dere forstår `table()` funksjonen.
                

                
# andre time av dagens seminar skal dere få jobbe mer med logiske tester og indeksering. Forståelse for disse temaene er sentralt for å lykkes med den obligatoriske prøven, og for å kunne bruke R. Her er en oversikt over symbolene vi kan bruke til å lage logiske tester. 
                
#Symbol | Betydning     
# --      |---
# `<`     | mindre enn     
#`<=`    | mindre eller lik     
#`>`     | større enn    
#`>=`    | større eller lik    
# `==`    | helt lik    
#`!=`    | ulik    
#`!x`    | forskjellig fra x  
#`is.na` | logisk test for missing 
# `x|y`  | x eller y (`|` betyr eller)    
#`x & y` | x og y (`&` betyr og)    

#De to siste symbolene, `|` og `&`, brukest til å lage 
#logiske tester med flere betingelser. De resterende symbolene er logiske tester, som forteller deg om noe er `TRUE` eller `FALSE`.
                
#Vi har brukt logiske tester i indeksering ved hjelp av `which()`. Det er imidlertid flere viktige funksjoner for utvelging av variabler, enheter, og omkoding av variabler, som bruker resultatet av logiske tester som input. Her er en særlig nyttig funksjon: `ifelse()`.
                
#Den generelle syntaksen til `ifelse()` er:
#ifelse("logisk test", output hvis TRUE, output hvis FALSE)
                
#Denne funksjonen kan gjøre mye av det samme som `which()`. 
#Jeg foretrekker å bruke `ifelse()` til omkoding, mens jeg ofte bruker `which()` 
#til ren indeksering. Her er et eksempel på opprettelse av en dummy variabel for biler med 8 sylindre ved hjelp av `ifelse()`:
                  
mtcars$eight <- ifelse(mtcars$cyl == 8, 1, 0)
table(mtcars$eight)

#Dersom dere får god tid, oppfordrer jeg dere til å forsøke å løse oppgaver der du må bruke logiske tester både med `ifelse()` og `which()`.
                
# [Lagre output](#lagre)
                
#Her gjennomgår jeg lagring av tre typer output: R-script, plot og datasett. Lagring av fine tabeller vil bli gjennomgått i et senere seminar. Med lagring av output, referer jeg her til lagring av informasjon i filer på datamaskinen din, ikke som objekter i R.
                
### lagre et R-script
                
#Trykk på `File` øverst til venstre i Rstudio. Trykk deretter på `Save As`, og angi et filnavn. Ikke inkluder `.` i filnavnet, R setter scriptet til filtypen `.R` (R-script) automatisk.
                

              
### Lagre et datasett
                
#Mange datasett må fikses og jobbes mye med før det kan brukes til analysen vi ønsker. Dersom vi har gjort masse arbeid med et datasett, er det fint å lagre det oppdaterte datasettet som en fil på pcen. Da slipper vi å kjøre all koden som rydder opp i data på nytt. Før dere får koden for å lagre datasett skal dere imidlertid få en regel som dere aldri bør bryte:
                  
#Aldri skriv over en rådatafil!
                  
#Dersom du skriver over rådatafilen, vil du ikke kunne reprodusere analysen din fra bunn. En statistisk analyse blir mye mer troverdig dersom andre får muligheten til å etterprøve arbeidet ditt. Du kan også miste sjansen til å angre på valg du har tatt. Følg dette rådet.
                
# Det er imidlertid lov å skrive over filer som ikke inneholder rådata (altså data du startet å jobbe med).
                
#Her er koden for å lagre datasettet `personst` i en annen fil enn rådatafilen:
                  
# generell syntaks: write.csv(objekt, "filsti/filnavn.csv")

write.csv(personst, "personstemmer2.csv")
            
                
#I mange sammenhenger er det forøvrig ønskelig å bruke argumentet `row.names = F` i `write.csv.`
                
                
 ## Takk for i dag!
                
#* Oppgaver blir lagt ut senere i dag, tutorial kommer til helgen. 
#* Jeg håper dere innser viktigheten av å organisere scriptene deres pent.
                  