source('load_samples.R')
source('render_to_png.R')

plot1 <- function(samples) {
  # Histogram of Global Active Power over samples
  # Histogram has these properties:
  #   color: red
  #   title: Global Active Power
  #   x-axis label: Global Active Power (kilowatts)
  #   y-axis label: Frequency
  hist(
    samples$Global_active_power,
    col='Red',
    main='Global Active Power',
    xlab='Global Active Power (kilowatts)',
    ylab='Frequency'
  )
}

# Create a new device
dev.new()

# Samples between 2007-02-01 00:00:00 and 2007-02-03 00:00:00
samples <- loadSamplesBetweenDates('2007-02-01', '2007-02-03')

# Render plot
plot1(samples)

# Render to png
render_to_png('plot1.png')

# Close device
dev.off()