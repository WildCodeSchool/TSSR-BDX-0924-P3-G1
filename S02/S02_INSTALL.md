==============================

# P3-G1 BILLU

==============================

## Pré-Requis techniques


| **Système**  | **Windows Server 2022 Graphic** | **Windows Server 2022 Core** | **Serveur Debian12** |
| ------------ | ------------------------------- | ---------------------------- | -------------------- |
| **HostName** | Thor / SRV-DC-01                | IronMan / SRV-DC-02          | Deadpool / VM-SRV-01 |
| **Login**    | Administrator                   | Administrator                | Administrator        |
| **Password** | Azerty1\*                       | Azerty1\*                    | Azerty1\*            |

Toutes les VM sont installées sur l'hyperviseur Proxmox

<details>
<summary><h2>Windows Server 2022 Graphic</h2></summary>
 
## Installation d'une machine virtuelle Windows Server 2022 Graphic - Thor

A partir de templates mis à notre disposition, nous pouvons installer nos machines. Pour la Windows Server 2022, voici la marche à suivre.

1. Choisir le template _1098-Template-Windows-Server-2022_ puis clic-droit `Clone`
2. Choisir le **VM ID** entre 1041 et 1059.
3. Dans **Name**, respecter la nomenclature G1-"Nom de la machine". En l'occurence ici, G1-SRV-DC-01.
4. Dans **Ressource Pool**, choisir `TSSR-2409-BDX-P3-G1-`.
5. Dans **Mode**, sélectionner `Full Clone`.
6. Dans l'onglet **Hardware**, cliquer sur `Add` et ajouter un `Network Device`. Brige : vmbr1025 BillU (LAN) / Model : Intel E1000 et décocher `Firewall`.
7. Lancer le serveur, puis configurer l'adresse IPv4 comme suit :

- **Adresse IP** : 172.18.255.1
- **Masque** : 255.255.0.0
- **Passerelle** : 172.18.255.254

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

## Création du domaine "billu.com" dans l'AD

Pour créer un nouveau domaine, nous devons définir ce serveur en tant que _Domain Controller_. En suivant le wizard de configuration, cocher `Add a new forest` et entrer le nom de domaine choisi.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S02\Capture_forest.png" width=500></P>

## Création des Unités Organisationnelles au sein de l'AD

Selon le schéma établit, nous pouvons créer nos **UO**. Une UO _France_ est crée afin d'anticiper une éventuelle extension de l'entreprise dans un autre pays. Une UO _Paris_ est crée pour anticiper un extension dans une autre ville de France et de la même manière, une UO _20-Paris_ est crée pour anticiper une extension dans un autre arrondissement de Paris. Ensuite, les UO correspondent aux différents départements de BillU et des groupes sont aussi créés correspondants aux différents services dans les départements.

**Unités Organisationnelles Exemple**

1. Cliquer sur Tools ---> Active Directory Users ans Computers
2. Clic droit sur billu.com ---> New ---> Organizational Unit---> Entrer le nom de l'UO (département)"Direction"
3. Répéter ces actions en respectant la structure prévue par le schéma.

**Groupes Exemple**

1. Dans l'UO "Département Juridique", clic-droit sur cette UO ---> New ---> Group ---> Entrer le nom du groupe (service) "Droit des sociétés"
2. Répéter ces actions en respectant la structure prévue par le schéma.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S02\Capture_UO_AD.png" width=500></P>

## Configuration du DHCP
Maintenant que le rôle DHCP est installé, nous pouvons passer à configuration. En rapport avec le schéma réseau établit, nous pouvons accorder un scope d'adresses IP par Département.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S02\Scopes_DHCP.png" width=500></P>


</details>
<HR>

<details>
<summary><h2>Windows Server 2022 Core</h2></summary>


## Installation d'une machine virtuelle Windows Server 2022 Core

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
Renseignez votre IP (dans cet exemple **172.18.255.2**), puis le masque de réseau **255.255.255.0** (/24).  
Enfin l'adresse IP de votre passerelle par défaut, ici ce sera **172.18.255.254** (pfsense).  
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

### Étape 3 : Promouvoir en tant que controleur de domaine et réplication 

Une fois le serveur Core ajouté au domaine, ajoutez les rôles nécessaires à la préparation du serveur en contrôleur de domaine :  
 - RSAT-AD-Tools : Outils d'administration graphique  
 - AD-Domain-Services : Services de domaine Active Directory  

<P ALIGN="center"><IMG src="..\Ressources/Annexes S02/SC_ajout_dc_srvcore_01.png" width=500></P>  

Une fois ces opérations effectuées, rendez-vous sur le serveur graphique dans Server Manager et cliquez sur **Manage > Add Server**.  

Recherchez votre serveur par son nom et ajoutez-le.  

<P ALIGN="center"><IMG src="..\Ressources/Annexes S02/SC_ajout_dc_srvcore_01b.png" width=500></P>  
Une fois ajouté, vous pouvez le promouvoir en contrôleur de domaine en cliquant sur le petit icône drapeau.  

<P ALIGN="center"><IMG src="..\Ressources/Annexes S02/SC_ajout_dc_srvcore_02.png" width=500></P>  
Renseignez les paramètres comme indiqué sur la capture d'écran. Pour les credentials, utilisez un utilisateur du domaine et son mot de passe (un compte administrateur). Cliquez sur <b>Next</b>.

<P ALIGN="center"><IMG src="..\Ressources/Annexes S02/SC_ajout_dc_srvcore_03.png" width=500></P>  
Cochez ensuite les cases DNS et GC, puis définissez un mot de passe. Cliquez sur <b>Next</b>.  

<P ALIGN="center"><IMG src="..\Ressources/Annexes S02/SC_ajout_dc_srvcore_04.png" width=500></P>    
Pour la réplication, choisissez le serveur à partir duquel vous voulez répliquer. Ici, nous allons choisir notre serveur principal Thor. Cliquez sur <b>Next</b>.  

<P ALIGN="center"><IMG src="..\Ressources/Annexes S02/SC_ajout_dc_srvcore_05.png" width=500></P>  
Continuez à cliquer sur <b>Next</b> jusqu’à l’installation.  

<P ALIGN="center"><IMG src="..\Ressources/Annexes S02/SC_ajout_dc_srvcore_06.png" width=500></P>  
Une fois l’installation terminée, redémarrez le serveur.  

</details>
<HR>

<details>
<summary><h2>Serveur Debian12</h2></summary>

## Installation

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
