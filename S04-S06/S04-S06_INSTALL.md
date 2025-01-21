==============================

# P3-G1 BILLU

==============================

## Installation Serveur Debian12

## Configuration Réseau

| **Réseau 172.18.0.0/24** | \*\*\*\* | \*\*\*\* | \*\*\*\* |
| ------------------------ | -------- | -------- | -------- |
| **172.18.**              |          |          |          |
| \*\*\*\*                 |          |          |          |
| \*\*\*\*                 |          |          |          |

<details>

### les différentes VM seront installées sur ProxMox

### Pour l'installation de la VM Debian12 :
- Cliquez sur "Create VM" dans le menu supérieur

  - Donnez un nom à votre VM (VM-SRV-01)
  - sélectionnez "Linux" comme type de système d'exploitation.
  - Sélectionnez le stockage local et choisissez l'ISO Debian que vous avez téléchargé.
  - Configurez les paramètres de la VM selon vos besoins
  - CPU
  - RAM
  - disque
  - cliquez sur "OK" pour la validation

    ### Configuration

- Cliquez sur "install "  
 <P ALIGN="center"><IMG src="../Ressources/Annexes S02/capture_debian_lci.png" width=500></P> 

 - On choisie la langue pour faire l'installation
 <P ALIGN="center"><IMG src="../Ressources/Annexes S02/langue de conf.png" width=500></P> 
- On établit le nom d'hôte
 <P ALIGN="center"><IMG src="../Ressources/Annexes S02/le nom d'hôte.png" width=500></P> 
- On désigne également un nom de domaine.
 <P ALIGN="center"><IMG src="../Ressources/Annexes S02/nom de domaine..png" width=500></P>  
- On définie un mot de passe
 <P ALIGN="center"><IMG src="../Ressources/Annexes S02/mot de passe .png" width=500></P> 
- On définie le nom de l'utilisateur
 <P ALIGN="center"><IMG src="../Ressources/Annexes S02/user.png" width=500></P> 
- puis on rajoute un mot de pass
 <P ALIGN="center"><IMG src="../Ressources/Annexes S02/mot de passe .png" width=500></P> 

- On partitionne notre disque selon nous besoin.
 <P ALIGN="center"><IMG src="../Ressources/Annexes S02/disque .png" width=500></P> 

- Nous continuons à valider jusqu'à ce qu'il nous demande de configurer la gestion de packages, et à ce moment-là, nous l'acceptons et choisissons cette option.
  deb.debian.org
 <P ALIGN="center"><IMG src="../Ressources/Annexes S02/deb.debian.org.png" width=500></P>
  -Nous continuons la validation jusqu'à ce qu'il nous demande de paramétrer l'environnement de bureau de notre machine, et nous faisons notre choix selon nos
  besoins.
 <P ALIGN="center"><IMG src="../Ressources/Annexes S02/server web et ssh.png" width=500></P>
-Nous continuons la validation avec l'installation du programme GRUB 
<P ALIGN="center"><IMG src="../Ressources/Annexes S02/grub.png" width=500></P>
-Et normalement, on a juste à attendre la fin de l'installation pour ensuite accéder à notre machine Debian. 
<P ALIGN="center"><IMG src="../Ressources/Annexes S02/fin d'installation.png" width=500></P>
<P ALIGN="center"><IMG src="../Ressources/Annexes S02/console-debian.png" width=500></P>

</details>
<HR>

- ## Configuration SSH sur Debian

<details>

1.  Ouvrir le terminal et tapez la commande :

```bash
sudo apt update
```

-2. **Installer le serveur SSH :**

```bash
sudo apt install openssh-server
```

-3 **Assurez-vous que le service SSH démarre au démarrage et qu'il est actuellement actif :**

```bash
sudo systemctl enable ssh
```

```bash
sudo systemctl start ssh

```

-4. **Vérifier que le service SSH est en cours d'exécution :**

```bash
sudo systemctl status ssh
```

Si le service n'est pas actif
démarrez-le avec :

```bash
sudo systemctl start ssh
```

-Et normalement vous aller avoir ce résultat -![ssh active ](https://github.com/user-attachments/assets/531dba0c-54ad-4b67-8ff0-79a455c36221)

- ## Configuration SSH sur Windows server
- Ouvrir les Paramètres :

-1. Cliquez sur le bouton Démarrer et sélectionnez "Paramètres" (ou appuyez sur Win + I) Dans les Paramètres, allez dans "Applications"

-2. Sélectionnez "Fonctionnalités facultatives" Cliquez sur "Ajouter une fonctionnalité facultative"

-3. Rechercher et installer OpenSSH Client : Cochez la case à côté de "OpenSSH Client" et cliquez sur "Installer"

-4. Redémarrer votre ordinateur : Redémarrez pour que les modifications prennent effet

-5. Connexion via PowerShell : Lancez PowerShell avec les privilèges administratifs (clic droit sur l'icône PowerShell, puis "Exécuter en tant qu'administrateur").
pui Utilisez la commande suivante pour vous connecter à votre serveur Debian

```bash
 ssh user@server_ip
```

Remplacez user par votre nom d'utilisateur Debian et server_ip par l'adresse IP de votre serveur Debian , puis vous Saisissez le mot de passe de votre
utilisateur Debian lorsque vous y êtes invité.

</details>

##
