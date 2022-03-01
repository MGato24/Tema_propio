
library(datos)
library(ggplot2)
library(dplyr)
library(png)
library(ggimage)

options(scipen=999)
options(RStudioGD.backend = "cairo")

paises |> View()

g = ggplot(paises) + aes(continente) + 
  geom_bar(fill = "#f58742", width = 0.5) + 
  geom_text(aes(label = ..count..), stat = "count", size = 5, vjust = -0.5)+
  geom_text(aes(x = 5.55, y = 630,
                label = "ALGÚN TEXTO QUE SIRVA 
COMO ANOTACION O INDICATIVO"),
            stat = "unique", size = 5, hjust = 1, vjust = 0.75) + 
  scale_y_continuous(limit = c(0,700), breaks=seq(0, 1000, 150)) +
  labs(title = "PAISES POR CONTINENTE:",
       subtitle = "CANTIDAD DE PAISES POR CONTINENTE 
CONSIDERADOS EN LA MUESTRA",
       x = "",
       y = "CANTIDAD", 
       caption = "FUENTE: GAPMINDER") + 
  theme(plot.margin = margin(t = 0.9,  # Margen superior
                             r = 1.5,  # Margen derecho
                             b = 0.5,  # Margen inferior
                             l = 1.5,  # Margen izquierdo
                             unit = "cm"),
        plot.caption = element_text(hjust = -0.15, size = 11, face = "bold"),
        axis.text.y  = element_text(size = 13),
        axis.text.x  = element_text(size = 13),
        axis.title.y = element_text(size = 13, vjust = 4),
        plot.title   = element_text(size = 16, face = "bold"),
        plot.subtitle = element_text(size = 16),
        panel.grid = element_line(color = "#9A9A9A"),
        panel.grid.major.x = element_blank())


g

ggbackground(g, "https://img.freepik.com/vector-gratis/fondo-diseno-corporativo-geometrico-tecnologia-gris-blanco-abstracto-eps-10-ilustracion-vectorial_73729-217.jpg")


library(magick)

UNALM_Logot =  image_read("logo_unalm.png")
Facu_Logo = image_read("facu_logo.png")
unalm_logo = image_read("UNALM_logo.png")

grid::grid.raster(UNALM_Logot, x = 0.98, y = 0.95, just = c('right', 'top'), width = unit(2.5, 'inches'))
grid::grid.raster(Facu_Logo, x = 0.02, y = 0.95, just = c('left', 'top'), width = unit(0.8, 'inches'))
grid::grid.raster(unalm_logo, x = 0.98, y = 0.02, just = c('right', 'bottom'), width = unit(0.3, 'inches'))

