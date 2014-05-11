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
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data_table$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
