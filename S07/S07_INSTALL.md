==============================

# P3-G1 BILLU

==============================

# Mise en place d'un serveur de messagerie - iRedMail
Notre serveur de messagerie sera installé avec une VM Debian 12.8.

## Pré requis de la machine 
- Nom de la machine : `Hulk`
- Adresse IP : `172.18.255.5`
- DNS : `172.18.255.1`
- Domaine : `billu.com`

la machine a été renommée "Hulk" puis son interface réseau a été configurée. Elle a ensuite été ajoutée sous le domaine "billu.com"

## Installation de iRedMail sur la machine

**1. Installer les dépendances de iRedMail**
````bash
sudo apt update && sudo apt install -y gzip dialog wget curl tar
````

**2. Télécharger et extraire l'archive sur le serveur**
````bash
cd /root
wget https://github.com/iredmail/iRedMail/archive/refs/tags/1.7.1.tar.gz
tar zxf 1.7.0.tar.gz
cd iRedMail-1.7.1
````

**3. Démarrer l'installateur**
````bash
sudo bash iRedMail.sh
````
Pour rentrer dans l'installation, sélectionner `YES`

<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\GPO_Powershell_config1.png" width=500></P>

Points importants lors de l’installation :

- Emplacement de stockage des boîtes aux lettres : Par défaut `/var/vmail/`.
- Backend pour les comptes de messagerie : Choisir `MariaDB`
- Mot de passe pour l'accès à la base de données : `Azerty1*`
- Nom de domaine : Entrer `billu.com`.
- Mot de passe administrateur : Définir le mot de passe pour l’administrateur du domaine `Azerty1*`.
- Webmail : Sélectionner les options par défaut.

## Enregistrements DNS sur le serveur Windows Graphique, Thor

**MX**
1. Ouvrir le gestionnaire DNS dans *Tools*
2. Sélectionner *Thor* puis *Forward Lookup Zone* puis clic-droit sur *billu.com* ===> cliquer sur `New Mail Exchanger (MX)...`
3. Donner le nom `mail`
4. S'assurer que le domaine affiché soit `mail.billu.com`.
5. Priorité : Garder la valeur par défaut, `10`.
6. Cliquez sur "OK" pour enregistrer.

**CNAME**
1. Clic-droit sur *billu.com* ===> cliquer sur `New Alias (CNAME)...`
2. Donner le nom de l'alias `iredmail`
3. Donner le nom de domaine complet de la cible `mail.billu.com`
4. Cliquez sur "OK" pour enregistrer.

Vérifier dans la fenêtre de droite du DNS Manager que les enregistrements ont bien été éffectués. Celà devrait apparaitre comme ci-dessous : 

<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\GPO_Powershell_config1.png" width=500></P>
<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\GPO_Powershell_config1.png" width=500></P>




