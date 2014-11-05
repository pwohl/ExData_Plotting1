##Plot 4
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



#plot 4

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2),mar=c(4,4,1,1))
#1

with(Hh.Po.Co.subdata,
     plot(Date.Time,Global_active_power,
          type="l",
          ylab="Global Acitve Power (kilowatts)",
          xlab=""))
#2
with(Hh.Po.Co.subdata,
     plot(Date.Time,Voltage,
          type="l",
          ylab="Voltage",
          xlab="datetime"))
#3
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
legend("topright",lty=1,col=c(1,2,3),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n")
       
#4
with(Hh.Po.Co.subdata,
     plot(Date.Time, Global_reactive_power,
          type="l",
          ylab="Global_reactive_power",
          xlab="datetime"))

dev.off()
