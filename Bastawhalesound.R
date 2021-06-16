

#BaSTA

library("BaSTA")

#importar datos 

datosJ <- read.csv("~/Desktop/bastaformat.csv", header = TRUE)

View(datosJ)
head(censusMat) #para ver las primeras 5 filas  


#crear un data frame

datosJ <- as.data.frame(datosJ,
                       row.names = NULL, optional = FALSE,
                        make.names = TRUE,
                        stringsAsFactors = default.stringsAsFactors())

length(datosJ) #data frame length is 26
   
#para chequear si data está bien

datosJ <- DataCheck(datosJ, studyStart = 1999,
                            studyEnd = 2018,   autofix = rep(1, 7),
                            silent = FALSE)

data.matrix(datosJ, rownames.force = NA) #should I make this? #matrix length is 9

#analisis 


out <- basta(object = datosJ, studyStart = 1999, studyEnd = 2018, models = c("LO"), 
             shape = "Makeham", niter = 2000, burnin = 100, thinning = 10, 
             thetaJumps = c(0.1, 0.1, 0.1))

out <- basta(object = datosJ, studyStart = 1999, studyEnd = 2018, models = c("LO"), 
             shape = "Makeham",  thetaJumps = c(0.1, 0.1, 0.1))

out <- basta(object = datosJ, studyStart = 1999, studyEnd = 2018, models = c("LO"), 
             shape = "Makeham")
