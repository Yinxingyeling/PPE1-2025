#!/usr/bin/bash

# --- Version 2 ---
# Exercice 3
# Ajout test : fichier existant ? Chemin correct ?

DIRECT=$(pwd)
COUNT=2016

while [ "$COUNT" -le 2018 ];
do 
    if [ -e "$DIRECT/$COUNT" ]
    then
        echo "Nombre de lieux en '$COUNT'."
        cat "$DIRECT"/"$COUNT"/*/*.ann | grep Location | wc -l
    else 
        echo "Les fichiers ne sont pas ici."
        exit
    fi
    COUNT=$(expr "$COUNT" + 1)
done

## --- Version 1 ---
# Exercice 1 
# Compte nombre de lignes contenant "Location"
# Sur les fichiers ".ann" de l'exercice 1

# echo "Nombre de lieux en 2016"
# cat "$DIRECT"/2016/*/*.ann | grep Location | wc -l # --correction : suppression d'un cat en plus 
# echo "Nombre de lieux en 2017"
# cat "$DIRECT"/2017/*/*.ann | grep Location | wc -l 
# echo "Nombre de lieux en 2018"
# cat "$DIRECT"/2018/*/*.ann | grep Location | wc -l 
