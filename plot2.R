library(plyr)

# Load required data
NEI <- readRDS("summarySCC_PM25.rds")

# Calculate sum of emissions per year for Baltimore City, Maryland
totals <- ddply(NEI[NEI$fips == "24510",], .(year), summarize,
                total = sum(Emissions))

# Draw plot
png("plot2.png", width = 480, height = 480)
plot(totals$year, totals$total,
     main = "Total Measured PM2.5\nBaltimore City, Maryland", xlab = "Year",
     ylab = "PM2.5 (tons)", xaxt = "n", pch=19)
axis(1, at=totals$year, labels=totals$year)
abline(lm(total ~ year, totals), lty = 3)
dev.off()