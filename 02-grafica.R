# Cargamos paquetes 
pacman::p_load("ggplot2")

# Graficamos cambios por anio ----------

# Leemos la data 
limpia <-  read.csv(file="results/limpia.csv")

# Graficamos 
barras.p <- ggplot(data=limpia , 
                   mapping = aes( x=year ,
                                  y= miembros,
                                  fill = cambio))+
            geom_col(position = "dodge")+
            ggtitle("Cambios en el SNI")+
            theme(plot.title=element_text( face='bold', size=20),
                  plot.subtitle=element_text(size=15),
                  axis.title.y = element_text(size=12),
                  panel.background = element_rect(fill = alpha('slategray2',0.5)),
                  panel.border = element_rect(color ='black',fill = NA ,linewidth = 1),
                  plot.background = element_rect(fill = "white"))+
            facet_wrap( ~nobilis )

# Visualizamos la grafica 
barras.p

# Guardamos el grafico
ggsave (filename = "results/barras.png",
        plot = barras.p , width = 7, height = 5)
  

# Graficamos la proporcion de DR y DRA que 
# pierden el SNI

# Leemos la data 
resumen <-  read.csv( file = "results/resumen.csv")

pay.p <- ggplot( data=resumen,
                 mapping = aes(x="",
                               y=totales,
                               fill=nobilis))+
         geom_col(color ="black")+
         coord_polar("y")+
         theme_void()+
         ggtitle( "Miembros que han perdido el SNI")

# Visualizamos la grafica 
pay.p

# Guardamos el grafico 
ggsave (filename = "results/pay.png",bg ="white",
        plot = pay.p , width = 9, height = 7)


# To-Do's
# naomicasanova: Agregar el numero de Drs y Dras en el 
#                grafico de pay


  
  