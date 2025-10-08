#!/usr/bin/bash

# Exercice 1 
# Compte nombre de lignes contenant "Location"
# Sur les fichiers ".ann" de l'exercice 1

echo "Nombre de lieux en 2016"
cat cat 2016/*/*.ann | grep Location | wc -l
echo "Nombre de lieux en 201*"
cat cat 2017/*/*.ann | grep Location | wc -l
echo "Nombre de lieux en 2018"
cat cat 2018/*/*.ann | grep Location | wc -l