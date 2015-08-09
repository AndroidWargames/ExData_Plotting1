plot1 <- function(pdata=NULL){
        # Gives the option of using an already loaded dataset
        # to make execution faster
        require(lubridate)
        if (is.null(pdata)){
                pdata <- read.table("household_power_consumption.txt",
                                   sep=";",
                                   header = TRUE)
        }
        pdata$Date <- as.Date(dmy(pdata$Date))
        GAP <- pdata$Global_active_power[pdata$Date==as.Date("2007-02-01")|
                                         pdata$Date==as.Date("2007-02-02")]
        GAP <- as.numeric(
                as.character(GAP))
        GAP <- GAP[!is.na(GAP)]
        par(cex.axis=.8,cex.lab=.8,cex.main=.8,mar=c(5,5,5,5))
        hist(GAP,
             col="red",
             xlim = c(0,7), 
             xlab = "Global Active Power (kilowatts)",
             main="Global Active Power",
             axes = FALSE
             )
        axis(1,at=c(0,2,4,6))
        axis(2,at=c(0,200,400,600,800,1000,1200))
}