plot2 <- function(pdata=NULL){
        # Gives the option of using an already loaded dataset
        # to make execution faster
        require(lubridate)
        if (is.null(pdata)){
                pdata <- read.table("household_power_consumption.txt",
                                   sep=";",
                                   header = TRUE)
        }
        pdata$Date <- as.Date(dmy(pdata$Date))
        
        pdata <- pdata[pdata$Date==as.Date("2007-02-01")|
                       pdata$Date==as.Date("2007-02-02"),]
        pdata$dt <- as.POSIXct(ymd_hms(paste(pdata$Date,pdata$Time)))
        head(pdata)
        GAP <- as.numeric(
                as.character(pdata$Global_active_power))

        par(cex.axis=.75,cex.lab=.75,mar=c(5,5,5,5))
        plot(pdata$dt,GAP,type="l",xlab="",ylab="Global Active Power (kilowatts)")
}