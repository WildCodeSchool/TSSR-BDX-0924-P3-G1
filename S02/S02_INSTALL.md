==============================

# P3-G1 BILLU

==============================

## Pré-Requis techniques

| **Système**  | **Windows Server 2022 Graphic** | **Windows Server 2022 Core** |
| ------------ | ------------------------------- | ---------------------------- |
| **HostName** | SRV-DC-01                       | SRV-DC-02                    |
| **Login**    | Administrator                   | Administrator                |
| **Password** | Azerty1\*                       | Azerty1\*                    |

Toutes les VM sont installées sur l'hyperviseur Proxmox

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

## Serveur Windows Core

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
Renseignez les paramètres comme indiqué sur la capture d'écran. Pour les credentials, utilisez un utilisateur du domaine et son mot de passe (un compte administrateur). Cliquez sur **Next**.

<P ALIGN="center"><IMG src="..\Ressources/Annexes S02/SC_ajout_dc_srvcore_03.png" width=500></P>  
Cochez ensuite les cases DNS et GC, puis définissez un mot de passe. Cliquez sur **Next**.  

<P ALIGN="center"><IMG src="..\Ressources/Annexes S02/SC_ajout_dc_srvcore_04.png" width=500></P>    
Pour la réplication, choisissez le serveur à partir duquel vous voulez répliquer. Ici, nous allons choisir notre serveur principal Thor. Cliquez sur **Next**.  

<P ALIGN="center"><IMG src="..\Ressources/Annexes S02/SC_ajout_dc_srvcore_05.png" width=500></P>  
Continuez à cliquer sur **Next** jusqu’à l’installation.  

<P ALIGN="center"><IMG src="..\Ressources/Annexes S02/SC_ajout_dc_srvcore_06.png" width=500></P>  
Une fois l’installation terminée, redémarrez le serveur.  

