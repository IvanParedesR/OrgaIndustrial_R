# First, install the "hhi" package, then load the library
#https://www.r-bloggers.com/a-new-package-hhi-for-quick-calculation-of-herfindahl-hirschman-index-scores/
#https://github.com/pdwaggoner
install.packages("hhi")
library(hhi)
 
# Next, read in data: US Men's Footwear Company Market Shares, 2012-2017
footwear = read.table(".../footwear.txt")
 
# Now, call the "hhi" command to calculate HHI for 2017
hhi(footwear, "ms.2017") # first the df, then the shares variable in quotes

# First, calculate and store HHI for each year in the data file (2012-2017)
hhi.12 = hhi(footwear, "ms.2012")
hhi.13 = hhi(footwear, "ms.2013")
hhi.14 = hhi(footwear, "ms.2014")
hhi.15 = hhi(footwear, "ms.2015")
hhi.16 = hhi(footwear, "ms.2016")
hhi.17 = hhi(footwear, "ms.2017")
 
# Combine and create df for plotting
hhi = rbind(hhi.12, hhi.13, hhi.14, hhi.15, hhi.16, hhi.17)
 
year = c(2012, 2013, 2014, 2015, 2016, 2017)
 
hhi.data = data.frame(year, hhi)
 
# Finally, generate HHI time series plot using the "plot_hhi" command
plot_hhi(hhi.data, "year", "hhi")
