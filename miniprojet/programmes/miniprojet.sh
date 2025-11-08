#!/usr/bin/bash

URL=$1
COUNT=0
OUTFILE="tableaux/tableau-fr.html" # Fichier de sauvegarde

# Construction du fichier html
echo -e '<html>\n\t<head>\n\t\t<meta charset="UTF-8"/>\n\t</head>' > ${OUTFILE} # Entête du fichier html
echo -e '\t<body>\n\t<h1>Links table</h1>\n\t\t<table border=1>' >> ${OUTFILE}


# Test du chemin
if [ -n "$URL" ]
then

    # Affiche une en-tête
    # Première ligne du tableau
    echo -e '\t\t\t<tr><th>Line</th><th>Link</th><th>HTTP code</th><th>Encodage</th><th>Word number</th></tr>' >> ${OUTFILE} 

    # Lis chaque line du fichier
    while read -r line
    do
        COUNT=$(expr "$COUNT" + 1) # nombre de ligne

        # Manque "https://" -> ajouter
        if [[ ! "$line" =~ ^https?:// ]];
        then
            line=https://"$line"
        fi

            # Récupère le code HTTP
            REPHTTP=$(curl -s -o /dev/null -w %{http_code} "$line")

        # Test pour les erreurs HTTP
        if [ "$REPHTTP" -eq 200 ]; then
            # Récupère l'encodage et le nombre de mots
            ENCODAGE=$(curl -s -o /dev/null -w "%{content_type}" "${line}" | cut -d '=' -f2)
            # ENCODAGE=$(curl -s "$line" | grep -i "meta charset" | head -n1)
            WORD=$(lynx -dump "$line" | wc -w)
        
        # Ajout test pour 429 (trop de requêtes)
        elif [ "$REPHTTP" -eq 429 ] ; then
            sleep 3 # Pause de 3 secondes
            REPHTTP=$(curl -s -o /dev/null -w %{http_code} "$line")
            ENCODAGE=$(curl -s -o /dev/null -w "%{content_type}" "${line}" | cut -d '=' -f2)
            WORD=$(lynx -dump "$line" | wc -w)

        # Si erreur : ne pas afficher la suite
        else
            ENCODAGE="-"
            WORD="-"
        fi

        # Affiche les données collectées dans un fichier TSV
        echo -e "\t\t\t<tr><td>${COUNT}</td><td>${line}</td><td>${REPHTTP}</td><td>${ENCODAGE}</td><td>${WORD}</td></tr>" >> ${OUTFILE}
    done < "$URL" ;

else
    # Si erreur, exit
    echo "L'argument n'est pas correct."
    exit
fi

echo -e '\t\t</table>\n\t</body>\n</html>' >> ${OUTFILE} # Fin HTML

echo "Les données sont stockées dans '$OUTFILE'"