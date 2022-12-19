#draw plot 3
#read table
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#convert date string to date
df$Date <- as.Date(df$Date, "%d/%m/%Y")

#subset the relevant dates: 2007-02-01 and 2007-02-02
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]

#create a column of date_time
df$date_time <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

#open the png device
png("plot3.png", width = 480, height = 480)

#plot and labeling for sub metering 1
plot(df$date_time, df$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")

#add the line for sub metering 2
lines(df$date_time, df$Sub_metering_2, type = "l", col = "red")

#add the line for sub metering 3
lines(df$date_time, df$Sub_metering_3, type = "l", col = "blue")

#add the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

#close the device
dev.off()