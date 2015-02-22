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

# Calculate sum of emissions per year per location for motor vehicle sources
totals <- ddply(NEI[NEI$fips %in% c("24510","06037") & NEI$SCC %in% vehCodes,], 
                .(year,fips), summarize, total = sum(Emissions))

# Relabel and factorize the fips column
totals$fips[totals$fips == "24510"] <- "Baltimore City, Maryland"
totals$fips[totals$fips == "06037"] <- "Los Angeles County, California"
totals$fips <- as.factor(totals$fips)

# Draw plot
png("plot6.png", width = 480, height = 480)
q <- ggplot(totals, aes(as.factor(year), total, group = fips)) +
    geom_point() + facet_grid(. ~ fips) +
    labs(title = "Total Measured PM2.5\nMotor Vehicles") +
    labs(x = "Year") + labs(y = "PM2.5 (tons)") +
    geom_smooth(method = "lm", fill=NA)
print(q)
dev.off()