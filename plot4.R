#Coursera - Exploratory Data Analysis
#Project 1 - plot4.R

##Load data and converts Data variable to a date datatype.
all_dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=2075300, stringsAsFactors=FALSE)
all_dat$Date <- as.Date(all_dat$Date, "%d/%m/%Y")

#Subsets data for the dates of interest
dat <- subset(all_dat, Date >= as.Date("2007-02-01", "%Y-%m-%d") & Date <= as.Date("2007-02-02", "%Y-%m-%d"))
dat$Global_active_power[dat$Global_active_power == "?"] <- NA
dat$Global_active_power <- as.numeric(dat$Global_active_power)
dat$DateTime <- strptime(paste(as.character(dat$Date, "%d/%m/%Y"), dat$Time), "%d/%m/%Y %H:%M:%S")

#Plot 4: Four different graphs
dat$Global_reactive_power[dat$Global_reactive_power == "?"] <- NA
dat$Global_reactive_power <- as.numeric(dat$Global_reactive_power)
dat$Voltage[dat$Voltage == "?"] <- NA
dat$Voltage <- as.numeric(dat$Voltage)
dat$Sub_metering_1[dat$Sub_metering_1 == "?"] <- NA
dat$Sub_metering_1 <- as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2[dat$Sub_metering_2 == "?"] <- NA
dat$Sub_metering_2 <- as.numeric(dat$Sub_metering_2)
dat$Sub_metering_3[dat$Sub_metering_3 == "?"] <- NA
dat$Sub_metering_3 <- as.numeric(dat$Sub_metering_3)

par(mfrow=c(2,2)) #Create two-by-two grid for the plots

plot(dat$DateTime, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") #Upper-left plot
plot(dat$DateTime, dat$Voltage, type="l", ylab="Voltage", xlab="datetime") #Upper-right plot
plot(dat$DateTime, dat$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering") #Lower-left plot
lines(dat$DateTime, dat$Sub_metering_2, type="l", col="red")
lines(dat$DateTime, dat$Sub_metering_3, type="l", col="blue")
legend("top", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col=c("black", "red", "blue"), cex=0.40, bty="n")
plot(dat$DateTime, dat$Global_reactive_power, type="l", ylab="Global_rective_power", xlab="datetime") #Lower-right plot
