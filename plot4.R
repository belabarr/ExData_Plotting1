## Function: plot4.R   Plots 4 graphs at a time
## Author:  Beldevere Abarrientos, 07June2014, Coursera, Data Science Exploratory Data Analytics

plot4 <- function() {
      options(warn=-1)
      
      fn <- "household_power_consumption.txt"
      sel_dates <- c("2/1/2007","2/2/2007")
      hhpc_colclasses <- c("character","character","character","character","character","character","character","character","character")
      ##hhpc_colclasses <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
      ##
      
      hhpc <- fread(fn, header=TRUE, na.strings="?",stringsAsFactors=FALSE, sep=";", colClasses = "character")[Date %in% sel_dates]
      ## hhpc <- fread(fn, header=TRUE, na.strings="?",stringsAsFactors=FALSE, sep=";", colClasses = hhpc_colclasses)[Date %in% sel_dates]
      
      hhpc$Date <- as.character(as.Date(as.character(hhpc$Date), format = "%m/%d/%Y"))
      hhpc$DateTime <- as.POSIXct(paste(hhpc$Date, hhpc$Time), format="%Y-%m-%d %H:%M:%S")
      
      hhpc$Global_active_power <- as.numeric(hhpc$Global_active_power)
      hhpc$Global_reactive_power <- as.numeric(hhpc$Global_reactive_power)
      hhpc$Voltage            <- as.numeric(hhpc$Voltage)
      hhpc$Sub_metering_1     <- as.numeric(hhpc$Sub_metering_1)
      hhpc$Sub_metering_2     <- as.numeric(hhpc$Sub_metering_2)
      hhpc$Sub_metering_3     <- as.numeric(hhpc$Sub_metering_3)
                  
      ##print(head(hhpc))
      ##print(nrow(hhpc))
      ##print(ncol(hhpc))
      
      png("plot4.png", width=480, height=480, units="px")
      
      par(pch=".", mfrow = c(2,2))
      with (hhpc, {
            plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power", type="o")
            plot(DateTime, Voltage, xlab = "datetime", ylab = "Voltage", type="o")
            plot(DateTime, Sub_metering_3, main = "", ylim = c(0,30), xlab = "", ylab = "Energy sub metering")
                  lines(hhpc$DateTime, hhpc$Sub_metering_1, type="o", xlab = "", ylab = "", col="green")
                  lines(hhpc$DateTime, hhpc$Sub_metering_2, type="o", xlab = "", ylab = "", col="red")
                  lines(hhpc$DateTime, hhpc$Sub_metering_3, type="o", xlab = "", ylab = "", col="blue")
                  legend("topright", pch = "-", bty = "n", col = c("black", "red","blue"), 
                        legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
            plot(DateTime, Global_reactive_power, xlab = "datetime", type="o")
      })
       
      dev.off()
            
}