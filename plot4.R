setwd("/Users/Air/spec-repo/ExploratoryDataAnalysis/")
fileName = "dataset.zip"
if (!file.exists(fileName)) 
{
        retval = download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip",
                               destfile = fileName,
                               method = "curl")
        unzip("dataset.zip")
}
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot4.png", width=480, height=480)par(mfrow = c(2, 2))
# Plot 1 - global active power: upper left
plot(x=datetime, y=subSetData[,"Global_active_power"], type="l",ylab="Global Active Power", main="", xlab="")
# Plot 2 - voltage: upper right
plot(x=datetime, y=subSetData[,"Voltage"], type="l",ylab="Voltage", main="", xlab="datetime")
# Plot 3 - sub metering: lower left
plot(x=datetime, y=subSetData[,"Sub_metering_1"], type="l",ylab="Energy sub metering", main="", xlab="")
lines(x=datetime, y=subSetData[,"Sub_metering_2"], col="red")
lines(x=datetime, y=subSetData[,"Sub_metering_3"], col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
# Plot 4 - global reactive power: lower right
plot(x=datetime, y=subSetData[,"Global_reactive_power"], type="l",ylab="Global_reactive_power", main="", xlab="datetime")
dev.off()