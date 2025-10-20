#!/bin/bash

ANNEE=$1
MOIS=$2
NBR_LIEUX=$3
DATADIR=$4 # Correction : ajout de la direction si besoin

if [ $# -ne 4 ]
then
    echo "Le chemin est-il correct ?"
    read -r -p "Le chemin est-il correct ? O/N   " REP
    if [ "$REP" = "O" ]
    then
        cat "ann/$ANNEE"/"$MOIS"/*.ann | grep Location | cut -f3 | sort | uniq -c | sort -k1 -r | head -n"$NBR_LIEUX"
    else 
        echo "Il faut 4 arguments : année, mois, le nombre d'affichage et le chemin" 
        read -r -p "Entrez l'année (2016-2018) : " ANNEE 
        read -r -p "Entrez un mois (01-12) : " MOIS 
        read -r -p "Entrez le nombre d'affichage : " NBR_LIEUX 
        read -r -p "Entrez le chemin vers les fichiers .ann " DATADIR 
        cat "$DATADIR"/"$ANNEE"/"$MOIS"/*.ann | grep Location | cut -f3 | sort | uniq -c | sort -k1 -r | head -n"$NBR_LIEUX"
    fi
else 
    cat "$DATADIR"/"$ANNEE"/"$MOIS"/*.ann | grep Location | cut -f3 | sort | uniq -c | sort -k1 -r | head -n"$NBR_LIEUX"
fi 

# # Test 1
# cat "$ANNEE"/"$MOIS"/*.ann | grep Location | sort -k3 | uniq | cut -f3 | head -n"$NBR_LIEUX"

# Amélioration finale
# cat "$DATADIR"/"$ANNEE"/"$MOIS"/*.ann | grep Location | cut -f3 | sort -k3 | uniq -c | sort -k1 -r | head -n"$NBR_LIEUX"

