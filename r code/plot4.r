## This R code reads the data from loads into a data frames, 
## removes non-complete records and tidyes the data 
## then fiters out the for dates '2007/02/02' and '2007/02/01'
## builds a histogram on the active power in the working directory.

mydata <- read.table(file="C:/Users/ctsuser1/Documents/My Data SOurces/household_power_consumption.txt", header=TRUE, sep=";")
final <- mydata[complete.cases(mydata),]
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
f1 <- subset(final, Date=='2007-02-01'| Date=='2007-02-02')
d1 <- transform(f1,dt=paste(f1$Date,f1$Time))
d1 <- d2
d2$dt <- as.POSIXct(as.character(d2$dt),'%Y-%m-%d %H:%M:%S')
d2$Sub_metering_1 <- as.numeric(as.character(d2$Sub_metering_1))
d2$Sub_metering_2 <- as.numeric(as.character(d2$Sub_metering_2))
d2$Voltage <- as.numeric(as.character(d2$Voltage))
d2$Global_active_power <- as.numeric(as.character(d2$Global_active_power))
d2$Global_reactive_power <- as.numeric(as.character(d2$Global_reactive_power))


png('plot4.png')
par(mfrow=c(2,2))
# plot 1
plot(d2$dt, d2$Global_active_power,type='l',xlab='',ylab='Global Active Power')

#plot 2
plot(d2$dt, d2$Voltage,type='l',xlab='datetime',ylab='Voltage')


# Plot 3
plot(d2$dt,d2$Sub_metering_1, type='l', col='black',xlab='',ylab='Energy sub metering')
points(d2$dt,d2$Sub_metering_2, type='l', col='red')
points(d2$dt,d2$Sub_metering_3, type='l', col='blue')
legend('topright',lwd=1, col=c('black','red','blue'), legend=c('sub_metering_1','sub_metering_2','sub_metering_3'))

# Plot 4
plot(d2$dt, d2$Global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power')

dev.off()



