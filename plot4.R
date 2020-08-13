## read file
df <- read.table("household_power_consumption.txt",header = TRUE, sep =";")

# Convert "?" in NAs
df[df == "?"] <- NA

## convertir a numerico
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

## pegar la date con Time
df$Time <- paste(df$Date, df$Time)

## convertir a strptime
df$Time <- strptime(df$Time, format = "%d/%m/%Y %H:%M:%S")

## convertir a Date
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

## filtrar por fecha
subdf <- subset(df,df$Date=="2007/02/01" | df$Date =="2007/02/02")

subdf$Global_active_power <- as.numeric(subdf$Global_active_power)
subdf$Voltage <- as.numeric(subdf$Voltage)
subdf$Global_reactive_power <- as.numeric(subdf$Global_reactive_power)


## Organizar en filas
par(mfrow = c(2, 2)) 
## grafico 1
plot(subdf$Time, subdf$Global_active_power,type = "l",xlab = "", ylab = "Global Active Power" )
## grafico 2
plot(subdf$Time, subdf$Voltage, type = "l",xlab = "datatime", ylab = "Voltage" )
## grafico 3
plot(subdf$Time, subdf$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(subdf$Time, subdf$Sub_metering_2, type="l", col="red")
lines(subdf$Time, subdf$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"),lty = 1)
## grafico 4
plot(subdf$Time, subdf$Global_reactive_power, type = "l",xlab = "datatime", ylab = "Global_reactive_power" )


## plot png
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()

