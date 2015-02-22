# DSStudy_ExData_Project2
Course project 2 for the Johns Hopkins Exploratory Data Analysis course on Coursera.

## Purpose

These R scripts process data from the [EPA National Emissions Inventory](http://www.epa.gov/ttn/chief/eiinformation.html) into plots that explore fine particulate matter (PM2.5) measurement changes by year, source, and location.

## Scripts

Script | Description | Result
------ | ----------- | ------
get_dataset.R | Downloads the [dataset](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip) and extracts it into the working directory. | NEI.zip, summarySCC_PM25.rds, and Source_Classification_Code.rds
plot1.R | Plots the total measured PM2.5 by year.  A dotted linear regression line is added to show the approximate change over time. | plot1.png
plot2.R | Plots the total measured PM2.5 in Baltimore City, Maryland by year.  A dotted linear regression line is added to show the approximate change over time. | plot2.png
plot3.R | Plots the total measured PM2.5 in Baltimore City, Maryland by year, grouped by source type.  Linear regression lines are added for each source type group to show the approximate changes over time. | plot3.png
plot4.R | Plots the total measured PM2.5 from coal combustion sources by year.  Coal combustion sources were identified by selecting those with both "coal" and "comb" occuring in their text description fields, case-insensitive.  A dotted linear regression line is added to show the approximate change over time. | plot4.png
plot5.R | Plots the total measured PM2.5 from motor vehicle sources in Baltimore City, Maryland by year.  Motor vehicle sources were identified by selecting those with "veh" but not "lawn" occuring in their text description fields, case-insensitive.  A dotted linear regression line is added to show the approximate change over time. | plot5.png
plot6.R | Plots the total measured PM2.5 from motor vehicle sources by year, grouped by Baltimore City, Maryland and Los Angeles County, California.  Motor vehicle sources were identified by selecting those with "veh" but not "lawn" occuring in their text description fields, case-insensitive.  Linear regression lines are added to show the approximate changes over time. | plot6.png