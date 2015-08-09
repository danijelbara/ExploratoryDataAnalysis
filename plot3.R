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
png("plot3.png", width=480, height=480)
plot(x=datetime, y=subSetData[,"Sub_metering_1"], type="l",ylab="Energy sub metering", main="", xlab="")
lines(x=datetime, y=subSetData[,"Sub_metering_2"], col="red")
lines(x=datetime, y=subSetData[,"Sub_metering_3"], col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()