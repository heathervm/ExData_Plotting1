require(dplyr)
power_consumption <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
feb_one_two <- filter(power_consumption, Date == "1/2/2007"| Date == "2/2/2007")
feb <- filter(feb_one_two, Global_active_power != "?")
dates <- feb$Date
times <- feb$Time
as_date <- as.Date(dates, "%d/%m/%Y")
datetime <- as.POSIXct(paste(dates, times), format = "%d/%m/%Y %H:%M:%S")

gap <- feb$Global_active_power
gap_vector <- c(gap)
hist(gap_vector, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
