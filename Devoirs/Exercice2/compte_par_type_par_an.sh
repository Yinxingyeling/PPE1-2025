#!/bin/bash

ENTITE="$1"
DATADIR=$2
ANNEE=2016

# Ajout d'un test pour la vérification de l'emplacement
# test de l'existance des arguments


# Racourcie le script par une boucle while
while [ "$ANNEE" -le 2018 ];
do 
    echo "Nombre de '$ENTITE' en '$ANNEE'."
    cat "$ANNEE"/*/*.ann | grep "$ENTITE" | wc -l
    ANNEE=$(expr "$ANNEE" + 1)

# echo "Nombre de "$ENTITE" en 2016."
# cat 2016/*/*.ann | grep "$ENTITE" | wc -l
# # écriture plus rapide
# # bash compte_par_type.sh 2016 "$ENTITE"

# echo "Nombre de "$ENTITE" en 2017."
# cat 2017/*/*.ann | grep "$ENTITE" | wc -l
# # bash compte_par_type.sh 2017 "$ENTITE"

# echo "Nombre de "$ENTITE" en 2018."
# cat 2018/*/*.ann | grep "$ENTITE" | wc -l
# # bash compte_par_type.sh 2018 "$ENTITE"
