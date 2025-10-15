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
