#!/usr/bin/bash

URL=$1
COUNT=0
OUTFILE="tableaux/tableau-fr.tsv"

# Vérifie que le dossier tableaux existe, sinon le crée
mkdir -p tableaux

# Vérifie que l'argument est le bon fichier
if [ "$URL" = "urls/fr.txt" ]; then

    # Crée le fichier TSV avec l'en-tête
    echo -e "N°\tURL\tHTTP\tEncodage\tNb_mots" > "$OUTFILE"

    # Lit chaque ligne du fichier d'URLs
    while read -r line; do
        COUNT=$((COUNT + 1))

        # Récupère le code HTTP
        REPHTTP=$(curl -s -o /dev/null -w %{http_code} "$line")

        # Test pour les erreurs HTTP
        if [ "$REPHTTP" -eq 200 ]; then
            # Récupère l'encodage et le nombre de mots
            ENCODAGE=$(curl -s "$line" | grep -i "meta charset" | head -n1)
            WORD=$(lynx -dump "$line" | wc -w)
        else
            ENCODAGE="-"
            WORD="-"
        fi

        # Écrit la ligne dans le fichier TSV
        echo -e "${COUNT}\t${line}\t${REPHTTP}\t${ENCODAGE}\t${WORD}" >> "$OUTFILE"

    done < "$URL"

else
    echo "L'argument n'est pas correct."
    exit 1
fi

