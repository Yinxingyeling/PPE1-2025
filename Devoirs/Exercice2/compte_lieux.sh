#!/bin/bash

# DATADIR=$1 # Correction : ajout de la direction si besoin
ANNEE=$1
MOIS=$2
NBR_LIEUX=$3

# if [$# -ne 3]
# then
#     echo "Il faut 3 arguments" 
#     exit
# fi 

# Test 1
cat "$ANNEE"/"$MOIS"/*.ann | grep Location | sort -k3 | uniq | cut -f3 | head -n"$NBR_LIEUX"

# Amélioration finale
# cat "$DATADIR"/"$ANNEE"/"$MOIS"/*.ann | grep Location | cut -f3 | sort -k3 | uniq -c | sort -k1 -r | head -n"$NBR_LIEUX"

