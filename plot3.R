## Function: plot3.R
## Author:  Beldevere Abarrientos, 06June2014, Coursera, Data Science Exploratory Data Analytics

plot3 <- function() {
      options(warn=-1)
      hhpc1 <- data.frame()
      hhpc2 <- data.frame()
      hhpc3 <- data.frame()       ## there is no need for further subsetting but I wasn't sure of the data conversion within
                                    ## the in place conversion (within the same df, in previous case conversion doesnt happen)
      
      fn <- "household_power_consumption.txt"
      sel_dates <- c("2/1/2007","2/2/2007")
      hhpc_colclasses <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
      ##
      hhpc <- fread(fn, header=TRUE, na.strings="?",stringsAsFactors=FALSE, sep=";", colClasses = hhpc_colclasses)[Date %in% sel_dates]
      
      hhpc$Date <- as.character(as.Date(as.character(hhpc$Date), format = "%m/%d/%Y"))
      ##hhpc$Date <- as.Date(hhpc$Date, format = "%m/%d/%Y")
      hhpc$DateTime <- as.POSIXct(paste(hhpc$Date, hhpc$Time), format="%Y-%m-%d %H:%M:%S")
      hhpc1 <- subset(hhpc, hhpc[,hhpc$Sub_metering_1] != "?")
      hhpc2 <- subset(hhpc1, hhpc1[,hhpc1$Sub_metering_2] != "?")
      hhpc3 <- subset(hhpc2, hhpc2[,hhpc2$Sub_metering_3] != "?")
      hhpc3$Sub_metering_1 <- as.numeric(as.character(hhpc3$Sub_metering_1))
      hhpc3$Sub_metering_2 <- as.numeric(as.character(hhpc3$Sub_metering_2))
      hhpc3$Sub_metering_3 <- as.numeric(as.character(hhpc3$Sub_metering_3))
                  
      #print(hhpc3[1:10])
      #print(nrow(hhpc3))
      #print(ncol(hhpc3))
      
      png("plot3.png", width=480, height=480, units="px")
      par(pch=".")
      with(hhpc3, plot(DateTime, Sub_metering_3, main = "", ylim = c(0,30), xlab = "", ylab = "Energy sub metering"))
      lines(hhpc3$DateTime, hhpc3$Sub_metering_1, type="o", xlab = "", ylab = "", col="green")
      lines(hhpc3$DateTime, hhpc3$Sub_metering_2, type="o", xlab = "", ylab = "", col="red")
      lines(hhpc3$DateTime, hhpc3$Sub_metering_3, type="o", xlab = "", ylab = "", col="blue")
      legend("topright", pch = "-", col = c("black", "red","blue"), 
             legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
      dev.off()
      ##plot(hhpc$DateTime, hhpc$Global_active_power)
      
}