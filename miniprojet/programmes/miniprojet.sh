#!/usr/bin/bash

URL=$1
COUNT=0
OUTFILE="tableaux/tableau-fr.html" # Fichier de sauvegarde

# Construction du fichier html
echo -e ""
<html>
    <head>
        <meta charset="UTF-8"/>
        <title>Tableau</title>
        <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/versions/bulma-no-dark-mode.min.css">
    </head>
    <body>
        <h1 class="title is-1">Links table</h1>
        <div class="columns-is-centered">
            <table class="tabs is-centered is-striped">"" >> ${OUTFILE}


# Test du chemin
if [ -n "$URL" ]
then

    # Affiche une en-tête
    # Première ligne du tableau
    echo -e "
            <tr><th>Line</th><th>Link</th><th>HTTP code</th><th>Encodage</th><th>Word number</th></tr>" >> ${OUTFILE} 

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
        echo -e "
            <tr><td>${COUNT}</td><td>${line}</td><td>${REPHTTP}</td><td>${ENCODAGE}</td><td>${WORD}</td></tr>" >> ${OUTFILE}
    done < "$URL" ;

else
    # Si erreur, exit
    echo "L'argument n'est pas correct."
    exit
fi

echo -e "
            </table>
        </div>
    </body>
</html>" >> ${OUTFILE} # Fin HTML

echo "Les données sont stockées dans '$OUTFILE'"