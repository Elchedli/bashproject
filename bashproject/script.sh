if [ $1 = "-ltop" ]; then
   top
elif [ $1 = "-lps" ]; then
   ps -aux
elif [ $1 = "-root" ]; then
   ps -U root -u root u
elif [ $1 = "-mcpu" ]; then
   echo "nom       processeur    id"   
   ps -eo comm,pcpu,pid | tail -n +2 | sort -rnk 2 | head -5
elif [ $1 = "-h" ] ||  [ $1 = "-help" ]; then
   echo "pour vous aider a utilier le programme voici les commandes:"
   echo "   -ltop : montre une version dynamique des processus active dans le systeme."
   echo "   -lps : affiche une version statique(copie) de tous les processus du systeme."
   echo "   -root : affiche une version statique des processus avec l'utilisation du 'root'."
   echo "   -mcpu : affiche les 5 processus les plus gourmandes niveau CPU."
elif [ $1 = "-plot" ] ||  [ $1 = "-gnuplot" ]; then
   > data.dat
   ps -eo comm,pcpu | tail -n +2 | sort -rnk 2 | head -5 >> data.dat
   gnuplot -p "script"
fi
