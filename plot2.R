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
globalActivePower <- as.numeric(subSetData$Global_active_power)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()