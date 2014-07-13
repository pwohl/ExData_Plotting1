##############PLOT 1#####################
#Set directory and read in data
setwd("C:\\WorkSpace\\Coursera\\ExplorataryData\\Project1")
Hh.Po.Co<-read.table("household_power_consumption.txt",
                     header = TRUE,
                     nrows=2075259,
                     sep=";",
                     na.strings = "?")

###Instructions
#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
#You may find it useful to convert the Date and Time variables 
#to Date/Time classes in R using the strptime() and as.Date() functions.
#Date: Date in format dd/mm/yyyy
#Time: time in format hh:mm:ss 

#Convert Date and Time variables
attach(Hh.Po.Co)
x <- paste(Date, Time)
Date.Time<-strptime(x, "%d/%m/%Y %H:%M:%S")
Hh.Po.Co.data<-cbind(Date.Time,Hh.Po.Co)
detach(Hh.Po.Co)

#Subset the data
Hh.Po.Co.subdata<-rbind(Hh.Po.Co.data[Hh.Po.Co.data$Date=="1/2/2007",],
                        Hh.Po.Co.data[Hh.Po.Co.data$Date=="2/2/2007",])



#plot 1
#Global_active_power: household global minute-averaged active power (in kilowatt) 

with(Hh.Po.Co.subdata,hist(Global_active_power,
                           col="red",
                           xlab="Global Acitve Power (kilowatts)",
                           #ylab="",
                           ylim=c(0,1200),
                           xlim=c(0,6),                      
                           main="Global Acitve Power"))

dev.copy(png, file = "plot1.png")
