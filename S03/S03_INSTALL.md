==============================

# Guide Aministrateur

==============================

## Pré-Requis techniques

| **Système**  | **Windows Server 2022 Graphic** | **Windows Server 2022 Core** | **Serveur Debian12** |
| ------------ | ------------------------------- | ---------------------------- | -------------------- |
| **HostName** | SRV-DC-01                       | SRV-DC-02                    | VM-SRV-01            |
| **Login**    | Administrator                   | Administrator                | Administrator        |
| **Password** | Azerty1\*                       | Azerty1\*                    | Azerty1\*            |

<details>
<summary><h2>Windows Server Graphic</h2></summary>

## Installation de l'ADDS, DHCP et DNS

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
</details>

<HR>

<details>
<summary><h2>Serveur Windows Core</h2></summary>

### 1 - Installation

#### Étape 1 : Choix de la langue  

Choisir de la langue pour l'installation, format de l'heure et clavier ou méthode de saisie.  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/ScreenShot Windows Core/Install_Step_01.png" width=500></P>

#### Étape 2 : Choix système  

Choisir le système **Windows Server 2022 Standard Evaluation** et cliquez sur **Next**.  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/ScreenShot Windows Core/Install_Step_02.png" width=500></P>

#### Étape 3 : Type d'installation  

Choisir le type d'installation en **Custom**.  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/ScreenShot Windows Core/Install_Step_03.png" width=500></P>

Sélectionner le disque principal et cliquez sur **Next**.  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/ScreenShot Windows Core/Install_Step_03-1.png" width=500></P>

#### Étape 4 : Installation  

Une fois l'étape 3 finie l'installation se lance, à la fin de celle-ci le PC redémarre.  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/ScreenShot Windows Core/Install_Step_04.png" width=500></P>

#### Étape 5 : Mot de passe    

Une fois que le PC à redémarré, on vous demande de changer le mot de passe, sélectionnez **OK** et appuyez sur la touche **Entrée**.  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/ScreenShot Windows Core/Install_Step_05.png" width=500></P>  

Renseignez votre mot de passe et appuyez sur la touche **Entrée**. Si cela ne fonctionne pas, vérifiez que le mot de passe soit bien identique dans les deux champs **New password** et **Confirm password**  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/ScreenShot Windows Core/Install_Step_05-1.png" width=500></P>

Une fois le mot de passe modifié, un message de confirmation s'affiche, vous pouvez appuyez sur la touche **Entrée**.  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/ScreenShot Windows Core/Install_Step_05-2.png" width=500></P>

### 2 - Paramètres  

#### Étape 1 : Configuration IP  

Entrée le chiffre **8** pour modifier les paramètres réseaux.  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/ScreenShot Windows Core/Param_Step_01.png" width=500></P>

Selectionnez l'index de la carte réseau à modifier _(ici l'index 1)_.  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/ScreenShot Windows Core/Param_Step_01-1.png" width=500></P>

Pour modifier l'IP, choisir le chiffre **1**.  
Pour une IP statique, choisir **S** _(il est possible de choisir par DHCP si celui est configuré sur votre réseau)_  
Renseignez votre IP (dans cet exemple **172.18.1.2**), puis le masque de réseau **255.255.0.0** (/16).  
Enfin l'adresse IP de votre passerelle par défaut, ici ce sera **172.18.0.1**.  
Un message vous affichera si l'opération à réussi. Vous pouvez appuyer sur **Entrée** pour revenir au menu.  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/ScreenShot Windows Core/Param_Step_01-2.png" width=500></P>

#### Étape 2 : Ajout au domaine  

Pour ajouter votre PC à un domaine existant, choisissez l'option **1**  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/ScreenShot Windows Core/Param_Step_02.png" width=500></P>

Selectionner **D** pour le domaine et renseignez le nom du domaine à joindre, ici **billu.com**  
Spécifiez un utilisateur autorisé sur ce domaine, ici **BILLU\Administrator** et renseignez le mot de passe.  
Un message vous informera si l'opération a réussi.  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/ScreenShot Windows Core/Param_Step_02-1.png" width=500></P>

Vous devriez maintenant voir votre nom de domaine en face de l'option **1**.  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/ScreenShot Windows Core/Param_Step_02-2.png" width=500></P>

</details>
<HR>

<details>
<summary><h2>Serveur Debian12</h2></summary>

## Installation

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

- Cliquez sur "install"
- ![1](https://github.com/user-attachments/assets/095cc155-1717-4fa3-84ee-9ee33f176dd9)
- Nous sélectionnons le pays pour le fuseau horaire
- ![3](https://github.com/user-attachments/assets/27ea014e-2679-4e59-8115-5ab639455c20)
- On choisie la langue pour faire l'installation
- ![langue](https://github.com/user-attachments/assets/a5bfc614-e0eb-45bb-9b00-c260ef390be0)
- On établit le nom d'hôte
- ![login](https://github.com/user-attachments/assets/d414e067-e22a-45f3-9839-34085c8e8be6)
- On désigne également un nom de domaine.
- ![nom du domain ](https://github.com/user-attachments/assets/8a986adb-0069-4ecf-9dee-dee41e8468a8)
- On définie un mot de passe
- ![psswdlogin](https://github.com/user-attachments/assets/ea9183da-5f2b-4ea6-ac55-d5e885b985f0)
- On définie le nom de l'utilisateur
- ![login](https://github.com/user-attachments/assets/c0f8e284-a5ac-4c02-860b-ccaa1d18e02e)
- puis on rajoute un mot de pass
-  ![psswdlogin](https://github.com/user-attachments/assets/ea9183da-5f2b-4ea6-ac55-d5e885b985f0)
- Nous organisons notre disque dur en fonction de nos besoins
- ![partitionnement ](https://github.com/user-attachments/assets/91b1b169-f5c7-4a80-b17d-4d06478164b8)
- Nous continuons à valider jusqu'à ce qu'il nous demande de configurer la gestion de packages, et à ce moment-là, nous l'acceptons et choisissons cette option.
  deb.debian.org
-![meroir ](https://github.com/user-attachments/assets/aac6f828-19ff-4387-9a84-da2618921008)
-Nous continuons la validation jusqu'à ce qu'il nous demande de paramétrer l'environnement de bureau de notre machine, et nous faisons notre choix selon nos
-besoins Pour notre projet, nous décochons Debian Desktop et Gnome, tout en cochant les cases pour **serveur web** et **SSH**.
- ![desktop1](https://github.com/user-attachments/assets/3fa123dc-9853-4553-bbb5-a2255adf2864)
-Nous continuons la validation avec l'installation du programme GRUB
-![grub1](https://github.com/user-attachments/assets/6ca1e601-eef1-48d0-ad2a-afc4195a3589)
-Et normalement, on a juste à attendre la fin de l'installation pour ensuite accéder à notre machine Debian.
-![installation terminer ](https://github.com/user-attachments/assets/3491a2b3-6f52-4532-a47d-4b8d9b5e79f2)

- ![debianconsol](https://github.com/user-attachments/assets/302b6390-9883-4820-855a-9965ba824f57)
  


## Configuration SSH sur Debian

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


- **1.** Cliquez sur le bouton Démarrer et sélectionnez "Paramètres" (ou appuyez sur Win + I) Dans les Paramètres, allez dans "Applications"

- **2.** Sélectionnez "Fonctionnalités facultatives" Cliquez sur "Ajouter une fonctionnalité facultative"

- **3.** Rechercher et installer OpenSSH Client : Cochez la case à côté de "OpenSSH Client" et cliquez sur "Installer"

- **4.** Redémarrez pour que les modifications prennent effet

- **5.** Connexion via PowerShell : lancer powershell en tant qu administrateur, 
     en suite Utilisez la commande suivante pour vous connecter à votre serveur Debian

```bash
 ssh user@server_ip
```

Remplacez user par votre nom d'utilisateur Debian et server_ip par l'adresse IP de votre serveur Debian , puis vous Saisissez le mot de passe de votre
utilisateur Debian lorsque vous y êtes invité.

</details>

