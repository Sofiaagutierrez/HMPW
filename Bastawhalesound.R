

#BaSTA

library("BaSTA")

#importar datos 

datosJ <- read.csv("~/Desktop/bastaformat.csv", header = TRUE)

View(datosJ)
head(censusMat) #para ver las primeras 5 filas  


datosJ <- as.data.frame(datosJ,
                       row.names = NULL, optional = FALSE,
                        make.names = TRUE,
                        stringsAsFactors = default.stringsAsFactors())

length(datosJ) #data frame length is 26


datosJ <- DataCheck(datosJ, studyStart = 1999,
                            studyEnd = 2018,   autofix = rep(1, 7),
                            silent = FALSE)


#analisis 


out <- basta(object = datosJ, studyStart = 1999, studyEnd = 2018, models = c("LO"), 
             shape = "Makeham")
