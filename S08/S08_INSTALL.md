==============================

# P3-G1 BILLU

==============================

# Mise en place d'un serveur de gestion des mises à jour **WSUS**

## Pré requis de la machine 
- Une Vm avec le role  gestionnaire serveur 
- Nom de la machine : `Thanos`
- Adresse IP : `172.18.255.6`
- DNS : `172.18.255.1`
- Domaine : `billu.com`



## Installation du Role  **WSUS** sur la machine

## Étape 1 : Préparer le Serveur
1. Assurez-vous que le serveur est à jour et intégré au domaine `Billu.com`.
   
2. Créez une partition dédiée pour stocker les mises à jour (par exemple, `D:\WSUS`).

## Étape 2 : Installer le Rôle WSUS
1. Ouvrez le **Gestionnaire de serveur**.
2. Cliquez sur **Gérer** puis **Ajouter des rôles et fonctionnalités**.
3. Suivez l'assistant jusqu'à l'étape **Sélection des rôles de serveur**.
4. Sélectionnez **Windows Server Update Services** **WSUS**
 <P ALIGN="center"><IMG src="..\Ressources/Annexes_S08/Annexes_08/Capture d'ecran Serveur WSUS_2.png" width=500></P>
 
 5. Ajoutez les fonctionnalités nécessaires et  Suivez les instructions pour terminer l'installation
 
 <P ALIGN="center"><IMG src="..\Ressources/Annexes_S08/Annexes_08/Capture d'ecran Serveur WSUS_1.png" width=500></P>

## Étape 3 Configuration du serveur WSUS 

1. Une fois que vous êtes sur l'interface de WSUS, sélectionnez la langue souhaitée, puis cliquez sur "Suivant".
2. On clique sur start connecting
3. On poursuit avec le choix de langue pour faire les mises à jour
   <P ALIGN="center"><IMG src="..\Ressources/Annexes_S08/Annexes_08/Capture d'ecran Serveur WSUS_4.png" width=500></P>
5. Sélectionnez les produits pour lesquels il est nécessaire de récupérer les mises à jour.
6. nous sélectionnons le type de mise à jour que nous souhaitons opter pour.
7. on choisi qu'elle frequance  selon le besoin et on clique sur finish pour terminer l'installation et tous se passe bien on doit arriver sur la console de serveur WSUS 

<P ALIGN="center"><IMG src="..\Ressources/Annexes_S08/Annexes_08/Capture d'écran Serveur WSUS_8.png" width=500></P>

# Installation d'un serveur web Apache2 sur une machine Linux

## Préambule
Ce guide décrit les étapes pour installer un serveur web Apache2 sur une machine virtuelle Linux gérée par Proxmox. La machine virtuelle est configurée dans une DMZ avec l'adresse IP 172.20.0.1. Ce serveur web est destiné à la société **Billu.com**.

---

## Étapes

### 1. Connexion à la VM

Connectez-vous à votre machine virtuelle via SSH ou via la console Proxmox :

```bash
ssh user@172.20.0.1
```

### 2. Mise à jour des dépôts et du système

Avant d'installer Apache2, mettez à jour la liste des paquets et les paquets existants :

```bash
sudo apt update && sudo apt upgrade -y
```

### 3. Installation d'Apache2

Installez le serveur web Apache2 avec la commande suivante :

```bash
sudo apt install apache2 -y
```

### 4. Configuration de la DMZ et du pare-feu

Vérifiez que la machine est bien dans la DMZ et configurez le pare-feu pour autoriser le trafic HTTP et HTTPS.

#### a. Configuration d'UFW (si utilisé) :

```bash
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw reload
```

#### b. Vérification de l'état réseau :

Assurez-vous que l'interface réseau est correctement configurée avec l'adresse IP 172.20.0.1.

```bash
ip addr show
```

### 5. Vérification du fonctionnement d'Apache2

Après l'installation, Apache2 démarre automatiquement. Vérifiez son état :

```bash
sudo systemctl status apache2
```

Si le service n'est pas actif, démarrez-le :

```bash
sudo systemctl start apache2
```

### 6. Test d'Apache2

Pour vérifier que le serveur web fonctionne :

1. Ouvrez un navigateur web.
2. Saisissez l'adresse suivante dans la barre d'adresse :

```
http://172.20.0.1
```

Vous devriez voir la page par défaut d'Apache2 indiquant que le serveur fonctionne.

---

## Configuration avancée

### 1. Création d'un site pour Billu.com

Créez un fichier de configuration pour le site **billu.com** :

```bash
sudo nano /etc/apache2/sites-available/billu.com.conf
```

Ajoutez le contenu suivant :

```apache
<VirtualHost *:80>
    ServerName billu.com
    ServerAlias www.billu.com
    DocumentRoot /var/www/billu.com

    <Directory /var/www/billu.com>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/billu.com_error.log
    CustomLog ${APACHE_LOG_DIR}/billu.com_access.log combined
</VirtualHost>
```

Enregistrez et quittez (CTRL+O, puis CTRL+X).

### 2. Activation du site et redémarrage d'Apache

```bash
sudo a2ensite billu.com.conf
sudo systemctl reload apache2
```

### 3. Ajout des fichiers du site

Créez le répertoire pour **billu.com** et ajoutez un fichier index.html :

```bash
sudo mkdir -p /var/www/billu.com
sudo nano /var/www/billu.com/index.html
```

Ajoutez un contenu simple :

```html
<!DOCTYPE html>
<html>
<head>
    <title>Bienvenue sur Billu.com</title>
</head>
<body>
    <h1>Bienvenue sur le site de Billu.com</h1>
</body>
</html>
```

Enregistrez et quittez.

Assurez-vous que les permissions sont correctes :

```bash
sudo chown -R www-data:www-data /var/www/billu.com
sudo chmod -R 755 /var/www/billu.com
```

---

### 4. Test du site

Dans un navigateur, testez l'accès au site :

```
http://172.20.0.1
```

Ou, si le DNS est configuré :

```
http://billu.com
```

---

## Conclusion
Vous avez maintenant configuré un serveur web Apache2 fonctionnel dans une DMZ avec l'adresse IP 172.20.0.1 pour la société **Billu.com**. Vous pouvez maintenant personnaliser davantage le serveur selon vos besoins.



# Installation et Configuration d'un VPN Site-à-Site avec pfSense et IPsec

Ce guide décrit la configuration d'un VPN IPsec site-à-site entre deux réseaux locaux à travers pfSense.

## 1 - Objectif
L'objectif est d'établir un tunnel VPN sécurisé entre :
- **Société Billu.com** (LAN : `172.18.0.0/16`, WAN : `10.0.0.2/29`)
- **Société EchoTech-Solutions.lan** (LAN : `10.10.0.0/16`, WAN : `10.0.0.3/29`)

Une fois configuré, les machines des deux réseaux doivent pouvoir communiquer via ping et autres protocoles.

---

## 2 - Configuration de pfSense (Site Billu.com)

### Étape 1 : Accéder à l'interface Web
Se connecter à l'interface de gestion de pfSense via :
```
https://10.0.0.2
```

### Étape 2 : Créer une phase 1 IPsec
1. Allez dans **VPN -> IPsec** et cliquez sur **Ajouter P1**
2. Configurez les paramètres :
   - **Interface** : WAN
   - **Remote Gateway** : `10.0.0.3`
   - **Authentication Method** : Pre-Shared Key (PSK)
   - **Pre-Shared Key** : Choisissez une clé sécurisée
   - **IKE Version** : IKEv2
   - **Encryption Algorithm** : AES-256-GCM
   - **DH Group** : 14 (2048 bits)

### Étape 3 : Ajouter une Phase 2
1. Cliquez sur **Ajouter P2** sous la phase 1 précédemment créée
2. Configurez les paramètres :
   - **Local Network** : `172.18.0.0/16`
   - **Remote Network** : `10.10.0.0/16`
   - **Protocol** : ESP
   - **Encryption Algorithm** : AES-256
   - **Integrity Algorithm** : SHA-256
   - **PFS Key Group** : 14

### Étape 4 : Ajouter une règle de pare-feu
1. Allez dans **Firewall -> Rules -> IPsec**
2. Ajoutez une règle permettant le trafic entre les deux réseaux :
   - **Source** : `172.18.0.0/16`
   - **Destination** : `10.10.0.0/16`
   - **Action** : Pass

---

## 3 - Configuration de pfSense (Site EchoTech-Solutions.lan)

### Étape 1 : Accéder à l'interface Web
Se connecter à l'interface de gestion de pfSense via :
```
https://10.0.0.3
```

### Étape 2 : Créer une phase 1 IPsec
1. Allez dans **VPN -> IPsec** et cliquez sur **Ajouter P1**
2. Configurez les paramètres en miroir :
   - **Interface** : WAN
   - **Remote Gateway** : `10.0.0.2`
   - **Authentication Method** : Pre-Shared Key (PSK)
   - **Pre-Shared Key** : Même clé que Billu.com
   - **IKE Version** : IKEv2
   - **Encryption Algorithm** : AES-256-GCM
   - **DH Group** : 14

### Étape 3 : Ajouter une Phase 2
1. Cliquez sur **Ajouter P2** sous la phase 1 précédemment créée
2. Configurez les paramètres :
   - **Local Network** : `10.10.0.0/16`
   - **Remote Network** : `172.18.0.0/16`
   - **Protocol** : ESP
   - **Encryption Algorithm** : AES-256
   - **Integrity Algorithm** : SHA-256
   - **PFS Key Group** : 14

### Étape 4 : Ajouter une règle de pare-feu
1. Allez dans **Firewall -> Rules -> IPsec**
2. Ajoutez une règle permettant le trafic entre les deux réseaux :
   - **Source** : `10.10.0.0/16`
   - **Destination** : `172.18.0.0/16`
   - **Action** : Pass

---

## 4 - Vérification et Tests

### Étape 1 : Vérifier l'état du VPN
1. Allez dans **Status -> IPsec**
2. Vérifiez que la connexion est **établie**

### Étape 2 : Tester la connectivité
Depuis un poste du réseau Billu.com :
```bash
ping 10.10.0.1
```
Depuis un poste du réseau EchoTech-Solutions.lan :
```bash
ping 172.18.0.1
```
Si les pings fonctionnent, le VPN est bien opérationnel.

---

## Conclusion
Ce guide a permis d'établir un tunnel VPN sécurisé entre Billu.com et EchoTech-Solutions.lan via pfSense et IPsec. Cette connexion assure une communication fluide et sécurisée entre les deux LANs.






