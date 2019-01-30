#!/bin/bash

echo "Si vous souhaitez rentrer un chiffre manuellement taper - 1 -"
echo "Si vous souhaitez qu'un chiffre soit donné automatiquement taper - 2 - (entrer) :"
read  choix

if [ $choix == 1 ];
then

read -p 'saisissez un chiffre (uniquement des entiers - max 8 caractères) :' chiffre_arabe

test=faux
while [ $test == faux ];
do
	if [[ ${#chiffre_arabe} -gt 8 ]];
	then
		test=faux
		echo "votre saisie comporte trop de caratères"
		read -p 'saisissez un chiffre (max 8 digits) :' chiffre_arabe
	elif [[ "$chiffre_arabe" != +([0-9]) ]];
	then
		test=faux
		echo "votre saisie comporte des caractères non autorisés"
		read -p 'saisissez un chiffre avec des entiers :' chiffre_arabe
	
	else 
	
		test=vrai
	fi

done

elif [ $choix == 2 ]
then

lg_chiffre_arabe="${1:-8}"
chiffre_arabe=""

#Liste des caractères autorisés pour le chiffre arabe automatique.
caracteres="0123456789"

#Nombre de caracteres dans la liste de ceux autorises.
nb_caracteres=${#caracteres}

i=1

while [ $i -le "$lg_chiffre_arabe" ]
do
        #tirer une valeur aleatoire entre 1 et le nombre de caracteres dans la liste autorisee.
        n=$((1 + ${RANDOM} % ${nb_caracteres}))

        #Ajouter dans la variable chiffre arabe le n-ieme caractere.
        chiffre_arabe="${chiffre_arabe}${caracteres:$n:1}"

        i=$((i + 1))
done

echo "le chiffre arabe selectionné automatiquement est : $chiffre_arabe" 

fi

#initialisation des variables
chiffre_romain=""
chiffre_tampon=0
 

#Boucle itérative pour traiter les miliers

while [ $chiffre_arabe -ge 1000 ];
do
	chiffre_arabe=$((chiffre_arabe-=1000))
	chiffre_romain=$chiffre_romain"M"
done


#Boucle iterative pour traiter les centaines
#Décrementation de la variable chiffre_arabe et incrémentation de la variable chiffre tampon

while [ $chiffre_arabe -ge 100 ];
do
	chiffre_arabe=$((chiffre_arabe-=100))
	chiffre_tampon=$((chiffre_tampon+=100))
done

#Traitement de la variable chiffre tampon pour transcription en chiffre romain

case $chiffre_tampon in
	900) chiffre_romain=$chiffre_romain"CM" ;;
	800) chiffre_romain=$chiffre_romain"DCCC" ;;
	700) chiffre_romain=$chiffre_romain"DCC" ;;
	600) chiffre_romain=$chiffre_romain"DC" ;;
	500) chiffre_romain=$chiffre_romain"D" ;;
	400) chiffre_romain=$chiffre_romain"CD" ;;
	300) chiffre_romain=$chiffre_romain"CCC" ;;
	200) chiffre_romain=$chiffre_romain"CC" ;;
	100) chiffre_romain=$chiffre_romain"C" ;;
esac

#Boucle iterative pour traiter les dizaines
#Décrementation de la variable chiffre_arabe et incrémentation de la variable chiffre tampon
#Initialisation de la variable tampon à 0
	chiffre_tampon=0

while [ $chiffre_arabe -ge 10 ];
do
	chiffre_arabe=$((chiffre_arabe-=10))
	chiffre_tampon=$((chiffre_tampon+=10))
done

#Traitement de la variable chiffre tampon pour transcription en chiffre romain

case $chiffre_tampon in
	90) chiffre_romain=$chiffre_romain"XC" ;;
	80) chiffre_romain=$chiffre_romain"LXXX" ;;
	70) chiffre_romain=$chiffre_romain"LXX" ;;
	60) chiffre_romain=$chiffre_romain"LX" ;;
	50) chiffre_romain=$chiffre_romain"L" ;;
	40) chiffre_romain=$chiffre_romain"XL" ;;
	30) chiffre_romain=$chiffre_romain"XXX" ;;
	20) chiffre_romain=$chiffre_romain"XX" ;;
	10) chiffre_romain=$chiffre_romain"X" ;;
esac

#Boucle iterative pour traiter les nombres
#Décrementation de la variable chiffre_arabe et incrémentation de la variable chiffre tampon
#Initialisation de la variable tampon à 0

	chiffre_tampon=0

while [ $chiffre_arabe -ge 1 ];
do
	chiffre_arabe=$((chiffre_arabe-=1))
	chiffre_tampon=$((chiffre_tampon+=1))
done

#Traitement de la variable chiffre tampon pour transcription en chiffre romain

case $chiffre_tampon in
	9) chiffre_romain=$chiffre_romain"IX" ;;
	8) chiffre_romain=$chiffre_romain"VIII" ;;
	7) chiffre_romain=$chiffre_romain"VII" ;;
	6) chiffre_romain=$chiffre_romain"VI" ;;
	5) chiffre_romain=$chiffre_romain"V" ;;
	4) chiffre_romain=$chiffre_romain"IV" ;;
	3) chiffre_romain=$chiffre_romain"III" ;;
	2) chiffre_romain=$chiffre_romain"II" ;;
	1) chiffre_romain=$chiffre_romain"I" ;;
esac

#Affichage du resultat
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
echo	le chiffre romain est : $chiffre_romain
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#

#
echo "voulez vous relancer le script ? (taper o pour oui - n pour non + entrer)"
read choix

if [ $choix == o ];
then
	./chiffre_romain.sh
elif [ $choix == n ];
then
	echo "merci et à bientôt"

fi
