#!/bin/bash

ANNEE="$1"
ENTITE="$2"

cat "$ANNEE"/*/*.ann | grep "$ENTITE" | wc -l
