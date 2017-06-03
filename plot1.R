# The zip file has already been downloaded and the data was opened and stored
# in a new directory called "Assignment1"

plot1 <- function(){
        hpcData <- read.table("./Assignment1/household_power_consumption.txt", 
                              header = TRUE, sep = ";", na.strings = "?", 
                              colClasses = c("character", "character",
                                             "numeric", "numeric", "numeric",
                                             "numeric", "numeric", "numeric",
                                             "numeric"))
        
        hpcData$Date <- as.Date(hpcData$Date, format = "%d/%m/%Y")
        
        hpcData$Date_Time <- as.POSIXct(paste(hpcData$Date, hpcData$Time),
                                        format="%Y-%m-%d %H:%M:%S")

        feb2007 <- subset(hpcData, Date == "2007-02-01" | Date == "2007-02-02")

        png("plot1.png", width=480, height=480)

        hist(feb2007$Global_active_power, breaks = 12, col = "red", main = 
                     "Global Active Power", xlab = 
                     "Global Active Power (kilowatts)", ylab = "Frequency")

        dev.off()
}

