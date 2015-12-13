#Exploratory data analysis assignment 1 - Plot 2
#rm(list=ls())
getwd()

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
HH_Pwr_Subset$DateTime

## Convert data type of Global_active_power to numeric
HH_Pwr_Subset$Global_active_power=as.numeric(HH_Pwr_Subset$Global_active_power)

####Creating plot2
plot(HH_Pwr_Subset$DateTime,HH_Pwr_Subset$Global_active_power, type="n",xlab="",ylab="Global Active Power (kilowatts)") 
lines(HH_Pwr_Subset$DateTime,HH_Pwr_Subset$Global_active_power) 
dev.copy(png,file="Plot2.png")
dev.off()
