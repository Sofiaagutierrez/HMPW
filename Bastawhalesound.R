

#BaSTA

library("BaSTA")

#importar datos 

datosJ <- read.csv("~/Desktop/bastaformat.csv", header = TRUE)

View(datosJ)
head(censusMat) #para ver las primeras 5 filas  

 
#if I run the data check before running the analysisI get the following error after running the analysis --> Error in object[, 1] : incorrect number of dimensions

datosJ <- DataCheck(datosJ, studyStart = 1999,
                            studyEnd = 2018,   autofix = rep(1, 7),
                            silent = FALSE)

#by running the analysis without running the data check code before, I get the following error : 

#Error in setDefaultClusterOptions(type = .sfOption$type) : could not find function "setDefaultClusterOptions"

# plus the DIC's aren't calculated

#analysis

multiout <- multibasta(object = datosJ, studyStart = 1999, studyEnd = 2018, model = "LO",
                       shape = "simple", niter = 50000, burnin = 5001 , thinning = 50, lifeTable = TRUE, nsim = 8)
print(multiout)  

