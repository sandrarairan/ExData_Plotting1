## read file
df <- read.table("household_power_consumption.txt",header = TRUE, sep =";")

df[df == "?"] <- NA

## pegar la date con Time
df$Time <- paste(df$Date, df$Time)

## convertir a strptime
df$Time <- strptime(df$Time, format = "%d/%m/%Y %H:%M:%S")

## convertir a Date
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
## filtrar por fecha
subdf <- subset(df,df$Date=="2007/02/01" | df$Date =="2007/02/02")
subdf$Global_active_power <- as.numeric(subdf$Global_active_power)

## plot Hist type = “l”: Lines.
plot(subdf$Time, subdf$Global_active_power,type = "l", main = "Global Active Power",xlab = "", ylab = "Global Active Power (kilowatts)" )

## plot png
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()