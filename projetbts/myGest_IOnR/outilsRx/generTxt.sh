
USER="sio"
PASSWORD="btsinfo"
DB="MyGest"

fichier_de_sortie="liste_ip.txt"

echo "Vérification de la connexion à la base de données MySQL..." | lolcat
sleep 1
mysql -u $USER -p$PASSWORD -e "exit" &>/dev/null

if [ $? -ne 0 ]; then
    echo "Échec de la connexion à la base de données. Vérifiez vos identifiants."
    exit 1
fi

echo "Récupération des adresses IP des équipements..." | lolcat
sleep 1
mysql -u $USER -p$PASSWORD -D $DB -se "SELECT adIP FROM Equipement;" > $fichier_de_sortie

if [[ -s $fichier_de_sortie ]]; then
    echo "Le fichier $fichier_de_sortie a bien été généré avec les adresses IP." | lolcat
else
    echo "Aucune adresse IP trouvée dans la base de données ou le fichier n'a pas pu être créé."
fi



