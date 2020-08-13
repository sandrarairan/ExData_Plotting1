## read file
df <- read.table("household_power_consumption.txt",header = TRUE, sep =";")
df
str(df)
colnames(df)
df[df == "?"] <- NA

## pegar la date con Time
df$Time <- paste(df$Date, df$Time)
head(df$Time)
str(df)

## convertir a strptime
df$Time <- strptime(df$Time, format = "%d/%m/%Y %H:%M:%S")
df
str(df)
colnames(df)

## convertir a Date
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df
str(df)
colnames(df)

## filtrar por fecha
subdf <- subset(df,df$Date=="2007/02/01" | df$Date =="2007/02/02")
subdf

subdf$Global_active_power <- as.numeric(subdf$Global_active_power)
str(subdf)

## plot Hist
hist(subdf$Global_active_power, main = "Global Active Power",col = "red",xlab = "Global Active Power (kilowatts)" )

## plot png
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()