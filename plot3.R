Sys.setlocale(category = "LC_ALL", locale = "C") # Set the locale settings in case it is different from English (tested on Windows 7 and Linux)
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
setInternet2(use = TRUE) # Use IE with https on Windows
download.file(url=fileURL, destfile="household_power_consumption.zip")
data <- read.csv2(unzip("household_power_consumption.zip"), colClass="character")
res <- data[strptime(data$Date,"%d/%m/%Y")>="2007-02-01" & strptime(data$Date,"%d/%m/%Y")<"2007-02-03", ]
png(filename="plot3.png")
x <- strptime(paste(res$Date,res$Time),"%d/%m/%Y %H:%M")
plot(x, res$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(x, res$Sub_metering_2, col="Red")
lines(x, res$Sub_metering_3, col="Blue")
legend("topright", lty=c(1,1,1), col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
Sys.setlocale() # Change back to the default locale settings