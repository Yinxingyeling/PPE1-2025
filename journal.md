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
| `s` |  |
| `w` ||

## Mini-projet 1 : difficultés et applications
