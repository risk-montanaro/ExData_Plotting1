#draw plot 1
#read table
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#convert date string to date
df$Date <- as.Date(df$Date, "%d/%m/%Y")

#subset the relevant dates: 2007-02-01 and 2007-02-02
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]

#convert the variables as numeric
df$Global_active_power <- as.numeric(df$Global_active_power)

#open the png device
png("plot1.png", width = 480, height = 480)

#plot histogram
hist(df$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")

#close the device
dev.off()