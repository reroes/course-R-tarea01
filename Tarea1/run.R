# 1) ----
# Una vez haya leido este archivo lo puede grabar en su disco duro use la 
# funcion sink

sink("generados/salida_archivo_leyendo_datos.txt")
# uso del método delim: 
# http://www.sthda.com/english/wiki/reading-data-from-txt-csv-files-r-base-functions
data <- read.delim("https://raw.githubusercontent.com/Ciespinosa/datos_practicas/master/leyendoDatos.txt",
                   header = FALSE)
write.table(data)
sink()

# 2) ----
# Lea el archivo de datos de aves en el siguiente enlace: 
# https://raw.githubusercontent.com/Ciespinosa/datos_practicas/master/Aves_temporal2.csv, 
# usando la función read.csv
# lectura del archivo

# data2 => objeto de aves

data2 = read.csv("https://raw.githubusercontent.com/Ciespinosa/datos_practicas/master/Aves_temporal2.csv",
                sep = ";")

# 3) ----
# se guarda el archivo en el entorno local
write.csv(data2, file="generados/Aves_temporal2.csv")

# Puesto que en la matriz de aves tiene dos columnas que son fecha y estacion, 
# omitiremos esas dos primeras columnas. 
# Si usted le puso como nombre al objeto de los datos de aves: 
# dAves (usted puede poner cualquier nombre), para omitir las dos primeras 
# columnas seria dAves[,-(1:2)].

data2 = data2[,-(1:2)]

# 4) ----
# a. Use la funcion colSums, para sumar los individuos de cada especie. 
sumaColumnas = colSums(data2)

# b. Para ordenar el vector resultante use la función sort y en argumentos 
# incluya, decreasing = TRUE.
sumaColumnasOrdenadas = sort(sumaColumnas, decreasing = TRUE)
sumaColumnasOrdenadas

# c. Par obtener las 5 especies mas abundantes, con el vector creado en b, 
# defina cuantas especies quiere ver. Si le puso de nombre al vector nomA, 
# use nomA[1:5], esto nos permitira obtener los elementos del 1 al 5.
cincoEspecies = sumaColumnasOrdenadas[1:5]
cincoEspecies

# 5) ----
# Genere un reporte en el cual se diga cuales son las 5 especies con mayor 
# abundancia. Use la funcion names, para obtener los nombres de las especies 
# dominantes.
names(cincoEspecies) <- c("Cyanocorax.mystacalis", "Furnarius.cinnamomeus", 
                          "Mimus.longicaudatus", "S.bernardi", 
                          "Amazilia.amazilia")
print(cincoEspecies)

# 6. Agregue en el reporte el summary del objeto de aves.
print(summary(data2))

# 7. Incluya en el informa una frase que diga: Luego del analisis desarrollado 
# la especie mas dominante es xx(incluir con codigo la especie mas dominante), 
# con un total de xx (incluir con codigo el numero de individuos de esa especie).

# Acumulación de cadenas
# https://stackoverflow.com/questions/32092166/how-to-concatenate-the-values-in-r-using-loop-function
# Proceso para presentar el reporte final
cadenaCincoEspecies <- NULL
for (variable in cincoEspecies) {
  # cat(names(cincoEspecies[cincoEspecies==variable]), "\t", variable, "\n")
  cadenaCincoEspecies <- c(cadenaCincoEspecies, 
                           paste(names(cincoEspecies[cincoEspecies==variable]),
                                 "\t", variable, "\n"))
}

cat("Reporte Final\n", "Las 5 especies con mayor abundancia son:\n", 
    cadenaCincoEspecies, "Resumen:\n", summary(data2), "\n", 
    "Luego del analisis desarrollado:",
    "la especie mas dominante es\n", 
    names(cincoEspecies[cincoEspecies==cincoEspecies[1]]),
    " Con un total de\t", cincoEspecies[1])

# Fin

