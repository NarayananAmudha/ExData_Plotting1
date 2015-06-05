# read data from file
if (!file.exists("data.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile="data.zip")
  unzip("data.zip")  
}

data <- read.csv("household_power_consumption.txt", 
                 skip=66637,
                 nrows=2880,
                 na.strings = "?",
                 header=F,
                 sep=";")
# Get header row
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))

# convert date and time variables to Date/Time classes
data$Date <- as.Date(data$Date, format="%d/%m/%y")
data$Time <- strptime(data$Time, format="%H:%M:%S")

# plot the data and save it as png file
png(filename="plot1.png", width=480, height=480)
hist(data$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()
cat("plot1.png has been saved in", getwd())