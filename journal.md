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
| ? | Remplace n'importe quel caractère | Acquis |
| * | Remplace n'importe quelle suite de caractère | Acquis |

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
- `rmdir` : (*makde directory*) créer un dossier
- `touch` : crée un fichier (effet de bord bien pratique)
- `zip` : compresser une archive $\text{zip}$
- `unzip` : décompresser une archive $\text{zip}$
- `tar` : manipuler les archives $\text{tar}$

#### Voir et manipuler le contenu des fichiers
- `file` : donne des information sur le type de fichier
- `cat` : lit le contenu d'un ou plusieurs fichiers
- `head` : lit le début d'un fichier
- `tail` : lit la fin d'un fichier
- `cut` : sélectionne une ou plusieurs colonnes dans un fichier tabulé
- `less` : lecteur (interactif)
- `echo` : affiche dans la sortie du terminal
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
