#Question 1

download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile="Q1.csv",method="curl")
Q1 <- read.csv("Q1.csv",header=TRUE, sep=",")
strsplit(colnames(Q1),"wgtp")

#Question 2

download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv ",destfile="FGDP.csv",method="curl")
FGDP  <- read.csv(file="FGDP.csv", header = FALSE, sep = ",", skip=5)
FGDP <- FGDP[(FGDP$V1!="" & FGDP$V2!=""),]
FGDP$N5 <- as.numeric(gsub(",","",FGDP$V5))
summary(FGDP)

# Question 3

FGDP$countryNames <- FGDP$V4
FGDP[order(FGDP$countryNames),]

# Question 4

download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",destfile="FED.csv",method="curl")
FED  <- read.csv(file="FED.csv", header = TRUE, sep = ",")

FGDP  <- read.csv(file="FGDP.csv", header = FALSE, sep = ",", skip=5)
FGDP <- FGDP[(FGDP$V1!="" & FGDP$V2!=""),]

mergedData = merge(FGDP,FED,by.x="V1",by.y="CountryCode",all=FALSE)
DF <- mergedData[grep("^Fiscal",mergedData$"Special.Notes"),]$"Special.Notes"
DF[grep("June",DF)]

# Question 5

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

nrow(as.data.frame(grep("^2012",sampleTimes))) # 250

DF <- as.data.frame(sampleTimes[grep("^2012",sampleTimes)])
colnames(DF) <- c("Date")

library(lubridate)

DF$NN <- ymd(DF$Date)
DF$wd <- weekdays(DF$NN)
nrow(DF[DF$wd=="Lundi",]) #47
