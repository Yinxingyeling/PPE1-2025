#!/bin/bash

ANNEE=$1
MOIS=$2
NBR_LIEUX=$3
DATADIR=$4 # Correction : ajout de la direction si besoin

if [ $# -ne 4 ]
then
    echo "Le chemin est-il correct ?"
    read -r -p "Le chemin est-il correct ? O/N "REP
    if [ "$REP" = "N" ]
    then
        echo "Il faut 4 arguments : année, mois, le nombre d'affichage et le chemin" 
        exit
    else
        cat "ann/$ANNEE"/"$MOIS"/*.ann | grep Location | cut -f3 | sort -k3 | uniq -c | sort -k1 -r | head -n"$NBR_LIEUX"
    fi
fi 

# # Test 1
# cat "$ANNEE"/"$MOIS"/*.ann | grep Location | sort -k3 | uniq | cut -f3 | head -n"$NBR_LIEUX"

# Amélioration finale
cat "$DATADIR"/"$ANNEE"/"$MOIS"/*.ann | grep Location | cut -f3 | sort -k3 | uniq -c | sort -k1 -r | head -n"$NBR_LIEUX"

