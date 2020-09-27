Read.f <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
Read.f$Date<- strptime(Read.f$Date, "%d/%m/%Y")
Read.f$Date<- as.Date(Read.f$Date)
mask <- ifelse(Read.f$Date>= "2007-02-01" & Read.f$Date<="2007-02-02", TRUE, FALSE)
Data <- Read.f[mask,]
Data$DateTime <- with(Data, paste(Date, Time, sep =" "))
x <- strptime(Data$DateTime, "%Y-%m-%d %H:%M:%S")
y <- as.numeric(Data$Global_active_power)
par(mfrow= c(1,1))
plot(x,y, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot2.PNG")
dev.off()

