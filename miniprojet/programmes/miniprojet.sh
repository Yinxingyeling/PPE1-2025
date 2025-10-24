#!/usr/bin/bash

URL=$1
COUNT=0
OUTFILE="tableaux/tableau-fr.tsv" # Fichier de sauvegarde

# Test du chemin
if [ "$URL" = "urls/fr.txt" ]
then

    # Affiche une en-tête
    echo -e "N°\tURL\tHTTP\tEncodage\tNb_mots" > ${OUTFILE}

    # Lis chaque line du fichier
    while read -r line
    do
        COUNT=$(expr "$COUNT" + 1) # nombre de ligne

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
        # Affiche les données collectées dans un fichier TSV
        echo -e "${COUNT}\t${line}\t${REPHTTP}\t${ENCODAGE}\t${WORD}" >> ${OUTFILE}
    done < "$URL" ;

else
    # Si erreur, exit
    echo "L'argument n'est pas correct."
    exit
fi





#     # Lis chaque line du fichier
#     while read -r line;
#     do
#         COUNT=$(expr "$COUNT" + 1) # nombre de ligne

#         REPHTTP=$(curl -s -o /dev/null -w %{http_code} ${line}) # code HTTP
        
#         # Test pour les erreurs HTTP
#         if [ ${REPHTTP} -eq 200 ] 
#         then
#             ENCODAGE=$(curl -s ${line} | grep "meta charset") # Encodage
#             WORD=$(lynx -dump ${line} | wc -w) # Nombre de mots
#         else
#             ENCODAGE="-"
#             WORD="-"
#         fi
#         # Affiche les données collectées dans un fichier TSV
#         echo -e "${COUNT}\t${line}\t${REPHTTP}\t${ENCODAGE}\t${WORD}" >> ${OUTFILE}
#     done < ${URL} ;

# else
#     # Si erreur, exit
#     echo "L'argument n'est pas correct."
#     exit
# fi
