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
ruta <- shortest.paths(g,v="Laguna",to="Oporto")
ruta[1]
tkplot(g) # Dibuja el gráfico
data <- edit(data.frame(nombres2)) # Introducir manualmente los nodos de la red

#Pesos o distancias.
#Ver: http://stackoverflow.com/questions/9317923/find-distance-of-route-from-get-shortest-paths
#Usar un ejemplo más sencillo. Comprobar si a igual número de nodos elige el menos largo.
nombres2 <- read.csv("nombres2.csv",sep=";")
g2 <- graph.data.frame(nombres2, directed=FALSE)
E(g2)$weight #Ver pesos, distancias en este caso
#Min distancia entre dos paradas
ruta2 <- shortest.paths(g2,v="Laguna",to="Ciudad Universitaria",weights=E(g2)$var3) 
ruta2[1] 
ruta2 <- get.shortest.paths(g2,from="Laguna",to="Ciudad Universitaria",weights=E(g2)$var3) 
V(g2)[ruta2$vpath[[1]]]
ruta3 <- shortest.paths(g2,v="Laguna",weights=E(g2)$var3)
ruta3[1:10]
ruta3[] #Matriz de distancias
ruta3[1, which(V(g2)$name == 'Vodafone Sol')] #Distancia entre las especificada en ruta2 y esta.


#Pesos o distancias.Ejemplo corto
#http://stackoverflow.com/questions/15929022/how-to-get-the-a-list-of-the-edge-attributes-when-performing-shortest-paths-in-i?rq=1
require("igraph")
nombres <- read.csv("nombres4.csv",sep=";") # Importa datos
edit(nombres) # Ver datos en editor de texto
fix(nombres) # Editar datos importados
g <- graph.data.frame(nombres, directed=FALSE) # Crea igraph graph
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
ruta <- shortest.paths(g,v="A",to="C",weights=E(g)$weight) 
ruta[1] # Distancia
ruta[] # Los vértices y distancia

# Distancia entre vector especificado y el resto
ruta2 <- shortest.paths(g,v="C",weights=E(g)$weight)
ruta2[] # Tabla vértices y distancias
ruta2[1, which(V(g)$name == "B")] #Distancia entre vértice de la ruta y el B. En este ej, entre C y B.

ruta3 <- get.shortest.paths(g,from="A",to="C") #No necesito especificar weights los tiene en cuenta
#para elegir los vértices de la ruta más corta Nombres4 ruta corta. Nombres3 ruta larga.
V(g)[ruta3$vpath[[1]]] # O V(g)[sp[[1]]] en versiones anteriores
plot(g, edge.label=paste("Id:", 1:ecount(g), "\n", "Km:", E(g)$weight, sep=""))
