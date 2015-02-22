library("ggplot2")

# Load required data
NEI <- readRDS("summarySCC_PM25.rds")

# Factorize the type column
NEI <- transform(NEI, type = as.factor(type))

# Calculate sum of emissions per year per type for Baltimore City, Maryland
totals <- ddply(NEI[NEI$fips == "24510",], .(year,type), summarize,
                total = sum(Emissions))

# Draw plot
png("plot3.png", width = 480, height = 480)
q <- ggplot(totals, aes(as.factor(year), total, group = type)) +
    geom_point() + facet_grid(. ~ type) +
    labs(title = "Total Measured PM2.5\nBaltimore City, Maryland") +
    labs(x = "Year") + labs(y = "PM2.5 (tons)") +
    geom_smooth(method = "lm", fill=NA)
print(q)
dev.off()