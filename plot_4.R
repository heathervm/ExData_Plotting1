require(dplyr)
power_consumption <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
feb_one_two <- filter(power_consumption, Date == "1/2/2007"| Date == "2/2/2007")
feb <- filter(feb_one_two, Global_active_power != "?" & Global_reactive_power != "?" & Voltage != "?" & Sub_metering_1 != "?" & Sub_metering_2 != "?" & Sub_metering_3 != "?")
dates <- feb$Date
times <- feb$Time
as_date <- as.Date(dates, "%d/%m/%Y")
datetime <- as.POSIXct(paste(dates, times), format = "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

gap <- feb$Global_active_power
plot(datetime, gap, type = "l", ylab = "Global active power")

volt <- feb$Voltage
cvolt <- c(volt)
cvoltx <-cvolt/10
plot(datetime, cvoltx, type = "l",  yaxt="n", ylab = "Voltage")
numbers <- c(234, 238, 242, 246)
axis(2, at=numbers, labels=numbers)

sub_one <- (feb$Sub_metering_1)
sub_two <- (feb$Sub_metering_2)
sub_three <- (feb$Sub_metering_3)
Sub_metering_1 <- plot(datetime, sub_one, type = "l", ylab = "Energy sub metering", xlab = "")
Sub_metering_2 <- lines(datetime, sub_two, type = "l", col = "red")
Sub_metering_3 <- lines(datetime, sub_three, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

grp <- feb$Global_reactive_power
cgrp <- c(grp)
cgrp5 <- cgrp/500
plot(datetime, cgrp5, type = "l", ylab = "Global_reactive_power")