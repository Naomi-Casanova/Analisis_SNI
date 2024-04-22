# Cargamos los paquetes 
pacman::p_load("vroom","dplyr")

# Leemos la data
la_data <- vroom(file = "data/data_original.csv")

# Nos quedamos con DR. y DRA.
data_filtrada <- la_data %>%
  filter( nobilis == "DR." | nobilis == "DRA.")

# Creamos directorio con los resultados 
dir.create ( path = "results")

# Guardamos esta Data 
write.csv( x = data_filtrada , file = "results/limpia.csv")

# Calculamos la proporcion de DR y DRa que pierden el SNI
data_resumen <- data_filtrada %>% 
  filter( cambio == "perdio SNI")%>%
  group_by( nobilis )%>%
  summarise( totales = sum(miembros) )

# Guardamos la data resumen 
write.csv( x = data_resumen , file ="results/resumen.csv")


# To - Do's
# naomicasanova : Calcular el % de DR  y DRA que pierden 
#                 SNI como  TOTAL_INGRESOS / TOTAL_PERDIDAS