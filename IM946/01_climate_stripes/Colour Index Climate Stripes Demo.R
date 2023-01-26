library(colorspace)

# read in climate anomaly data

southernHemisphere <- read.csv("IM946/01_climate_stripes/data/raw/HadCRUT.5.0.1.0.analysis.summary_series.southern_hemisphere.annual.csv")

# I know what my data are...

myData <- southernHemisphere[,2]

plot( myData )

southernHemisphere$Anomaly..deg.C. == myData

# and I know what colours I want them to be...

myColours <- colorspace::diverge_hcl( n = 7, palette = "Blue-Red 3"  )
  
# and I want the 'right' colour for each data point
# i.e. 'myDataInColours'
  
      # in the newest version of Rstudio colours are tinted in your code :) 
      
        # "#002F70" "#517AC9" "#B4C2EB" "#F6F6F6" "#EDB4B5" "#C05D5D" "#5F1415"

      # how much data I want in each colour bin... (i.e. quantiles or something else)    
  
        myDensities <- seq( 0, 1, l=8 )
      
      # find the values for the bin containing each denisty
    
        myDataBins <- quantile( x=myData, probs = myDensities )
        
      # find which bin the data are in
      
        myColourIndices <- findInterval( x=myData, vec = myDataBins, all.inside = T )

# ... then I will have my Data In Colours!

    myDataInColours <- myColours[ myColourIndices ]

    
    
plot( myData, pch=19, cex=2, col=myDataInColours )


