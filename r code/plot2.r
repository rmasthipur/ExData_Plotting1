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
d2$Global_active_power <- as.numeric(as.character(d2$Global_active_power))

png('plot2.png')
plot(d2$dt, d2$Global_active_power,type='l',xlab='',ylab='Global Active Power(kilowatts)')
dev.off()