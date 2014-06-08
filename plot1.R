## Function: plot1.R, Histogram plot
## Author:  Beldevere Abarrientos, 06June2014, Coursera, Data Science Exploratory Data Analytics

plot1 <- function() {
      options(warn=-1)
      fn <- "household_power_consumption.txt"
      sel_dates <- c('1/2/2007','2/2/2007')
      ##sel_dates <- c('1/2/2007')
      ##hhpc_colclasses <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
      ##
      ##hhpc <- fread(fn, header=TRUE, na.strings="?",stringsAsFactors=FALSE, 
      ##            sep=";", colClasses = hhpc_colclasses)[Date %in% sel_dates]
      hhpc <- fread(fn, header=TRUE, na.strings="?",stringsAsFactors=FALSE, 
                    sep=";", colClasses = "character")[Date %in% sel_dates]
      
      hhpc$Global_active_power <- as.numeric(hhpc$Global_active_power)
      
      ##hhpc$Date <- as.character(as.Date(as.character(hhpc$Date), format = "%m/%d/%Y"))
      ##print(hhpc[1:10])
      ##print(nrow(hhpc))
      ##print(ncol(hhpc))
      
      png("plot1.png", width=480, height=480, units="px")
      hist(hhpc$Global_active_power, col = "red", main = "Global Active Power", 
                  xlab = "Global Active Power (kilowatts)")
      dev.off()
      
      ##dev.copy(png, file = "plot1.png")    ## copy to a png file
      ##summary(hhpc$Global_active_power)
      
}