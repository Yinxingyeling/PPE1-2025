#!/bin/bash

ANNEE=$1
MOIS=$2
NBR_LIEUX=$3

# Test 1
# cat "$ANNEE"/"$MOIS"/*.ann | grep Location | sort -k3 | uniq | cut -f3 | head -n"$NBR_LIEUX"

# Amélioration finale
cat "$ANNEE"/"$MOIS"/*.ann | grep Location | cut -f3 | sort -k3 | uniq -c | sort -k1 -r | head -n"$NBR_LIEUX"