lien de la video explicative : https://youtu.be/TODH3Fd9YsA



# GestParc - Scripts de gestion réseau

Ce dépôt contient plusieurs scripts Bash permettant la gestion et la vérification d'équipements réseau. Ces outils sont conçus pour faciliter l'administration d'un parc informatique en automatisant certaines tâches courantes.

## ⚜️ Fonctionnalités principales

1. **Test d'une adresse IP** : Vérifie si une adresse IP est valide et teste sa connectivité via `ping`.
2. **Affichage des équipements réseau** : Affiche les données stockées dans une base MySQL concernant les équipements.
3. **Ajout d'équipements réseau** : Ajoute de nouveaux équipements avec vérification des formats (MAC, IP, CIDR) et insertion en base de données.
4. **Test d'un port réseau** : Vérifie si un port est valide et teste sa connectivité avec `nc` (netcat).

---

## 🖥️ 1. Test d'une adresse IP

### ⚜️ Description
Ce script permet de tester la validité d’une adresse IP fournie par l’utilisateur. Une fois la vérification effectuée, il teste la connectivité de l’IP en effectuant un `ping`.

### 📜 Exécution
```bash
./test_ip.sh
```

### ⚜️ Fonctionnement
- Demande une adresse IP à l'utilisateur.
- Vérifie si elle est conforme au format IPv4 en utilisant une expression régulière (REGEX).
- Si l’adresse est valide, effectue un `ping -c 4` pour tester la connectivité.
- Affiche le résultat du test.

---

## 🖥️ 2. Affichage des équipements réseau

### ⚜️ Description
Ce script interagit avec une base de données MySQL pour afficher les équipements réseau enregistrés. Il permet d’avoir une vue d’ensemble des ressources disponibles.

### 📜 Exécution
```bash
./affichage_equipements.sh
```

### ⚜️ Fonctionnement
- Se connecte à la base de données MySQL.
- Récupère et affiche la liste des tables présentes.
- Affiche le contenu de chaque table sous forme de tableau structuré.
- Utilise `figlet` et `lolcat` pour améliorer l'affichage.

---

## 🖥️ 3. Ajout d'un équipement réseau

### ⚜️ Description
Ce script permet d’ajouter un équipement dans la base de données après validation des informations saisies par l’utilisateur.

### 📜 Exécution
```bash
./ajout_equipement.sh
```

### ⚜️ Fonctionnement
- Demande à l’utilisateur d’entrer les informations suivantes :
  - **Nom** de l’équipement
  - **Adresse MAC** (validée via REGEX)
  - **Adresse IP** (validée via REGEX)
  - **Masque CIDR** (validé via REGEX)
- Affiche la liste des types d’équipements disponibles en base de données.
- Insère les informations validées dans la base MySQL.
- Confirme l’ajout réussi avec un affichage stylisé.

---

## 🖥️ 4. Test d'un port réseau

### ⚜️ Description
Ce script permet de vérifier si un port donné est ouvert sur une adresse IP cible, utile pour tester l’accessibilité des services réseau.

### 📜 Exécution
```bash
./test_port.sh
```

### ⚜️ Fonctionnement
- Demande à l’utilisateur une **adresse IP** et vérifie sa validité.
- Demande un **numéro de port** et s'assure qu’il est compris entre `1` et `65535`.
- Effectue un test de connexion avec `nc -vz` (netcat) pour vérifier si le port est ouvert.
- Affiche le résultat du test.

---

## ⚜️ Prérequis
Pour exécuter ces scripts, vous devez avoir les outils suivants installés sur votre machine :

- **Linux / Unix** (testé sous Ubuntu/Debian)
- `figlet` et `lolcat` pour l'affichage stylisé :
  ```bash
  sudo apt install figlet lolcat
  ```
- `netcat` pour le test des ports :
  ```bash
  sudo apt install netcat
  ```
- `mysql-client` pour interagir avec la base de données :
  ```bash
  sudo apt install mysql-client
  ```
- Une base de données MySQL avec les tables appropriées.

## ⚜️ Installation et utilisation
1. Clonez ce dépôt :
   ```bash
   git clone https://github.com/votre-repo/gestparc.git
   cd gestparc
   ```
2. Assurez-vous que les scripts ont les droits d'exécution :
   ```bash
   chmod +x *.sh
   ```
3. Exécutez le script souhaité :
   ```bash
   ./ajout_equipement.sh
   ```
