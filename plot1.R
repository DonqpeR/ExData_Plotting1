fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
setInternet2(use = TRUE) # Use IE with https on Windows
download.file(url=fileURL, destfile="household_power_consumption.zip")
data <- read.csv2(unzip("household_power_consumption.zip"), colClass="character")
res <- as.numeric(data[strptime(data$Date,"%d/%m/%Y")>="2007-02-01" & strptime(data$Date,"%d/%m/%Y")<"2007-02-03", "Global_active_power"])
png(filename="plot1.png")
hist(res, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")
dev.off()