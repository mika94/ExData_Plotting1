# The zip file has already been downloaded and the data was opened and stored
# in a new directory called "Assignment1"

plot3 <- function(){
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

        # Plot the graph

        png("plot3.png", width=480, height=480)

        plot(feb2007$Date_Time, feb2007$Sub_metering_1, type = "l",
             xlab = NA, ylab = "Energy sub metering")
        lines(feb2007$Date_Time, feb2007$Sub_metering_2, type = "l",
               col = "red")
        lines(feb2007$Date_Time, feb2007$Sub_metering_3, type = "l",
               col = "blue")
        
        legend("topright", c("Sub_metering_1", "Sub_metering_2",
                             "Sub_metering_3"), lty = 1, lwd = 2.5,
               col = c("black", "red", "blue"))

        dev.off()
}
