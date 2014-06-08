## Function: plot2.R
## Author:  Beldevere Abarrientos, 06June2014, Coursera, Data Science Exploratory Data Analytics

plot2 <- function() {
      options(warn=-1)
      hhpcnew <- data.frame()
      hhpcnew2 <- data.frame()   ## did this further subsetting just to check the data, making sure there are no NA or ?
      ##
      fn <- "household_power_consumption.txt"
      sel_dates <- c("1/2/2007","2/2/2007")
            hhpc_colclasses <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
      ##
      hhpc <- fread(fn, header=TRUE, na.strings="?",stringsAsFactors=FALSE, 
                  sep=";", colClasses = hhpc_colclasses)[Date %in% sel_dates]
      
      hhpc$Date <- as.character(as.Date(as.character(hhpc$Date), format = "%d/%m/%Y"))
      hhpcnew <- subset(hhpc, hhpc[,hhpc$Global_active_power] != "?")
      
      hhpcnew2 <- data.frame(as.numeric(as.character(hhpcnew$Global_active_power)),
                   as.POSIXct(paste(hhpcnew$Date, hhpcnew$Time), format="%Y-%m-%d %H:%M:%S"))
      
      colnames(hhpcnew2) <- c("Global_active_power", "DateTime")
      ##print(hhpcnew2(1:10))             ## tracing points
      ##print(nrow(hhpcnew2))
      ##print(ncol(hhpcnew2))
      
      png("plot2.png", width=480, height=480, units="px")
      par(pch=".")
      plot(hhpcnew2$DateTime, hhpcnew2$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="o")
            
      dev.off()
      ##plot(hhpc$DateTime, hhpc$Global_active_power)
      
}