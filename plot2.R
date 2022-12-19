#draw plot 2
#read table
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#convert date string to date
df$Date <- as.Date(df$Date, "%d/%m/%Y")

#subset the relevant dates: 2007-02-01 and 2007-02-02
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]

#create a column of date_time
df$date_time <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

#open the png device
png("plot2.png", width = 480, height = 480)

#plot time series for Global active power
plot(df$date_time, df$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

#close the device
dev.off()