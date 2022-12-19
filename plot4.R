#draw plot 4
#read table
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#convert date string to date
df$Date <- as.Date(df$Date, "%d/%m/%Y")

#subset the relevant dates: 2007-02-01 and 2007-02-02
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]

#create a column of date_time
df$date_time <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

#open the png device
png("plot4.png", width = 480, height = 480)

#set up the layout of the plots
par(mfrow = c(2,2))

#draw the 1st plot
plot(df$date_time, df$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")

#draw the 2nd plot
plot(df$date_time, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#draw the 3rd plot
    #plot and labeling for sub metering 1
    plot(df$date_time, df$Sub_metering_1, type = "l", xlab = "", 
         ylab = "Energy sub metering")
    
    #add the line for sub metering 2
    lines(df$date_time, df$Sub_metering_2, type = "l", col = "red")
    
    #add the line for sub metering 3
    lines(df$date_time, df$Sub_metering_3, type = "l", col = "blue")
    
    #add the legend, select line type, make the size halved
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"), lty = 1, cex = 0.8)

#draw the 4th plot
plot(df$date_time, df$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

#close the device
dev.off()