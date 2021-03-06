##Plot 3
Hh.Po.Co<-read.table("household_power_consumption.txt",
                     header = TRUE,
                     nrows=2075259,
                     sep=";",
                     na.strings = "?")


#Convert Date and Time variables
attach(Hh.Po.Co)
x <- paste(Date, Time)
Date.Time<-strptime(x, "%d/%m/%Y %H:%M:%S")
Hh.Po.Co.data<-cbind(Date.Time,Hh.Po.Co)
detach(Hh.Po.Co)

#Subset the data
Hh.Po.Co.subdata<-rbind(Hh.Po.Co.data[Hh.Po.Co.data$Date=="1/2/2007",],
                        Hh.Po.Co.data[Hh.Po.Co.data$Date=="2/2/2007",])



#Plot 3
png("plot3.png", width=480, height=480)

with(Hh.Po.Co.subdata,
     plot(Date.Time,Sub_metering_1,
          type="l",
          ylab="Energy sub metering",
          xlab=""))
with(Hh.Po.Co.subdata,
     lines(Date.Time,Sub_metering_2,
           col="red"))
with(Hh.Po.Co.subdata,
     lines(Date.Time,Sub_metering_3,
           col="blue"))
legend("topright",lty=1,col=c(1,2,3),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
