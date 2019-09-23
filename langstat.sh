#!/bin/bash

#On déclare deux tableau
declare -A tab
declare -a tabl


#s'il existe un deuxième paramètre
if [ -z "$2" ]
then
	#s'il n'existe pas un premier paramètre
	if [ -z "$1" ]; 
	then 
		echo "Il n'existe pas de paramètres pour prendre en charge le dictionnaire" 
	#si le fichier n'est pas présent
	elif [ ! -e $1 ]
	then
		echo "Le fichier dictionnaire n'existe pas a l'emplacement indiqué"
	else
		for letter in {A..Z};
		do
			tab[${#tab[$letter]}]=`grep -c $letter $1`
			echo $tab - $letter >> tosort.txt	
		done

		cat tosort.txt | sort -nr

		rm tosort.txt
	fi
else
	#On installe le programme cowsay (aucune incidence sur l'ordinateur bien sûr
	sudo apt-get install cowsay
	#On lance la commande suivante dans le programme installé
	cowsay -f ghostbusters Who you Gonna Call
	#On désinstalle le programme et ses dépendances
	sudo apt-get autoremove cowsay
fi
