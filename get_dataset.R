# Retrieves the data set for this project
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "./NEI.zip", method = "curl")
unzip("./NEI.zip")