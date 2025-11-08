#!/usr/bin/bash

OUTFILE="tableaux/tableau-fr.html" # changer la sortie en html

echo -e '<html>\n\t<head>\n\t\t<meta charset="UTF-8"/>\n\t</head>' > $OUTFILE # Entête du fichier html
echo -e '\t<body>\n\t<p>Links table</p>\n\t\t<table>' >> $OUTFILE
# Première ligne du tableau
echo -e '\t\t\t<tr><th>Line</th><th>Link</th><th>HTTP code</th><th>Encodage</th><th>Word number</th></tr>' >> $OUTFILE 

echo -e '\t\t\t<tr><td>${COUNT}</td><td>${line}</td><td>${REPHTTP}</td><td>${ENCODAGE}</td><td>${WORD}</td></tr>'