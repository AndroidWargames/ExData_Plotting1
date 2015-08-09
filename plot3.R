plot3 <- function(pdata=NULL){
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
        sub1 <- as.numeric(
                as.character(pdata$Sub_metering_1))
        sub2 <- as.numeric(
                as.character(pdata$Sub_metering_2))
        sub3 <- as.numeric(
                as.character(pdata$Sub_metering_3))
        par(cex.axis=.75,cex.lab=.75,mar=c(4,4,4,4))
        plot(pdata$dt,sub1,type="l",xlab="",ylab="Energy sub metering")
        lines(pdata$dt,sub2,col="red")
        lines(pdata$dt,sub3,col="blue")
        legend("topright",
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               cex=.6,
               lty=c(1,1,1),
               col=c("black","red","blue"))
}