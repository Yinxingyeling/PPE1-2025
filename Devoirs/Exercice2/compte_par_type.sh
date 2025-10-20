#!/bin/bash

ANNEE="$1"
ENTITE="$2"
DIRECT=$(pwd)

# Ajout d'un test pour la vérification de l'emplacement
# test de l'existance des arguments

if [ $# -ne 2 ]
then
    echo "Il faut 2 arguments : l'année et l'entité"
    exit
else
    if [ -e "$DIRECT/$ANNEE" ]
    then
        cat "$ANNEE"/*/*.ann | grep "$ENTITE" | wc -l
    else
        echo "Les fichiers ne sont pas ici."
    fi
fi