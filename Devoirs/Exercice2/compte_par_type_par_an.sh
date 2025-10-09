#!/bin/bash

ENTITE="$1"

echo "Nombre de "$ENTITE" en 2016."
cat 2016/*/*.ann | grep "$ENTITE" | wc -l
# écriture plus avancée
# bash compte_par_type.sh 2016 "$ENTITE"

echo "Nombre de "$ENTITE" en 2017."
cat 2017/*/*.ann | grep "$ENTITE" | wc -l
# bash compte_par_type.sh 2017 "$ENTITE"

echo "Nombre de "$ENTITE" en 2018."
cat 2018/*/*.ann | grep "$ENTITE" | wc -l
# bash compte_par_type.sh 2018 "$ENTITE"
