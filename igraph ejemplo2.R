#SOLUCION
#http://igraph.sourceforge.net/igraphbook/igraphbook-creating.html en
#Real world examples
require("igraph")
nombres <- read.csv(file.choose(),sep=";") 
nombres <- read.csv("nombres.csv",sep=";") # Fichero nombres en el 'working directory'.
# o nombres <- read.csv("C:/Users/MartinB/Desktop/nombres - copia.csv",sep=";") 
edit(nombres) #Ver datos importdaos
g <- graph.data.frame(nombres, directed=FALSE) #Creamos el gráfico
#Lista paradas entres dos estaciones
sp <- get.shortest.paths(g,from="Cuatro Caminos",to="Pacífico")
V(g)[sp$vpath[[1]]] # O V(g)[sp[[1]]] en versiones anteriores
#Número de paradas entre dos estaciones
sp <- shortest.paths(g,v="Laguna",to="Oporto")
sp[1]
tkplot(g) # Dibuja el gráfico
data <- edit(data.frame(nombres2)) # Introducir manualmente los nodos de la red

#Pesos o distancias.
#Ver: http://stackoverflow.com/questions/9317923/find-distance-of-route-from-get-shortest-paths
#Usar un ejemplo más sencillo. Comprobar si a igual número de nodos elige el menos largo.
nombres2 <- read.csv("nombres2.csv",sep=";")
g2 <- graph.data.frame(nombres2, directed=FALSE)
E(g2)$weight #Ver pesos, distancias en este caso
#Min distancia entre dos paradas
sp2 <- shortest.paths(g2,v="Laguna",to="Ciudad Universitaria",weights=E(g2)$var3) 
sp2[1] 
sp2 <- get.shortest.paths(g2,from="Laguna",to="Ciudad Universitaria",weights=E(g2)$var3) 
V(g2)[sp2$vpath[[1]]]
sp3 <- shortest.paths(g2,v="Laguna",weights=E(g2)$var3)
sp3[1:10]
sp3[] #Matriz de distancias
sp3[1, which(V(g2)$name == 'Vodafone Sol')] #Distancia entre las especificada en sp2 y esta.


#Pesos o distancias.Ejemplo corto
#http://stackoverflow.com/questions/15929022/how-to-get-the-a-list-of-the-edge-attributes-when-performing-shortest-paths-in-i?rq=1
require("igraph")
data <- read.csv("ejemplo1.csv",sep=";") # Importa datos
edit(data) # Ver datos en editor de texto
fix(data) # Editar datos importados
g <- graph.data.frame(data, directed=FALSE) # Crea igraph graph
#nombres = as.data.frame(nombres)
class(g)
print(g, e=TRUE, v=TRUE)
#----------------
plot(g) # Gráfico no dinámico
tkplot(g) #Gráfico dinámico. Carga paquete: tcltk
#----------
g[] # Tabla con distancias entre vértices conectados directamente
E(g)$weight #Ver pesos, distancias en este caso

# Min distancia (suma de pesos) entre dos vértices
sp <- shortest.paths(g,v="A",to="C",weights=E(g)$weight) 
sp[1] # Distancia
sp[] # Los vértices y distancia

# Distancia entre vector especificado y el resto
sp2 <- shortest.paths(g,v="C",weights=E(g)$weight)
sp2[] # Tabla vértices y distancias
sp2[1, which(V(g)$name == "B")] #Distancia entre vértice de la sp y el B. En este ej, entre C y B.

sp3 <- get.shortest.paths(g,from="A",to="C") #No necesito especificar weights los tiene en cuenta
#para elegir los vértices de la sp más corta Nombres4 sp corta. Nombres3 sp larga.
V(g)[sp3$vpath[[1]]] # O V(g)[sp[[1]]] en versiones anteriores
plot(g, edge.label=paste("Id:", 1:ecount(g), "\n", "Km:", E(g)$weight, sep=""))
sp4 <- get.all.shortest.paths(g, from="A",to="C")
#-----------------------
# Ejemplo2- Dijkstra's algorithm. Usar GIF:http://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
data2 <- read.csv("ejemplo2.csv",sep=";") # Importamos datos
g <- graph.data.frame(data2, directed=FALSE) # Crea Crea igraph 
V(g)$name # Nombres de los vértice
plot(g, edge.label=paste( E(g)$weight, sep="")) # Gráfico no dinámico
tkplot(g) # Gráfico dinámico
sp1 <- shortest.paths(g,v="1",to="5",weights=E(g)$weight) # Ruta entre 1 y 5
sp2 <- get.shortest.paths(g,from="1",to="5")
sp1[] # Distancia 
V(g)[sp2$vpath[[1]]] # Secuencia de vértices

# Ejemplo 3
# http://www.slideshare.net/podersonico/ejemplo-1-ruta-mas-corta-entre-dos-nodos-especificos
data2 <- read.csv("ejemplo3.csv",sep=";") # Importamos datos
g <- graph.data.frame(data2, directed=FALSE) # Crea Crea igraph 
plot(g, edge.label=paste( E(g)$weight, sep="")) # Gráfico no dinámico
tkplot(g,) # Gráfico dinámico
sp1 <- shortest.paths(g,v="Origen",to="Destino",weights=E(g)$weight) # Ruta entre 1 y 5
sp2 <- get.shortest.paths(g,from="Origen",to="Destino")
sp1[] # Distancia 
V(g)[sp2$vpath[[1]]] # Secuencia de vértices

# Ejemplo 4 - Directed graph
# http://en.wikipedia.org/wiki/Shortest_path_problem
require(igraph)
data2 <- read.csv("ejemplo4.csv",sep=";") # Importamos datos
g <- graph.data.frame(data2, directed=TRUE) # Crea Crea igraph 
plot(g, edge.label=paste( E(g)$weight, sep=""),edge.arrow.size=0.6) # Gráfico no dinámico
tkplot(g) # Gráfico dinámico
sp1 <- shortest.paths(g,v="A",to="F",weights=E(g)$weight) # Ruta entre 1 y 5
sp2 <- get.shortest.paths(g,from="A",to="F")
sp1[] # Distancia 
V(g)[sp2$vpath[[1]]] # Secuencia de vértices