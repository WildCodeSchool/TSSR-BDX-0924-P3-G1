==============================

# Guide Aministrateur

==============================

## Pré-Requis techniques

| **Système**  | **Windows Server 2022 Graphic** | **Windows Server 2022 Core** | **Serveur Debian12** |
| ------------ | ------------------------------- | ---------------------------- | -------------------- |
| **HostName** | SRV-DC-01                       | SRV-DC-02                    | VM-SRV-01            |
| **Login**    | Administrator                   | Administrator                | Administrator        |
| **Password** | Azerty1\*                       | Azerty1\*                    | Azerty1\*            |

## Installation de l'ADDS, DHCP et DNS sur Windows Server Graphic

1. Cliquer sur _Manage_ puis _Add Roles and Features_.
<P ALIGN="center"><IMG src="..\Ressources\Annexes S02\Capture d'écran 2024-11-28 140642.png" width=500></P>

2. Sélectionner _Role-based or feature-based installation_.
3. Sélectionner le serveur.
4. Sélectionner _Active Directory Domain Services_ puis cliquer sur l'option `Add features`.
5. De la même manière, cocher sur _DHCP Server_ puis cliquer sur l'option `Add features`.
6. Cocher ensuite sur _DNS Server_ puis cliquer sur l'option `Add features`.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S02\Capture d'écran 2024-11-28 142055.png" width=500></P>

7. Cliquer sur `Next` jusqu'à la fin de l'assistant d'installation puis cliquer sur `Install`. S'il ne le fait pas automatiquement, redémarrer l'ordinateur afin qu'il prenne en charge ses nouveaux rôles.

## Mise en place de la structure organisationnelle dans l'Active Directory sur Windows Server Graphic

Voici le schéma des Unités Organisationnelles et des groupes. Les groupes ont été définis en fonction des différents droits d'accès.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\Schema_UO_Gpes.png" width=1000></P>

**Unités Organisationnelles**

1. Cliquer sur Tools ---> Active Directory Users ans Computers
2. Clic droit sur billu.com ---> New ---> Organizational Unit---> Entrer le nom "Direction"
3. Clic-droit sur cette nouvelle UO "Direction" ---> New ---> UO pour ajouter une nouvelle UO dans l'UO "Direction"---> Entrer le nom "Directeur"
4. Répéter ces actions en respectant la structure prévue par le schéma.

**Groupes**

1. Dans une UO "Groupes", clic-droit sur cette UO ---> New ---> Group ---> Entrer le nom "Admin_Sys"
2. Répéter ces actions en respectant la structure prévue par le schéma.

## Installation Serveur Debian12

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

- Cliquez sur "Graphical install"
- ![graphique](https://github.com/user-attachments/assets/2d684241-d7c1-4e5b-a1a0-25fb145e0be6)
- On choisie la langue pour faire l'installation
- ![3 langue-install 3](https://github.com/user-attachments/assets/cd51ef36-1a80-4066-a4f3-c1d0846a42c2)
- On établit le nom d'hôte
- ![5-hostname](https://github.com/user-attachments/assets/54825be5-8ffb-4080-83e9-36470236d3cf)
- On désigne également un nom de domaine.
- ![6 nom de domain](https://github.com/user-attachments/assets/5bb4e695-867a-4dcf-a61c-7327ed328b0c)
- On définie un mot de passe
- ![7 PassWORD](https://github.com/user-attachments/assets/b0a2a6c1-776b-425c-9b60-9f00e0f04996)
- On définie le nom de l'utilisateur
- ![8 username](https://github.com/user-attachments/assets/5e2a02c5-654e-452b-83a9-f2e6f43093e5)
- puis on rajoute un mot de pass
- ![7 PassWORD](https://github.com/user-attachments/assets/b0a2a6c1-776b-425c-9b60-9f00e0f04996)

- On partitionne notre disque selon nous besoin.
- ![10 partition-d](https://github.com/user-attachments/assets/7b222862-4aef-47f9-b37a-4a8969efc266)

- Nous continuons à valider jusqu'à ce qu'il nous demande de configurer la gestion de packages, et à ce moment-là, nous l'acceptons et choisissons cette option.
  deb.debian.org -![deb debian org](https://github.com/user-attachments/assets/660b7ff2-1195-49cf-9005-336d87ccbc1e)
  -Nous continuons la validation jusqu'à ce qu'il nous demande de paramétrer l'environnement de bureau de notre machine, et nous faisons notre choix selon nos
  besoins.
- ![ssh](https://github.com/user-attachments/assets/f06ff4e7-7cea-410a-8d33-867d7babcf09)
  -Nous continuons la validation avec l'installation du programme GRUB -![installation de grub](https://github.com/user-attachments/assets/987204ca-c70d-4332-8af4-90e4c383c036)
  -Et normalement, on a juste à attendre la fin de l'installation pour ensuite accéder à notre machine Debian. -![fin d'instalation ](https://github.com/user-attachments/assets/0deb1713-edf1-4be1-a6d2-14792086e4ed) -![a](https://github.com/user-attachments/assets/61723781-e4db-4e31-8def-8e129ca36552)

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
