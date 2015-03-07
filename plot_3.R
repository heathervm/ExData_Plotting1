require(dplyr)
power_consumption <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
feb_one_two <- filter(power_consumption, Date == "1/2/2007"| Date == "2/2/2007")
feb <- filter(feb_one_two, Sub_metering_1 != "?" & Sub_metering_2 != "?" & Sub_metering_3 != "?")

dates <- feb$Date
times <- feb$Time
as_date <- as.Date(dates, "%d/%m/%Y")
datetime <- as.POSIXct(paste(dates, times), format = "%d/%m/%Y %H:%M:%S")

sub_one <- (feb$Sub_metering_1)
sub_two <- (feb$Sub_metering_2)
sub_three <- (feb$Sub_metering_3)
Sub_metering_1 <- plot(datetime, sub_one, type = "l", ylab = "Energy sub metering", xlab = "")
Sub_metering_2 <- lines(datetime, sub_two, type = "l", col = "red")
Sub_metering_3 <- lines(datetime, sub_three, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
