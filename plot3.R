load_data <- function()
{
    # when run the program, we should set the work directory first.
    #setwd("/Users/zhuyongshuai/快盘/MOOC/Data Science/4. Exploratory Data Analysis/ExData_Plotting1")
    data_table <- read.table("household_power_consumption.txt", header = T, sep = ";", na.string = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
    data_table <- data_table[(data_table$Date == "1/2/2007") | (data_table$Date == "2/2/2007"),]
    data_table$DateTime <- strptime(paste(data_table$Date, data_table$Time), "%d/%m/%Y %H:%M:%S")
    write.csv(data_table, "data.csv")    
    
    # return
    data_table
}

data_table <- load_data()
png(filename = "plot3.png", width = 480, height = 480, units = "px")
cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(data_table$DateTime, data_table$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data_table$DateTime, data_table$Sub_metering_2, type="l", col="red")
lines(data_table$DateTime, data_table$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
dev.off()
