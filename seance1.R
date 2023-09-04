#Installation des packages
library(dplyr)
library(sf)
library(mapview)
# Création d'un data frame 
#Création de la colonne Nom 

nom <-c("Diop","Sow","Kane", "Kanté","Toure", "Diop", "Sow")

#Colonne  age
age <-c(23,26,25,22,40, 45,56)
#Colonne taille
taille <-c(181,179,167,189,150, 189,199)
# ajouter la variable sexe
sexe <-c("F","H","F","F","H", "F","H")


# 1-Créer une couche spatiale avec ces points 
lat<-c(15.4964, 15.26866,14.99250,14.85492)
long <-c(-15.35805,-15.92982,-15.25026,-15.04090)
nom <-c("Abdou","Massamba", "Oumar", "Demba")
# Creation data frame 
tab <- data.frame(lat, long, nom)
test1 <- st_as_sf(tab,coords = c("long","lat"), crs = 4326)
#Afficher mes points 
mapview(test1)

# 2 Sauvegarder la couche au format geojson sous le nom  exo
st_write(test1,"exo.geojson")

#Tableau avec toutes les colonnes 
tableau1 <-data.frame(nom,age,taille,sexe)
#Total par variable
table(tableau1$sexe)

View(tableau1)


max(tableau1$age)
str(tableau1)
tableau1$nom
attributes(tableau1)
plot(tableau1$age,tableau1$taille, main = "Age et taille")
hist(tableau1$taille)
barplot(tableau1$taille, main = "Taille" )
boxplot(tableau1$age,tableau1$taille) 
#Tableau avec toutes les colonnes 
tableau1 <-data.frame(nom,age,taille,sexe)
View(tableau1)

# Ouvrir le fichier csv 
 base <-read.csv("data/my_select.csv")
 View(base)
# Créer une couche spatiale à partir des coordonnées géographiques
 datas <- st_as_sf(base, coords = c("longitude", "latitude"), crs = 4326)
# Afficher la couche 
 plot(st_geometry(datas))
 
 #Exporter le fichier au format geojson
 st_write(datas, "afrique.geojson")
 ##Exporter le fichier au format shapefile
 st_write(datas, "afrique.shp")
 library(mapview)

 # Créer un buffer autour d'un point 
zone3 <- st_buffer(zone2,50000)
 plot(st_geometry(zone3))
zone2 <- st_tranform(zone1, crs= 32628 )

plot(st_geometry(zone1))
 mapview(zone1)
 
 
 
mapview(datas, 
         color="red", 
         col.regions ="green",
         label= TRUE)
 
 
 ??mapview
 help("mapview")
 help(sf)
 p1 <-read.csv("data/my_select.csv")
View(p1)
datas <- st_as_sf(base, coords = c("longitude", "latitude"), crs = 4326)


plot(st_geometry(datas))
mapview(datas)
# Sauvegarder le  tableau

# Ouvrir le fichier Excel
library(readxl)
my_data <- read_xls("data/wb_don_1990_2019.xls", sheet = 3)

####  Exploration du tableau importé ####

# Visualiser le tableau dans l'IDE Rstudio :
View(my_data)
# Nombre de lignes du tableau :
nrow(my_data)
# Nombre de colonnes
ncol(my_data)
# Nombre de lignes et de colonnes :
dim(my_data)
# Noms des colonnes du tableau :
colnames(my_data)

#### Séléction des pays sub-saharien et des colonnes de 1 à 13 ####


my_select <- my_data[my_data$region %in% "Sub-Saharan Africa", 1:13]

# OU 

my_select <- subset(x = my_data,  
                    subset = region %in% "Sub-Saharan Africa", 
                    select = 1:13)


#### Calcul de la population totale ####

sum(my_select$POP, na.rm = TRUE)

data2 <- read.csv("data/my_select.csv")
View(data2)


tab3sf <- st_as_sf(tab3,coords = c("long","lat"),crs=4326)


