#################################################################
#####                                                       #####
#####                                                       #####
#####                 1. SEMINAR 1020                       #####
#####                                                       #####
#####                                                       #####
#################################################################

#####Velkommen!####
Navn <- c("Navn1", "Navn2", "Navn3")
Alder <- c(2, 6, 7)
barplot(Alder, names.arg = Navn, col = "Green", main = "Mine Venner")
#################################################################
#####                                                       #####
#####                                                       #####
#####                 1. Script og Konsoll                  #####
#####                                                       #####
#####                                                       #####
#################################################################

###   NOEN TIPS TIL Å MANØVRERE SEG I RSTUDIO: ###
##  I SCRIPTET SKRIVER VI KODE. SÅ SENDER VI KODEN TIL "KONSOLLEN. I KONSOLLEN SKJER MAGIEN.
##  CTRL/CMD + ENTER: SENDER KODE
##  CTRL/CMD + ENTER: HVIS DU HAR MARKERT ET STYKKE KODE, SÅ SENDER DEN ALL KODE DU HAR MARKERT
##  CTRL/CMD + ENTER: HVIS DU IKKE HAR MARKERT NOE KODE, SENDER DEN KODELINJEN MARKØREN ER PÅ (DETTE ER LINJE 39, SE TIL VENSTRE)
## EVT. I RSTUDIO KAN DU KLIKKE PÅ "RUN" I ØVRE HØYRE HJØRNE. DA VIL DEN KJØRE KODEN PÅ LINJEN MARKØREN ER PÅ
## <<<--- DISSE GJØR AT JEG KAN SKRIVE KOMMENTARER. ALT ETTER # BLIR IKKE "EVALUERT" AV KONSOLLEN. OM DU SKRIVER 2, 5 ELLER 100 # GJØR INGEN FORSKJELL.

#####     R SOM EN KALKULATOR:    #####

##  PRØV Å SENDE DISSE LINJENE:


#UTREGNING:
1 + 1

##  VI "SPØR" R OM VI HAR RIKTIG SVAR:
##  HVIS 1 + 1 BLIR 2, VIL R SVARE TRUE, HVIS 1 + 1 IKKE BLIR 2, VIL DEN SVARE FALSE
1 + 1 == 2
1 + 2 == 2


##  KONSOLLEN EVALUERER IKKE TING SOM KOMMER ETTER "#"
10 * 10 # + 10 * 3


# <----- FORHOLD DEG TIL KODELINJNENE

#################################################################
#####                                                       #####
#####                                                       #####
#####                       2. OBJEKTER                     #####
#####                                                       #####
#####                                                       #####
#################################################################


## I R LAGER VI "OBJEKTER" AV INFORMASJON.
## DET BETYR: VI "LAGRER" INFORMASJONEN VÅR MIDLERTIDIG I PROGRAMMET (MEN IKKE PÅ MASKINEN!)
## HVA VI LAGRER, KAN VÆRE HVA SOM HELST: VI BARE GIR DET ET NAVN OG BER R HUSKE PÅ DET FOR OSS


##  OBJEKTER LAGER VI VED HJELP AV "<-"
et_tall <- 10
et_tall


##  VI TRENGER IKKE BEGRENSE OSS TIL TALL:
navn <- "Hva skal den inneholde da?!?"
navn

Navn <- "Hvertfall ikke dét"
navn <- 10

## OG ETT OBJEKT KAN INNEHOLDE MER ENN BARE 1 TALL:
Vektor <- 1:10  # LEGG MERKE TIL AT ":" LAGER EN REKKE AV TALL FRA 1 TIL 10.
Vektor

##  OBJEKTER KAN HETE HVA SOM HELST:
lars_sponheim <- "Hver mann sin høne!"
lars_sponheim

##  VED Å KJØRE NAVNET TIL ET OBJEKT, KAN VI HENTE UT INFORMASJONEN OBJEKTET INNEHOLDER, OG ANVENDE INFORMASJONEN. 
##  AKKURAT SOM VI GJORDE OVENFOR, KAN VI GJØRE REGNESTYKKER MED OBJEKTER SOM INNEHOLDER TALL (MEN IKKE DE SOM INNEHOLDER TEKST):

Ti <- 10
Ti
Ti + Vektor
Ti * Vektor
Ti / Vektor
Vektor^2
Vektor^Ti

#EKSPERIMENTER LITT MED Å LAGE OBJEKTER!

## MERK FOR ØVRIG AT R ER SENSITIVT TIL STORE OG SMÅ BOKSTAVER:
## Oppgave: Lag et objekt med samme navn som fornavnet ditt, som inneholder alderen din.






#################################################################
#####                                                       #####
#####                                                       #####
#####                     3. FUNKSJONER                     #####
#####                                                       #####
#####                                                       #####
#################################################################

##  DERSOM VI ØNSKER Å GJØRE NOE I R, FÅR VI SOM REGEL EN FUNKSJON TIL Å GJØRE JOBBEN FOR OSS.
##  EN FUNKSJON ER EN KODESNUTT HVOR VI LEVERER INPUT NOE OG FÅR UT NOE ANNET ETTER AT FUNKSJONEN HAR OMARBEIDET INPUT.
##  HOVEDDELEN AV DET VI SKAL GJØRE I DISSE SEMINARENE, ER Å LÆRE MASSEVIS AV FUNKSJONER OG HVORDAN MAN BRUKER DEM.
##  FUNKSJONER GJØR ENKLE TING, SOM Å FINNE GJENNOMSNITT. OG DE GJØR AVANSERTE TING, SOM Å SPÅ SANNSYNLIGHETEN FOR BORGERKRIG

##  ALLE FUNKSJONER HAR SAMME STRUKTUR:
##  funksjonsnavn(argument1 = , argument2 = , ... argumentK =)

##  funksjonsnavn = NAVNET PÅ FUNKSJONEN
##  argument = "INSTILLINGER" TIL FUNKSJONEN.

##  HJELPESIDEN TIL FUNKSJONER FINNER MAN VED Å KJØRE ?navn
##  DER FINNER MAN argumentene TIL EN FUNKSJON, OG "STANDARDINSTILLINGENE"

## SOM REGEL ER FØRSTE ARGUMENT INPUT, INFORMASJONEN SOM FUNKSJONEN SKAL BRUKE TIL Å PRODUSERE OUTPUT
## DVS.: funksjonsnavn(argument1 = "input")

##  FOR EKSEMPEL (HUSK AT OBJEKTET VÅRT Vektor INNEHOLDER 1 TIL 10):
mean(x = Vektor)
?mean


##  mean HAR ET ARGUMENT "na.rm="
##  I HJELPEFILA SER VI AT na.rm= SIN STANDARDINSTILLING ER "FALSE"
##  na.rm= STÅR FOR "NA REMOVE". "NA" STÅR FOR "NOT AVAILABLE", OG ER DET SAMME SOM "MISSING" I PENSUM.
##  ARGUMENTET na.rm VIL DUKKE OPP I MANGE FUNKSJONER.

##  MAN KAN IKKE BEREGNE ET GJENNOMSNITT DERSOM MAN MANGLER INFORMASJON OM EN AV ENHETENE SOM GJENNOMSNITTET ER BEREGNET OVER.
##  DERFOR FUNGERER IKKE `mean()` HVIS VI ENDRER Vektor TIL DET FØLGENDE:
Vektor2 <- c(10, 2, 3, NA)
mean(x = Vektor2, na.rm = FALSE)

##  VED Å SETTE na.rm=TRUE, FJERNER R ALLE "NA" FØR DEN BEREGNER GJENNOMSNITTET:
mean(x = Vektor2, na.rm = TRUE)



##  ELLERS FUNGERER mean OG MANGE ANDRE MATEMATISKE FUNKSJONER AKKURAT SOM MATEMATIKK:
Vektor <- 1:10
mean(Vektor)
mean(Ti + Vektor)
mean(Ti) + Vektor
mean(Vektor) + Ti


##  HER ER NOEN ANDRE FUNKSJONER SOM BRUKES OFTE:
median(Vektor)
sum(Vektor)
sd(Vektor)
sqrt(Vektor)
length(Vektor)

# TEST PÅ OM DERE FØLGER MED: HVORDAN KUNNE VI REGNET GJENNOMSNITT AV "Vektor" PÅ EGENHÅND? (Uten å bruke `mean()`)

# VI KAN OGSÅ LAGE VÅR EGEN FUNKSJON AV KODEN OVER  (SOM VI DERETTER KAN BRUKE)-
# FORSØK Å ENDRE FUNKSJONEN UNDER SLIK AT DEN RETURNERER DET DOBBELTE AV GJENNOMSNITTET  
gj_snitt <- function(x){
  sum(x)/length(x)
}
gj_snitt(Vektor)

###################################################################
#####                                                         #####
#####                                                         #####
#####                       4. VEKTORER                       #####
#####                                                         #####
#####                                                         #####
###################################################################


##  VI KAN LAGRE EN VARIABEL SOM EN VEKTOR.
##  EN VEKTOR ER EN REKKE AV ELEMENTER AV SAMME TYPE, SOM ER ORDNET I EN BESTEMT REKKEFØLGE (DETTE GJELDER UNIVERSELT, IKKE BARE R)

##  ET DATASETT ER BARE MANGE VEKTORER VED SIDEN AV HVERANDRE (MED EN BESTEMT REKKEFØLGE, SLIK AT HVER RAD INDIKERER EN "ENHET")


##  HVA BETYR DET AT EN VEKTOR HAR ELEMENTER AV "SAMME TYPE"?
##  DET BETYR AT DU IKKE KAN SLÅ SAMMEN TALL OG TEKST.
##  HVILKEN TYPE VEKTOREN HAR, FINNER VI MED FUNKSJONEN class()
##  EN ANNEN FUNKSJON SOM GIR OSS NYTTIG INFO OM OBJEKTER ER str()
##  FOR Å LAGE EN VEKTOR, KAN VI BRUKE ":" OG c()
##  VI HAR SÆRLIG 5 TYPER VEKTORER:


##  HELTALL (INTEGER):
IntegerVektor <- 1:10
class(IntegerVektor)
summary(IntegerVektor)

##  NUMERISK, ALTSÅ MED DESIMALER (NUMERIC):
NumeriskVektor <- 0.5:10
NumeriskVektor
class(NumeriskVektor)
summary(NumeriskVektor)

##  TEKST (CHARACTER):
TekstVektor <- c("kjøtt", "fisk", "vegetar", "vegetar", "fisk",
                 "vegetar", "kjøtt", "kjøtt", "fisk", "vegetar")
class(TekstVektor)
summary(TekstVektor)
table(TekstVektor)

##  FAKTOR, ELLER "KATEGORIER" (FACTOR):
FaktorVektor <- c("Liten", "Middels", "Stor", "Liten",
                  "Liten", "Stor", "Middels", "Stor",
                  "Middels", "Liten")
FaktorVektor <- factor(FaktorVektor)
?factor

FaktorVektor <- factor(c("Liten", "Middels", "Stor", "Liten",
                         "Liten", "Stor", "Middels", "Stor",
                         "Middels", "Liten"))

class(FaktorVektor)
levels(FaktorVektor) # LEGG MERKE TIL AT R HAR KATEGORISERT -- ALFABETISK
summary(FaktorVektor)

##  LOGISKE, SOM BARE TAR VERDIEN TRUE ELLER FALSE, (LOGICAL):
LogiskVektor <- c(TRUE, TRUE, FALSE, TRUE, FALSE,
                  FALSE, TRUE, FALSE, FALSE, FALSE)
class(LogiskVektor)




##  HVIS DU PRØVER Å SETTE SAMMEN ELEMENTER MED FORSKJELLIG TYPE, VIL DE KONVERTERES TIL ELEMENTET MED LAVEST MÅLENIVÅ
eksempel1 <- c("Tekst", 4, TRUE)

class(eksempel1)
str(eksempel1) # str forteller oss også at eksempel1 er character, men forkorter til chr
eksempel1

## OPPGAVE: KJØR KODEN UNDER, HVA KAN DU SI OM MÅLENIVÅET TIL "liste" OG "ikkeliste"?
liste <- list(c("tekst", 'tekst2'), 4, c(TRUE, FALSE))
class(liste)
str(liste)
ikkeliste <- unlist(liste)
class(ikkeliste)
str(ikkeliste)

##  UNNGÅ Å BLANDE MÅLENIVÅER (MED MINDRE DET ER EN GOD GRUNN TIL Å GJØRE DET),
##  vEKTORER BESTÅENDE AV ELEMENTER AV SAMME TYPE ER SOM REGEL LETTEST Å JOBBE MED.




###################################################################
#####                                                         #####
#####                                                         #####
#####               5. INDEKSERING AV VEKTORER                #####
#####                                                         #####
#####                                                         #####
###################################################################

##  HVA BETYR INDEKSERING?
##  JO: HVIS VI HAR EN VEKTOR MED 10 ELEMENTER, MEN VIL HA UT ELEMENT NR. 5, 
##  MÅ VI PÅ EN ELLER ANNET MÅTE BE R OM Å BARE FÅ ELEMENT NR. 5.
##  DA BRUKER VI []

FaktorVektor
FaktorVektor[3]
NumeriskVektor
NumeriskVektor[3]
FaktorVektor[5]
NumeriskVektor[1:5]


##  OFTE ER VI IKKE UTE ETTER AKKURAT ELEMENT NUMMER 3 ELLER 5, 
##  MEN ETTER DE DELENE AV EN VEKTOR SOM TILFREDSSTILLER ETT ELLER ANNET.
##  FOR EKSEMPEL VIL VI KANSKJE HA UT DE SOM HAR STEMT venstre I EN SPØRREUNDERSØKELSE, 
##  ALLE MED INNTEKT UNDER 400 000 ELLER LIGNENDE.

##  which() SVARER OSS PÅ "HVILKE DELER AV DETTE OBJEKTET TILFREDSSTILLER <ET ELLER ANNET>. FOR EKSEMPEL:
NumeriskVektor
NumeriskVektor >= 5
which(NumeriskVektor >= 5)


##  VED Å PUTTE which() INN I [] HENTER VI UT DE ELEMENTENE SOM TILFREDSSTILLER DET VI BER OM
NumeriskVektor[which(NumeriskVektor >= 8)]  ##  DISSE GIR ALTSÅ SAMMERESULTAT
which(NumeriskVektor >= 8)
NumeriskVektor[9:10]                        ##  DISSE GIR ALTSÅ SAMME RESULTAT




##  PÅ SAMME MÅTE KAN VI STILLE R FORSKJELLIGE SPØRSMÅL SOM PROGRAMMET SVARER PÅ:
LogiskVektor

LogiskVektor == FALSE ##  HER SPØR VI PROGRAMMET: "ER ELEMENTET I LogiskVektor FALSE? SÅ GIR DEN OSS TRUE (JA DET ER FALSE),
## ELLER FALSE (NEI DET ER IKKE FALSE) FOR HVERT ELEMENT I LogiskVektor
which(LogiskVektor == FALSE)   ##  HER SPØR VI PROGRAMMET: "HVILKE ELEMENTER I LogiskVektor ER FALSE? SÅ GIR DEN OSS DE ELEMENTNUMRENE SOM HAR FALSE


## OPPGAVE: LAG EN VEKTOR BESTÅENDE AV ALLE HELTALL FRA 100 TIL 1 (I SYNKENDE REKKEFØLGE), 
## OG INDEKSER ELEMENT 20 TIL 40 FRA DENNE VEKTOREN
## DU HAR GJORT RIKTIG DERSOM DU FÅR HELTALLENE FRA 81 TIL 61 I CONSOLE


###################################################################
#####                                                         #####
#####                                                         #####
#####                 6. DATA FRAMES (DATASETT)               #####
#####                                                         #####
#####                                                         #####
###################################################################

## ET DATASETT ER MANGE VEKTORER SATT SAMMEN SOM KOLONNER.
## REKKEFØLGEN ER VIKTIG: HVER RAD INDIKERER EN VISS ENHET.

##  VI KAN LAGE ET DATASETT AV VEKTORENE VÅRE SLIK:
##  LEGG MERKE TIL ARGUMENTET "stringsAsFactors". VANLIGVIS BLIR "TEKST"-VEKTORER OMGJORT TIL FAKTORER, MEN DET SKRUR VI AV MED DETTE ARGUMENTET,
##  FORDI VI VIL BEHOLDE DE SOM TEKST.
datasett <- data.frame(IntegerVektor, NumeriskVektor,
                       TekstVektor, FaktorVektor, LogiskVektor,
                       stringsAsFactors = FALSE)

TekstVektor
class(datasett)
datasett
?data.frame


##  FOR Å GJØRE DET MER ELEGANT, KAN VI SPESIFISERE NAVN PÅ KOLONNENE:
datasett2 <- data.frame(id = IntegerVektor,
                        sovn = NumeriskVektor,
                        middag = TekstVektor,
                        mengde = FaktorVektor,
                        stringsAsFactors = FALSE)
datasett2

##  MED View() KAN VI SE PÅ DATASETTET I STEDET FOR Å PRINTE I KONSOLLEN:
View(datasett2)


##  FOR Å HENTE UT EN KOLONNE, BRUKER VI $ SLIK:
##  <navn på datasettet>$<navn på kolonne>
datasett2$sovn
datasett2$middag

##  ... OG INDEKSERER PÅ SAMME MÅTE SOM OVENFOR:
datasett2$middag[which(datasett2$middag == "fisk")]
datasett2$sovn[which(datasett2$middag == "fisk")]

datasett2

##  VI MÅ IKKE BRUKE $. VI KAN OGSÅ BRUKE []
##  NÅR ET OBJEKT HAR FLERE DIMENSJONER (SOM DATASETT SOM HAR 2: RADER OG KOLONNER), KAN VI BRUKE KOMMA I [,] TIL Å SPESIFISERE RADER OG KOLONNER
##  SLIK: [rad,kolonne]

datasett[3, 4]

datasett[2:5, 3]
datasett2[c(1, 3), c(2, 3)]
##  HVIS DET ER TOMT PÅ ENTEN PLASSEN TIL RADER ELLER TIL KOLONNER, HENTER R ALLE:
datasett2[2:5, ]
datasett2[which(datasett2$sovn >= 5), ]


##  VI KAN OGSÅ BRUKE NAVNENE PÅ KOLONNENE:
datasett[, "NumeriskVektor"]
datasett[, c("sovn", "middag")]
datasett2[, c("sovn", "middag")]

##  c() BRUKES TIL Å KOMBINERE ELEMENTER I DEN ORDNEDE REKKEFØLGEN VI ØNSKER:
datasett[c(6, 5, 2), c("TekstVektor", "NumeriskVektor", "IntegerVektor")]
datasett[c(6, 5, 2), c(2, 3)]


datasett
## OPPGAVE: LAG TEKSTVEKTOREN "tekst" SOM BESTÅR  av DE TO VERDIENE "to" OG "tre".
## LAG OGSÅ EN TALLVEKTOREN "tall" BESTÅENDE AV TALLENE FRA 1 TIL 10. 
## OPPRETT DERETTERET DATASETT BESTÅENDE AV DE TO VARIABLENE VED HJELP AV data.frame
## INSPISER DATA, OG DISUKTER HVA SOM SKJER MED SIDEMANNEN



###################################################################
#####                                                         #####
#####                                                         #####
#####                         7. GRAFIKK                      #####
#####                                                         #####
#####                                                         #####
###################################################################


##  GRAFIKK ER HELT SENTRALT, BÅDE FOR Å FORSTÅ OG FOR Å FORMIDLE STATISTISKE RESULTATER (OG FORDI DET ER GØY).
##  VI KAN LAGE ET HELT ENKELT TO-DIMENSJONALT PLOT MED plot()
##  DET FUNGERER SLIK: plot(x-aksen, y-aksen)
plot(datasett$IntegerVektor, datasett$NumeriskVektor)

## VI KOMMER TIL Å BRUKE FUNKSJONEN ggplot() FRA PAKKEN ggplot2, SOM ER EN ANNEN MÅTE Å PLOTTE PÅ -- OFTE ENKLERE "OUT OF THE BOX" ENN plot()
## DET FINNES EKSTREMT MANGE PAKKER SOM INNEHOLDER FUNKSJONER SOM IKKE FØLGER MED GRUNNINSTALLASJONEN AV R. 
## FOR Å BRUKE FUNKSJONER FRA PAKKER, MÅ VI KJKØRE TO LINJER MED KODE (Først installere og så fortelle R at denne skal være i denne sesjonens bibliotek):

install.packages("ggplot2")
library(ggplot2)

## NÅ KAN VI BRUKE FUNKSJONEN ggplot() FRA PAKKEN ggplot2:

prikkeplot <- ggplot(datasett, aes(x = IntegerVektor, y = NumeriskVektor))
prikkeplot

## VI MÅ LEGGE TIL EN "LAYER" FOR Å FÅ INN DATA
prikkeplot + geom_point()

##   (FULL OVERSIKT OVER PUNKTER FINNER DU HER: http://sape.inf.usi.ch/quick-reference/ggplot2/shape)
prikkeplot + geom_point(shape = 1)


##  VI KAN OGSÅ FARGELEGGE BASERT PÅ VERDIEN I EN ANNEN KOLONNE:
prikkeplot <- prikkeplot + geom_point(aes(color = TekstVektor))
prikkeplot
##  LA OSS SETTE NAVN PÅ X- OG Y-AKSEN
prikkeplot <- prikkeplot + labs(x = "Antall øl drukket", y = "Hodepineindeks")
prikkeplot

##  DE SOM VIL HA LITT Å BRYNE SEG PÅ, KAN PRØVE Å FORSTÅ ALT SOM FOREGÅR HER:
ggplot(datasett, aes(x = IntegerVektor, y = NumeriskVektor)) +
  geom_point(aes(color = TekstVektor, size = as.numeric(FaktorVektor)), shape = 64) +
  labs(x = "Antall øl drukket", y = "Hodepineindeks",
       color = "Middag", size = "Kg mat konsumert",
       title = "Tulleplot") +
  theme_classic()+
  theme(panel.grid.major.y = element_line(color = "gray", linetype = "dashed"),
        axis.line = element_line(arrow = arrow()))

## ggplot() GJØR DET LETT Å SE MANGE VARIABLER I SAMMENHENG, MEN VI MÅ OFTE JOBBE FOR Å VISUALISERE INFORMASJONEN EFFEKTIVT 
##VI må først installere og aktivere pakken "ggthemes"
install.packages("ggthemes")
library(ggthemes)

ggplot(datasett, aes(x = IntegerVektor, y = NumeriskVektor)) +
  geom_point(aes(color = TekstVektor, size = as.numeric(FaktorVektor)), shape = 1) +
  labs(x = "Antall øl drukket", y = "Hodepineindeks",
       color = "Middag", size = "Kg mat konsumert",
       title = "Tulleplot") +
  theme_tufte() +
  theme(panel.grid.major.y = element_line(color = "gray", linetype = "dashed"),
        axis.line = element_line(arrow = arrow()))



###################################################################
#####                                                         #####
#####                                                         #####
#####                         8. Tabulere                     #####
#####                                                         #####
#####                                                         #####
###################################################################

##  TABULERING ER EN SENTRAL DEL AV PENSUM
##  FOR Å LAGE TABELLER OG KRYSSTABELLER, BRUKER VI table()



table(datasett$IntegerVektor)
table(datasett$LogiskVektor)
table(datasett$FaktorVektor)    ##  ALTSÅ: 4 ENHETER HAR VERDIEN "Liten"

table(datasett$FaktorVektor, datasett$LogiskVektor) ## 3 ENHETER HAR KOBINASJONEN "Stor" OG "FALSE"


##  SOM ALLE ANDRE TING, KAN VI LAGRE TABELLER SOM OBJEKTER:
tabell <- table(datasett$FaktorVektor, datasett$LogiskVektor)

tabell
class(tabell)
str(tabell)


##  I STEDET FOR Å FÅ ANTALL ENHETER, KAN VI BEREGNE ANDEL ENHETER:
sum(tabell)                         ##  DET ER TI ENHETER. DELER VI HVER CELLE I TABELLEN PÅ DETTE, FÅR VI ANDEL.
tabell / sum(tabell)                  ##  ANDEL
tabell_andel <- tabell/sum(tabell)

datasett
# SIDEN VI IKKE TRENGER DISSE TULLEDATAENE VIDERE KAN VI FJERNE ALT FRA "ENVIRONMENT"
rm(list = ls())

# LAGRE SCRIPTET PÅ PCEN DERES VED Å TRYKKE PÅ CTRL/CMD + S (DERE KAN SKIFTE WORKING DIRECTORY FØRST)
# KALL FILEN FOR SEMINAR1
# FILEN SKAL NÅ DUKKE OPP UNDER FILES I PANELET NEDE TIL HØYRE SOM SEMINAR1.R


##### FØR NESTE SEMINAR #####

##  ETTER HVERT SEMINAR LEGGER JEG UT OPPGAVER OG EN INTRODUKSJON TIL NESTE SEMINAR PÅ GITHUB, JEG LENKER TIL DETTE GJENNOM CANVAS. 
##  JEG TAR I MOT SPØRSMÅL OM OPPGAVENE PÅ STARTEN AV NESTE SEMINAR, JEG GIR OGSÅ GJERNE MER DETALJERTE
##  TILBAKEMELDINGER PÅ CANVAS. 

##  ALL VIKTIG INFORMASJON KOMMER GJENNOM CANVAS.

##### NESTE GANG #####

# 1. Kort gjennomgang av hjemmeoppgaver
# 2. Organisering av arbeid i R-studio
# 3. Laste inn data
# 4. Tabulering
# 5. Deskriptiv statistikk
# 6. Enkel omkoding
# 7. Boxplot
# 9. Arbeid med oppgaver