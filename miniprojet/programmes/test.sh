#!/usr/bin/bash

URL=$1
COUNT=0
OUTFILE="tableaux/tableau-fr.tsv" # Fichier de sauvegarde

if [ "$URL" = "urls/fr.txt" ]
then

    while read -r line;
    do

        COUNT=$((COUNT + 1))
        REPHTTP=$(curl -s -o /dev/null -w "%{http_code}" "$line")
        # REPHTTP=$(curl -si ${line} | grep "HTTP" | cut -d " " -f2)

        echo "$REPHTTP"

        # if [ ${REPHTTP} -eq 200 ]; then

        #     ENCODAGE=$(curl -s ${line} | grep "meta charset")
        #     WORD=$(WORD=$(lynx -dump "$line" | wc -w))
        #     echo ${REPHTTP}
        #     echo ${ENCODAGE}
        # else 
        #     echo "erreur"
        # fi
        # echo -e "${COUNT}\t${line}\t${REPHTTP}\t${ENCODAGE}\t${WORD}" 
    
    done < "$URL" ;

else
    echo "L'argument n'est pas correct."
    exit
fi

# Test erreurs -> renvoie rien
        # REPHTTP=$(curl -s -w %{http_code} "$line")
        # echo ${line}
        # REPHTTP=$(curl -si ${line} | grep "HTTP")