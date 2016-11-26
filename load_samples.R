library(data.table)
library(lubridate)

# Read the data file.
# dim(hhpc) = [2075259, 8]
hhpc <- fread('household_power_consumption.txt', sep=';', na.strings='?')

# Combine the Date and Time column into a DateTime column.
dateTimes <- paste(hhpc$Date, hhpc$Time)

# Append the DateTimes as a column to the data table
hhpc$DateTime <- dmy_hms(dateTimes)

# Remove the Date and Time columns from the table
hhpc$Date <- NULL
hhpc$Time <- NULL

loadSamplesBetweenDates <- function(date_begin, date_end) {
  interestingDateTimes <-
    hhpc$DateTime >= ymd(date_begin) &
    hhpc$DateTime < ymd(date_end)
  hhpc[interestingDateTimes, ]
}
