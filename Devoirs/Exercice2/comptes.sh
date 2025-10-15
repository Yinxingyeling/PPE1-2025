#!/usr/bin/bash

# Exercice 1 
# Compte nombre de lignes contenant "Location"
# Sur les fichiers ".ann" de l'exercice 1

echo "Nombre de lieux en 2016"
cat 2016/*/*.ann | grep Location | wc -l # --correction : suppression d'un cat en plus 
echo "Nombre de lieux en 201*"
cat 2017/*/*.ann | grep Location | wc -l 
echo "Nombre de lieux en 2018"
cat 2018/*/*.ann | grep Location | wc -l 
