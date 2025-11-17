# Journal de bord du projet encadré
## Manipulation de fichier
> 30/09/2025
### Les notions à connaître

$\rightarrow$ L'arborescence

| Notions | Description | Acquis ou non |
| --- | --- | --- |
| Fichier | Dans le dossier (pdf, txt, ipynb...) | Acquis |
| Dossier | Contient plein de fichier | Acquis |
| Arborescence | Arbre comportant dossier et fichier | Acquis |

$\rightarrow$ Les chemins

| Notions | Description | Acquis ou non |
| ----- | --- | ---- |
| / | **Racine** de l'arbe | Acquis |
| ~/ | Dossier personnel de l'user *HOME* | Acquis |
| ./ | Dossier courant *working directory* | Acquis |
| ../ | Dosseir parent | Acquis |
| Chemin absolu | Position d'un fichier partant de la **racine** (/home/pierre/PPE1) | Acquis |
| Chemin relatif | Position d'un fichier partant du dossier courant (../../dev/input/mouse3) | Acquis |

$\rightarrow$ Caractères de remplacement

| Notions | Description | Acquis ou non |
| ----- | --- | ---- |
| `?` | Remplace n'importe quel caractère | Acquis |
| `*` | Remplace n'importe quelle suite de caractère | Acquis |

### Les commandes
#### Se promener dans l'arbre
- `cd` : (*change directory*) se déplacer dans l'arborescence
- `ls` : lister le contenu d'un dossier
- `pwd` : (*print working directory*) affiche le chemin où se trouve l'user

#### Copier, déplacer, supprimer ou créer des fichier
- `mkdir` : créer un dossier
- `cp` : copier
- `mv` : (*move*) déplacer
- `rm` : (*remove*) supprimer
    - `-r` : supprime un dossier entier
- `rmdir` : (*remove directory*) supprime un dossier vide
- `touch` : crée un fichier (effet de bord bien pratique)
- `zip` : compresser une archive $\text{zip}$
    - `-r` : compresse un dossier entier
- `unzip` : décompresser une archive $\text{zip}$
- `tar` : manipuler les archives $\text{tar}$

#### Voir et manipuler le contenu des fichiers
- `file` : donne des information sur le type de fichier
- `cat` : lit le contenu d'un ou plusieurs fichiers
- `head` : lit le début d'un fichier
- `less` : lecteur (interactif)
- `wc` : permet de compter (byte, lettre, mot...)

#### Autres
- `wget` : télécharge des fichiers, des archives
- `man` : affiche la fiche manuel de la commande

La plupart des commandes ont une option `--help` qui permet d'obtenir une dercription concise du fonctionnement et des option de la commande

## Introduction sur git
> 06/10/2025
* Renomer le répertoire git (PPE1 $\rightarrow$ PPE1-2025)
* Ajout d'un journal de bord sous format markdown (journal.md)
* Utilisation des commandes git

### Commandes `git`

| Commande `git` | Description |
| --- | --- | 
| `git clone` | cloner le repo du git en ligne |
| `git add` | Ajout au suivi des changements |
| `git commit` | Commentaire de la mise à jour |
| `git push` | Synchoniser sur le git en ligne | 
|`git status` | Vérification des modifications |
| `git log` | Voir les derniers *commit* | 

$\rightarrow$ `git commit -amend -m` pour changer le dernier commit

* Analyse d'utilisation de `git tag`

### Utilisation de `tag`
- `git tag` : liste les tags existant
    - `-l` : permet de filtrer les tags
- `git tag <nom_tag>` : créer un tag
    - `-a <nom_tag> -m "Annotation"` : permet d'annoté les tags
    - `-a <nom_tag> <id_commit> -m "Annotation"` : tag sur un commit spécifique
    - `-d <nom_tag>` : supprimer un tag
        - `git push origin --delete <nom-tag>` : suppression sur le dépôt
- `git push origin --tags` : envoyer tous les tags
- `git push origin <nom_tag>` : envoyer un tag spécifique


## Commandes bash 
> 08/10/2025
### Flux d'entrées-sorties
#### Généralités
$\rightarrow$ `0 stdin` : l'entrée standard (clavier)

$\rightarrow$ `1 stdout` : la sortie standard (écran)

$\rightarrow$ `2 stderr` : la sortie d'erreurs standard (écran)

$\rightarrow$ `Ctrl + D` : fin de saisie 

#### Redirection
| Commande | Description |
| --- | --- |
| `<` | Remplace le clavier par le contenue d'un fichier |
| `>` ou `1>` | Ecrit **stdout** dans un fichier |
| `2>` | Ecrit **stderr** dans un fichier |
| `&>` | Ecrit **stdout** et **stderr** dans un fichier |
| `cmd1 \| cmd2` | la sortie standard (**stdout**) de `cmd1` est envoyée en **stdin** de `cmd2`|
| `cmd1 \|& cmd2` | les sorties **stdout** et **stderr** de `cmd1`sont toutes deux redirigées vers **stdin** de `cmd2` |

#### Autres commandes
| Commande | Description | Option |
| --- | --- | --- |
| `grep` | recherche de motifs dans l'entrée (fichiers) |  |
| `sort` | trier des lignes | `-k<n>` : sélectionne la **n** ième colonne  <br> `-r` : trie en décroissant |
| `uniq` | supprimer les lignes qui se répètent | `-c` : compte le nombre de répétition |
| `echo` | affiche un texte (pour formater les résultats) | | 
| `cut` | selectionne des colonnes d'un fichier tabulaire | `-f<n>` : n'affiche que la **n** ième colonne <br> `-d ""` : délimitation des colonnes | 
| `tail` | ne garde que les dernières lignes d'un flux ou d'un fichier | | 
| `head` | n'affiche que les 10 premières lignes | `-n<n>` : affiche les **n** premières lignes |
| `wc` | compte les caractères | `-l` : compte nbr de lignes |

### Script bash
- `#` : ajout des commentaires
- `#!/usr/bin/bash` : ajout *shebang*
- `chmod` + `x` : rend le fichier exécutable
- `VAR=$1` : input par user
    - `"$VAR"` : appel de la variable dans les programme

### Difficultés rencontrés lors du TP1
| Difficultés | Solutions | Réponse |
| --- | --- | --- |
| Doublons des Locations même après trie | Changement de place des commande | `sort \| uniq \| cut` $\rightarrow$ `cut \| sort \| uniq` | 
| Utilisation de `head` pour avoir plus ou moins de 10 lignes | Consultation du manuel via `head --help`| `head -n<nombre>` | 
| Trier selon la partie Location | Consultation du manuel via `sort --help`| `sort -k<n_ième_colonne>`| 
| Trier de manière décroissant (le plus grand nombre en premier) | Consultation du manuel | `sort -r` |
| Sélectionner une colonne spécifique pour l'afficher dans la sortie standard | Consultation du manuel | `cut -f<n_ieme_colonne>` |
| Commande similaire à `input` (Python) | Consultation des diapos du cours | `VAR=$1` |

### Instructions de contrôle
> 15/10/2025

```bash
if [ condition ] | Conditions | Description | Utilisation | 
| --- | --- | --- |
then 
    echo "La condition est valide"
else 
    echo "La condition n'est pas valide"
fi
```
$\rightarrow$ Chemins

| Conditions | Description |
| --- | --- |
| `-f fichier` | vrai si le fichier existe |
| `-d dossier` | vrai si le dossier existe |
| `-s fichier` | vrai si le fichier existe et n'est pas vide |

$\rightarrow$ Chaînes de caractères

| Conditions | Description | Utilisation | 
| --- | --- | --- |
| `=` | tester si deux chaînes sont identiques | | 
| `!=` | tester si deux chaînes sont différentes | | 
| `<` ou `>` | déterminer si une chaîne est **avant** ou **après** une autre dans l'ordre alphabétique | | 
| `-n chaine` | vrai si la chaîne n'est **pas vide** | | 
| `-z chaine` | vrai si la chaîne est **vide** (ex: argument non fourni) | | 

$\rightarrow$ Entiers

| Conditions | Description | Utilisation | 
| --- | --- | --- |
| `a -eq b` | si `a` est égal à `b` (**eq**ual) | 
| `a -ne b` | si `a` est différent de `b` (**n**ot **e**qual) | 
| `a -lt b` | si `a` est plus petit que `b` (**l**ess **t**han) | 
| `a -gt b` | si `a` est plus grand que `b` (**g**reater **t**han) | 
| `a -le b` | si `a` est inférieur ou égal à `b` | 
| `a -ge b` | si `a` est supérieur ou égal à `b` |
| `[[ ]]` | permet d'utiliser des expressiions régulières | `[[ $1 =~ bon(jou|soir) ]]` |


<div style="border: 4px solid red; padding: 8px;">
<strong>⚠️ ATTENTION :</strong> Vérifier que toutes les conditions sont réunis pour que le traitement se passe bien avant de lancer le programme.
</div>

### Les boucles
#### Boucle FOR

```bash
N=0
for ELEMENT in a b c d e
do
    N=$(expr $N + 1)
    echo "Le $N ieme élément est $ELEMENT"
done
```

- `expr` : commande calculatrice
- Une commande pour générer la liste d'élements $\rightarrow$ Test

#### Boucle WHILE

```bash
while [ condition ];
do
    echo "Je continue à boucler";
done
```

- Même condition que **IF**
- `read` : souvent utilisé avec 
- Attention au boucle infinie ! (CTRL-C = arrêt brutal)

$\rightarrow$ Analyse de l'exemple du cours

### Exemple complet en bash
```bash
#!/usr/bin/bash

if [ $# -ne 1 ]
then
    echo "Ce programme demande un argument"
        exit
fi

FICHIER_URLS=$1
OK=0
NOK=0

while read -r LINE ;
do
    echo "La ligne : $LINE"
    if [[ $LINE =~ ^https?:// ]]
    then
        echo "ressemble à une URL valide"
        OK=$(expr $OK + 1)
    else
        echo "Ne ressemble pas à une URL valide"
        NOK=$(expr $NOK + 1)
    fi
done < $FICHIER_URLS

echo "$OK URLs et $NOK lignes douteuses"
```

- `if` si :
    - `$#` : nombre d'argument donné par l'usr
    - `-ne 1` : n'est pas égal à 1
    - Alors : 
        - `echo` : affiche la phrase dans la sortie standart
        - `exit` : arrête le programme
- `FICHIER_URLS` prend le premier argument que l'usr donne
- `OK` et `NOK` sont des entiers
- `while` quand :
    - `read -r` : lit la ligne d'entrée sans prendre en considération les `\` comme caractère spécial
    - `echo` : affiche ce qui est stocké dans la variable `$LINE`
    - `if` si :
        - `$LINE` contient une expression commençant par `https`(avec ou sans -s)`://`
        - Alors :
            - `echo` : affiche la phrase
            - change la variable `OK` $\rightarrow$ (`expr`) calcul `$OK + 1` (= 0+1)
        - Sinon : 
            - affiche la phrase
            - change la variable `NOK` en calculant `NOK + 1`
    - `done < $FICHIER_URLS` : redonne ce qui est dans la variable dans la boucle
- `echo` : affiche (nbr dans) `$OK` URLs et (nbr dans) `$NOK` lignes douteuses

### Difficultés ou application TP1 (suite)
> 16/10/2025 
>
> Exercice 3 : Tests et validation des arguments

* `read` : lire ce que l'usr écrit
    * `-r` : n'interprète pas les backslash (\\)
    * `-p` : demande une saisie à l'usr
        * `read -rp "Argument" <VARIABLE>`
* `if [ "$REP" = "O" ]` un test selon la réponse donnée par l'usr
    * Deux cas possible : 
        1. **usr est dans le bon chemin** : le script et les fichiers a traité ensemble, alors pas besoin d'utiliser la variable `DATADIR`
        2. usr n'est pas au bonne endroit : demande à l'usr de donner les éléments manquant pour ne pas avoir à sortir du script et le relancer
* sinon lance le script normalement

> Explication du script `comptes.sh`
* Une variable qui contient le chemin absolu de là où s'exécute le script (`$DIRECT`)
* Une variable qui garde la première année, elle sera itéré plus tard
* (**WHILE**) quand l'année est plus petit ou égal à 2018
    * (**IF**) Utilisation de `if [ -e "$DIRECT" ]` : permettant de chercher si les fichiers ou dossiers existent bien à cet emplacement ($DIRECT)
        * Affiche la phrase avec `$COUNT` qui change pour chaque année
        * `cat` : affiche tous les fichiers terminant par `.ann` aux emplacements demandés
        * `grep` : cherche tous les motifs "Location"
        * `wc -l` : compte et n'affiche seulement les nombres de lignes 
    * (**ELSE**) sinon : affiche la phrase et arrête le script
    * (en fin **WHILE**) : ajoute 1 à la variable `$COUNT` (2016 $\rightarrow$ 2017)

## Web : HTML, HTPP, récupérer des pages
> 24/10/2025

**HTML** (**H**yper**T**ext **M**arkup **L**anguage) est un langage de balisage pour représenter des pages web.
- structure l'information
- enrichie le texte
- donne des indications pour interagir avec l'utilisateur

```html
<html>
    <head>
        <title>Vous Etes Perdu ?</title>
    </head>
        <body>
            <h1>Perdu sur l’Internet ?</h1>
            <h2>Pas de panique, on va vous aider</h2>
            <strong><pre> * <—– vous &ecirc;tes ici</pre></strong>
    </body>
 </html>
```

Utilisation PPE : 
* retirer tout le métatexte de pages web pour en extraire le contenu textuel
* analyser ce contenu textuel pour en déduire un usage (linguistique de corpus)
* créer nos propres pages web pour présenter les procédés et résultats

**HTTP** (**H**yper**T**ext **T**ransfer **P**rotocol) est un protocole créé pour communiquer sur le WWW.

Code de statut : 
* 1xx : information
* 200 : réussite
* 3xx : redirection
* 4xx : erreurs du client
* 5xx : erreurs du serveur

### Lynx : navigateur web en terminal

1. Récupérer le contenu textuel d'une page pour l'afficher (sans navigation)

> `-dump`

2. Retirer la liste des liens d'une page à l'affichage

> `-nolist`

### wget et cURL

`wget` et `cURL` sont deux commandes qui permettent de récupérer des pages web sans passer par un navigateur
- `wget` écrit dans un fichier
- `cURL` écrit dans le terminal

| Option `curl` | Détails d'utilisation |
| --- | --- | 
| `-i` | Donne les informations sur l'interaction avec le serveur |
| `-L` | suit les redirections |
| `-o <fichier>` | indique un `<fichier>` de sortie |
| `-I` | équivalent à l'option `head`|
| `-s` | Met sous silence |
| `-w` | Affiche les informations sur la sortie standard après un transfert |

## Mini-projet 1 : difficultés et applications

### Lire les lignes d'un fichier en bash

#### Exercice 1 

1. Pourquoi ne pas utiliser `cat` ?
2. Comment transformer `"urls/fr.txt"` en paramètre du script ?
    1. Valider l'argument : ajouter le code si nécessaire pour s'assurer qu'on donne bien un argument au script, sinon on s'arrête
3. Comment afficher le numéro de ligne avant chaque URL (sur la même ligne) ? (Bien séparer par des tabulations)

#### Application

1. `cat` permet d'afficher le contenu d'un fichier (déjà existant), alors que `echo` permet d'afficher du texte

| Commandes | Options | Explications |
| --- | --- | --- | 
| `URL=$#` | | Garde dans la variable l'argument que l'usr donne |
| `if [ -n "$URL" ]` | `-n` | Teste si `$URL` n'est pas vide |
| `COUNT=0` <br> $\rightarrow$ `COUNT=$(expr "$COUNT" + 1)` | | Variable qui compte les lignes (utiliser avec la boucle `while`) <br> A chaque entrée de la boucle, compte +1 à `$COUNT` |
| `echo` | `-e "\t"` | Affichage qui comprend une séparation par tabulation |  


### Récuperer les métadonnées de collecte

#### Exercice 2

Ajout d'informations à chaque ligne, séparées par des tabulations : 
1. Le code HTTP de réponse de la requête
    1. Les erreurs peuvent être corrigées
2. L'encodage de la page si elle est présente
3. Le nombre de mot de la page

#### Application 

| Commandes | Options | Explications |
| --- | --- | --- |
| `REHTTP` ||
| `curl` | `-s` <br> `-o /dev/null` <br> `-w "%{http_code}"` | Mets sous silence la barre de progression et les messages d'erreur <br> Ignore le contenue et le place dans le trou noir du système <br> Affiche seulement le code HTTP final | 
| `ENCODAGE` |||
| `cut` | `-d "="` | L'encodage de la page étant présenté sous cette forme : *meta-charset=UTF-8*, la délimitation par *=* permet de collecter seulement le nom de l'encodage (ce qui est intéressant) |
| `WORD`| | | 
|`lynx` | `-dump` | Affiche le contenu de l'URL avec sa mise en page dans la sortie standard | 
| `wc` | `-w` | Compte tous les mots |
| `>>` || Envoie le contenu dans le fichier sans écrases son contenu initial |


#### Difficultés 

- Amélioration pour un moyen plus propre et plus efficace d'afficher le code HTTP
> `curl -si ${line} | grep "HTTP" | cut -d " " -f2` $\rightarrow$ `curl -s -o /dev/null -w %{http_code}` : recherche dans le manuel de ***curl*** et internet.
- Dans `curl -i`, l'encodage se trouve dans la partie ***content_type*** : utilisation de `-w {content_type}` pour une recherche plus rapide de l'ordinateur. 
> `curl ${line} | grep meta-charset` $\rightarrow$ `curl -s -o /dev/null -w "%{content_type}" "${line}" | cut -d '=' -f2`


### Amélioration du script

| Commandes | Options | Explications |
| --- | --- | --- | 
| `$OUTPUT` | | Variable qui contient le chemin de sortie des résultats de l'exercie (pour ne pas écrire trop de fois le chemin complet) | 
| `echo` | `-e` ... `> $OUTPUT` | Interprète les séquences avec backslash (\n, \t...) <br> Range le résultat dans `$OUTPUT` en écrasant à chaque fois | 
| `sleep` | | Le programme fait une pause (compte en seconde) <br> Contourne l'erreur 429 (trop de requête sans pause) |

## HTML : Faire un tableau
> Cours du 05/11/2025
>
> 08/11/2025

```html
<html>
    <head>
        [...]
        <meta charset="UTF-8"/> <!-- Annonce l'encodage de la page -->
        [...]
    </head>
    <body>
        <h1>Titre</1>
        <p>Texte brut</p>

        <table> <!-- début d'un tableau -->
            <tr><!-- Un ligne dans le tableau -->
                <th>Une cellule d'entête</th>
                <th> Une deuxième cellule d'entête</th>
            </tr>
            <tr><td>Une cellule classique</td>
                <td>Une autre cellule classique</td>
            </tr>
        </table> <!-- On ferme le tableau -->
    </body>
</html>
```
Documentation HTML
-
* <a href="https://www.w3schools.com/html/html_head.asp">Documentation d'entête HTML</a>
* <a href="https://www.w3schools.com/html/html_charset.asp">Documentation charset HTML</a>

## Mini-projet 2 : Transformer le fichier TSV en HTML

### Changement apporté au programme pour transformer le fichier TSV en HTML

- `$OUTFILE` : changer le format du fichier de sauvegarde `.tsv` $\rightarrow$ `.html`
- Ajout des balises html dans le fichier de sortie avec `echo -e` pour avoir les tabulations (`\t`) et saut de ligne (`\n`)
    - Les premières lignes de balises du fichier (commencement) sont sauvegardé en écrasant ce qu'il y a avant $\rightarrow$ pas de répétition au lancement du programme à plusieurs reprise
- Un titre avant le tableau avec `<h1>...</h1>`
- Ajoute des balises `<table>` pour avoir la structure du tableau
- Entête du tableau avec `<tr><th>...</th></tr>`
- Remplir les cellules de chaque ligne dans la boucle while après collecte des toutes les données nécessaires (ligne 55)
- Fin de boucle, ajout des balises html fermantes

### Problèmes rencontrés et améliorations
- Affichage des variables incorrect : utilisation obligatoire des `""` et non `''`.
- Un meilleur visuel du tableau : 
    - ajout de la fonction `border=1` dans la balise `table`

## Miniprojet : pages-github (HTML et CSS)
> 13/11/2025
Transformer un dépôt git en site avec un fichier `.html`
- Mettre un fichier `index.html` dans la racine du dépôt
- Aller dans <button style="background-color:lightblue ; border-radius:8px">Settings</button> $\rightarrow$ <button style="background-color:lightblue ; border-radius: 8px">Pages</button>
    - <i>Builds And Deployment</i>
        - Source $\rightarrow$ <button style="border-radius: 8px ; background-color:lightgrey">Deploy from a branch</button>
        - Branch $\rightarrow$ <button style="border-radius: 8px ; background-color:lightgrey">main</button>
Adresse du site : https://nomutilisateur.github.io/nomdepot

### Miniprojet : HTML, CSS et Bulma
#### HTML

```html
 <!DOCTYPE html>
 <html lang="fr">
    <head>
        <meta charset="UTF-8"/>
        <title>Présentation</title>
    </head>
    <body>
        <section class="section has-text-centered">
            <h1 class="title is-1">Miniprojet</h1>
            <div class="block">
                <p>Le miniprojet consiste à extraire depuis un texte brut des liens URLs</p>
            </div>
            <button>
                <a class="button is-dark" href="miniprojet/tableaux/tableau-fr.html">Tableau</a></li>
            </button>
        </section>
    </body>
 </html>
```

<table style="border-radius:8px ; backgroud-color:blue">
    <tr style="background-color:lightgrey">
        <td>Ligne avec <code>tr</code></td><td>Colonne avec <code>td</code></td>
    </Tr>
    <tr>
        <td>Un style avec <code>style</code></td><td>Du code avec <code>code</code></td>
    </Tr>
</table>

**Différence : `section` et `div`**

`section` 
- section thématique avec du sens 
- une partie du contenue qui a un thème, une idée complète
- a un titre 

`div`
- conteneur neutre, purement structurel
- est utilisé pour grouper ou styliser des éléments sans sémantique



#### CSS
3 Méthodes d'utilisation : 
1. Directement dans les balises html : `<nomBalise style="CodeCSS : Commande">`

| Code | Affichage | Explication | 
| --- | --- | --- |
| `<span style="color:red">Bonjour</span>` | <span style="color:red">Bonjour</span> | Couleur du texte |
| `<... style="background-color:lightgrey>"` | <span style="background-color:lightgrey">Bonjour</span> | Couleur de fond |
| `<button style="border-radius:8px">Clique</button>` | <button style="border-radius:8px">Clique</button> | Arrondi les coins |
| `<... style="cursor:pointer">` | <button style="cursor:pointer">Clique</button> | Change le curseur en pointeur dans la zone |

2. Ajout d'une page CSS
```html
<!-- HTML page -->
<head>
    <link hel="sheetstyles" href="asset/css/style.css"/>
</head>
```
```css
/* CSS page */
a.accueil {
    border: 5;
    font-size: 16;
    border-radius: 10px;
    color: aliceblue;
    background-color: darkblue;
    left: auto;
    margin-right: 25;
}
```

| Code | Affichage | Explication | 
| --- | --- | --- | 
| `max-width : 800px` | | Largeur maximale ne dépasse pas 800 pixel |
| `border:5px` | <button style="border:15px groove aliceblue">Exemple</button> | Le contour du button a un effet 3D creusé de 15 pixel | 
| `border-radius:10px` | <button style="border-radius:10px">Exemple</button> |
| `font-size:16px` | <button style="font-size:16px">Exemple</button> | La taille de police grandi entièrement à 16 pixel |
| `color : aliceblue` | <button style="color:red">Exemple</button> | Couleur du texte |
| `background-color: yellow"` | <button style="background-color:yellow">Exemple</button> | Couleur de fond | 
| `margin-right: 25px` | <button style="margin-right:2px">Exemple</button> d | L'espacement externe droite prend 25 pixel |
| `cursor: not-allowed` | <button style="cursor:not-allowed">Exemple</button> | Le curseur prend l'icone d'inaccessible |
| `padding : auto` | <button style="padding:auto">Exemple</button> | Les spacements internes sont automatiques |
| ` xxx:hover { background : royalblue }` | <style> button.yo:hover {background : royalblue; }</style> <button class="yo">Exemple</button> | Change la couleur de fond sous le curseur | 


3. Utilisation d'un framework 
> <a href="https://bulma.io/documentation/">Documentation Bulma</a>

<div style="border: 4px solid red; padding: 8px;">
<strong>⚠️ ATTENTION :</strong> L'implantation de Bulma n'a pas de <code>\</code> en fin de balise
<p> <code><</code><code>link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/versions/bulma-no-dark-mode.min.css"></code></p>
Cependant l'implantation pour notre feuille CSS, il y a besoin de <code>\</code> en fin de balise 
<p><code><</code><code>link rel="stylesheet" href="../../assets/css/style.css"/></code></p>
</div>
<br>

```html
<!-- HTML page : Bulma -->
<head>
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/versions/bulma-no-dark-mode.min.css">
</head>
```
```html
    <body>
        <section class="section has-text-centered">
            <h1 class="title is-1">Miniprojet</h1>
            <div class="block">
                <p>Le miniprojet consiste à extraire depuis un texte brut des liens URLs</p>
            </div>
            <button>
                <a class="button is-dark" href="miniprojet/tableaux/tableau-fr.html">Tableau</a></li>
            </button>
        </section>
    </body>
```

| Code | Explication | 
| --- | --- |
| `class="button"` | Prend les caractères d'un `<button>` |
| `class="section"` | Forme des sections (paragraphes) |
| `class=has-text-centered"` | Centralise le texte |
| `class="title is-1` | Prend la police Titre de niveau 1 |
| `class="block"` | Crée un block (paragraphe) |
|  `class="is-dark` | La couleur du fond devient noir et la police blanche |
| `class="table` <br> `is-hoverable` <br> `is-striped"` | Un tableau mieux formaté <br> La ligne sous la sourie est grisée <br> Tous les deux lignes, la ligne est grisée |
