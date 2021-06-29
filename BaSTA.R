library(BaSTA)
library(snow)
library(snowfall)

datosJ <- read.csv("~/Desktop/bastaformat.csv", header = TRUE)

#View(datosJ)

#Datacheck

checkData <- DataCheck(datosJ, studyStart = 1999,
                    studyEnd = 2018,   autofix = rep(1, 7),
                    silent = FALSE)

#Analisis

basta <- multibasta(object = checkData$newData, studyStart = 1999, studyEnd = 2018, 
                    model = "LO", shape = "simple" , niter = 11001 , burnin = 1001 , thinning = 20 , 
                    parallel = TRUE, 
                    lifeTable = TRUE, ncpus = 4 , nsim = 4)

