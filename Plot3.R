#Exploratory data analysis assignment 1 - Plot 3
#remove(list=ls)
##Import data file
HH_Pwr<-data.frame(read.table("household_power_consumption.txt",sep = ";",header = TRUE, stringsAsFactors=F))
head(HH_Pwr)

## Subset data file for 1/2/2007 & 2/2/2007
HH_Pwr_Subset<-subset(HH_Pwr,with(HH_Pwr,HH_Pwr$Date=="1/2/2007"|HH_Pwr$Date=="2/2/2007"))
head(HH_Pwr_Subset)
rm(HH_Pwr) ##Remove original file after extracting required data

##Create new datetime column
HH_Pwr_Subset$DateTime<-paste(HH_Pwr_Subset$Date,HH_Pwr_Subset$Time)
HH_Pwr_Subset$DateTime<-strptime(HH_Pwr_Subset$DateTime,"%d/%m/%Y %H:%M:%S",tz="GMT")
head(HH_Pwr_Subset$DateTime)

##Change datatypes of Sub_metering columns to numeric
class(HH_Pwr_Subset$Sub_metering_1)
class(HH_Pwr_Subset$Sub_metering_2)
class(HH_Pwr_Subset$Sub_metering_3)
HH_Pwr_Subset$Sub_metering_1=as.numeric(HH_Pwr_Subset$Sub_metering_1)
HH_Pwr_Subset$Sub_metering_2=as.numeric(HH_Pwr_Subset$Sub_metering_2)
HH_Pwr_Subset$Sub_metering_3=as.numeric(HH_Pwr_Subset$Sub_metering_3)

####Creating plot3
plot(HH_Pwr_Subset$DateTime,HH_Pwr_Subset$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
#par(mar= c(5, 4, 4, 2))
lines(HH_Pwr_Subset$DateTime,HH_Pwr_Subset$Sub_metering_1)
lines(HH_Pwr_Subset$DateTime,HH_Pwr_Subset$Sub_metering_2,col="Red")
lines(HH_Pwr_Subset$DateTime,HH_Pwr_Subset$Sub_metering_3,col="Blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col = c("Black","Red","Blue"))
dev.copy(png,file="Plot3.png")
dev.off()

