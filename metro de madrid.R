#Ejemplo de metro Madrid
library("igraph")
metro <- graph.formula(PinardeChamartin-Bambu-Chamartin-PlazadeCastilla-Valdeacederas-Tetuan-Estrecho-Alvarado-CuatroCaminos-RiosRosas-Iglesia-Bilbao-Tribunal-GranVia-Sol-TirsodeMolina-AntonMartin-Atocha-AtochaRenfe-MenendezPelayo-Pacifico-PuentedeVallecas-NuevaNumancia-Portazgo,Laguna-Carpetana-Oporto-Opanel-PlazaEliptica-Usera-Legazpi-ArganzuelaPlanetario-MendezAlvaro-Pacifico-CondedeCasal-SainzdeBaranda-ODonnell-ManuelBecerra-DiegodeLeon-AvenidadeAmerica-RepublicaArgentina-NuevosMinisterios-CuatroCaminos-GuzmanelBueno-Metropolitano-CiudadUniversitaria-Moncloa-Arguelles-PrincipePio-PuertadelAngel-AltodeExtremadura-Lucero-Laguna,Arguelles-SanBernardo-Bilbao-AlonsoMartinez-Colon-Serrano-Velazquez-Goya-Lista-DiegodeLeon-AvenidadeAmerica-Prosperidad-AlfonsoXIII-AvenidadelaPaz-ArturoSoria-Esperanza-Canillas-MardeCristal-SanLorenzo-ParquedeSantaMaria-Hortaleza-Manoteras-PinardeChamartin)
tkplot(metro)
# compute the min distances from '234' to all other vertices
ruta <- shortest.paths(metro,v="PinardeChamartin",to="ManuelBecerra")
# Número de estaciones
ruta[1]
#Lista las estaciones
sp <- get.shortest.paths(metro,from="PinardeChamartin",to="ManuelBecerra")
V(metro)[sp[[1]]]
