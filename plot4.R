Read.f <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
Read.f$Date<- strptime(Read.f$Date, "%d/%m/%Y")
Read.f$Date<- as.Date(Read.f$Date)
mask <- ifelse(Read.f$Date>= "2007-02-01" & Read.f$Date<="2007-02-02", TRUE, FALSE)
Data <- Read.f[mask,]
Data$DateTime <- with(Data, paste(Date, Time, sep =" "))
Data$DateTime <- strptime(Data$DateTime, "%Y-%m-%d %H:%M:%S")
par(mfrow = c(2,2))
with(Data,plot(DateTime,Global_active_power, type = "l", 
               xlab = "", ylab = "Global Active Power (kilowatts)")) # first plot
with(Data, plot(DateTime, Voltage, type = "l")) # second plot
with(Data, plot(DateTime, Sub_metering_1, type = "l", ylab = "energy sub metering", xlab = "")) # third plot
lines(Data$DateTime, Data$Sub_metering_2, col ="red")
with(Data, lines(DateTime, Sub_metering_3, col = "blue"))
legend(col = c("black", "red", "blue"), lty = 1,  
       legend =c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")  , "topright", cex = 0.5)
with(Data, plot(DateTime, Global_reactive_power, type = "l")) #4th plot
