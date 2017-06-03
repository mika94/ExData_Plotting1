# The zip file has already been downloaded and the data was opened and stored
# in a new directory called "Assignment1"

plot4 <- function(){
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

        dateTime <- feb2007$Date_Time
        submeter1 <- feb2007$Sub_metering_1
        submeter2 <- feb2007$Sub_metering_2
        submeter3 <- feb2007$Sub_metering_3
        
        png("plot4.png", width=480, height=480)

        par(mfcol = c(2, 2))
        # Plot the top left graph
        plot(dateTime, feb2007$Global_active_power, type = "l",
             xlab = NA, ylab = "Global Active Power")

        # Plot the bottom left graph
        plot(dateTime, submeter1, type = "l", xlab = NA,
             ylab = "Energy sub metering")
        lines(dateTime, submeter2, type = "l", col = "red")
        lines(dateTime, submeter3, type = "l", col = "blue")
        
        legend("topright", c("Sub_metering_1", "Sub_metering_2",
                             "Sub_metering_3"), lty = 1, lwd = 2.5,
               col = c("black", "red", "blue"), bty = "n")
        
        # Plot the top right graph
        plot(dateTime, feb2007$Voltage, type = "l", xlab = "datetime",
             ylab = "Voltage")

        # Plot the bottom right graph
        plot(dateTime, feb2007$Global_reactive_power, type = "l",
             xlab = "datetime", ylab = "Global_reactive_power")

        # Save to a png file
        dev.off()
}
