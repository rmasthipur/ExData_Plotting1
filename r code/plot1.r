## This R code reads the data from loads into a data frames, 
## removes non-complete records and tidyes the data 
## then fiters out the for dates '2007/02/02' and '2007/02/01'
## builds a histogram on the active power in the working directory.

mydata <- read.table(file="C:/Users/ctsuser1/Documents/My Data SOurces/household_power_consumption.txt", header=TRUE, sep=";")
final <- mydata[complete.cases(mydata),]
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
f1 <- subset(final, Date=='2007-02-01'| Date=='2007-02-02')
f3 <- as.numeric(as.character(f1$Global_active_power))
png('plot1.png')
hist(f3, col="red", xlab="Global Active Power (kilowatts)", main='Global Active Power')
dev.off()