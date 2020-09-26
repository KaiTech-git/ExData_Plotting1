Read.f <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
Read.f$Date<- strptime(Read.f$Date, "%d/%m/%Y")
Read.f$Date<- as.Date(Read.f$Date)
mask <- ifelse(Read.f$Date>= "2007-02-01" & Read.f$Date<="2007-02-02", TRUE, FALSE)
Data <- Read.f[mask,] 
hist(as.numeric(Data$Global_active_power), xlab = "Global Active Power (kilowatts)", main = "Global Active Power" , col = "red")
dev.copy(png, file="plot1.PNG")
dev.off()