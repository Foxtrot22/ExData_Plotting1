#Coursera - Exploratory Data Analysis
#Project 1 - plot2.R

##Load data and converts Data variable to a date datatype.
all_dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=2075300, stringsAsFactors=FALSE)
all_dat$Date <- as.Date(all_dat$Date, "%d/%m/%Y")

#Subsets data for the dates of interest
dat <- subset(all_dat, Date >= as.Date("2007-02-01", "%Y-%m-%d") & Date <= as.Date("2007-02-02", "%Y-%m-%d"))
dat$Global_active_power[dat$Global_active_power == "?"] <- NA
dat$Global_active_power <- as.numeric(dat$Global_active_power)
dat$DateTime <- strptime(paste(as.character(dat$Date, "%d/%m/%Y"), dat$Time), "%d/%m/%Y %H:%M:%S")

#Plot 2: "Global Active Power" over two days
plot(dat$DateTime, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")