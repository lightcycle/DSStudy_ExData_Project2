# Load required data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Determine subset of SCC codes corresponding to motor vehicle sources, by
# concatenating all descriptive text columns and selecting only those containing
# "veh" but not "lawn", case-insensitive.
searchStrings <- paste(SCC$Short.Name, SCC$SCC.Level.One, SCC$SCC.Level.Two,
                       SCC$SCC.Level.Three, SCC$SCC.Level.Four);
vehCodes <- as.character(SCC[grepl("veh", searchStrings, ignore.case = TRUE) &
                             !grepl("lawn", searchStrings, ignore.case = TRUE),1])

# Calculate sum of emissions per year for motor vehicle sources
totals <- ddply(NEI[NEI$fips == "24510" & NEI$SCC %in% vehCodes,],
                .(year), summarize, total = sum(Emissions))

# Draw plot
png("plot5.png", width = 480, height = 480)
plot(totals$year, totals$total,
     main = "Total Measured PM2.5\nMotor Vehicles in Baltimore City, Maryland",
     xlab = "Year", ylab = "PM2.5 (tons)", xaxt = "n", pch=19)
axis(1, at=totals$year, labels=totals$year)
abline(lm(total ~ year, totals), lty = 3)
dev.off()