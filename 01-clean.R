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



