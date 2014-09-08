#SOLUCION
#http://igraph.sourceforge.net/igraphbook/igraphbook-creating.html en
#Real world examples

require("igraph")
nombres <- read.csv(file.choose(),sep=";") 
# o nombres <- read.csv("C:/Users/MartinB/Desktop/nombres - copia.csv",sep=";") 
edit(nombres) #Ver datos importdaos

#Creamos el gráfico
g <- graph.data.frame(nombres, directed=FALSE)

#Lista paradas entres dos estaciones
sp <- get.shortest.paths(g,from="A",to="B")
V(g)[sp$vpath[[1]]] # O V(g)[sp[[1]]] en versiones anteriores

#Número de paradas entre dos estaciones
ruta <- shortest.paths(g,v="A",to="C",weights=E(g)$var))
ruta[1]

plot.igraph(g) # Dibuja gráfico no interactivo
tkplot(g) # Dibuja el gráfico interactivo
data <- edit(data.frame()) #