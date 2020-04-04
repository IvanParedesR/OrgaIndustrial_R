

# *------------------------------------------------------------------
# | PROGRAM NAME: INDIFFERENCE_CURVES_R
# | DATE: 3/11/11
# | CREATED BY:  MATT BOGARD
# | PROJECT FILE:  P:\R  Code References            
# *----------------------------------------------------------------
# | PURPOSE: MORE TO PLOT LEVEL SETS USING THE CONTOUR FUNCTION THAN              
# |          TO ACTUALLY PLOT INDIFFERENCE CURVES 
# *------------------------------------------------------------------
# | COMMENTS:               
# |
# |  1: references: http://stat.ethz.ch/R-manual/R-devel/library/graphics/html/contour.html 
# |  2: 
# |  3: 
# |*------------------------------------------------------------------
# | DATA USED: http://economics.about.com/od/indifferencecurves/a/constructing3.htm              
# |
# |
# |*------------------------------------------------------------------
# | CONTENTS:               
# |
# |  PART 1: explicit data 
# |  PART 2: simulated data  (sort of) - not really indifference curves
# |  PART 3: 
# *-----------------------------------------------------------------
# | UPDATES:               
# |
# |
# *------------------------------------------------------------------
 
# *------------------------------------------------------------------
# | PART 1:   explicit data            
# *-----------------------------------------------------------------
 
 
 
# raw data 
 
x <- c(1,2,3,4,5,6,7,8)
y <- c(10,10,10,15,15,30,60,90)
 
# note- for the contour function to work below, x and y 
# These must be in ascending order-based on the contour documentation
#  which is the opposite of how the data was presented at
# about.com 
 
# put x and y in a matrix
 
xy <- as.matrix(cbind(x,y))
 
# transpose xy
 
xyT <- t(xy) 
 
# define function z as a matrix
 
z <- as.matrix(sqrt(x*y))
 
# plot the countour plot / specified level sets
 
contour(xyT,z) # all levels
 
contour(xyT,z, levels =c(10,20,50)) # specified levels for z
 
# *------------------------------------------------------------------
# | PART 2:   simulated data  (sort of) - not really indifference curves            
# *-----------------------------------------------------------------
 
 
rm(list=ls()) # get rid of any existing data 
 
ls() # display active data -should be null 
 
# define x and y
 
x <- seq(0,100,by=10)
y <- seq(0,20,by=2)
 
# put x and y in a matrix
 
xy <- as.matrix(cbind(x,y))
 
# transpose xy
 
xyT <- t(xy) 
 
# define function z as a matrix
 
z <- as.matrix(sqrt(x*y))
 
contour(xyT,z)

