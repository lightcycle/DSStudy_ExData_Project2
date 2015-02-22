# Plots the total measured PM2.5 from coal combustion sources by year. Coal
# combustion sources were identified by selecting those with both "coal" and
# "comb" occuring in their text description fields, case-insensitive. A dotted
# linear regression line is added to show the approximate change over time.

library(plyr)

# Load required data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Determine subset of SCC codes corresponding to coal combustion, by
# concatenating all descriptive text columns and selecting only those containing
# "coal" and "comb", case-insensitive.
searchStrings <- paste(SCC$Short.Name, SCC$SCC.Level.One, SCC$SCC.Level.Two,
                       SCC$SCC.Level.Three, SCC$SCC.Level.Four);
coalCombCodes <- as.character(SCC[grepl("coal", searchStrings, ignore.case = TRUE) &
           grepl("comb", searchStrings, ignore.case = TRUE),1])

# Calculate sum of emissions per year for coal combustion sources
totals <- ddply(NEI[NEI$SCC %in% coalCombCodes,], .(year), summarize, total = sum(Emissions))

# Draw plot
png("plot4.png", width = 480, height = 480)
plot(totals$year, totals$total,
     main = "Total Measured PM2.5\nCoal Combustion Sources", xlab = "Year",
     ylab = "PM2.5 (tons)", xaxt = "n", pch=19)
axis(1, at=totals$year, labels=totals$year)
abline(lm(total ~ year, totals), lty = 3)
dev.off()