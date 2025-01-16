==============================

# P3-G1 BILLU

==============================
<HR>

## SOMMAIRE :  
### 1 - Mise en place de Group Policy Object
  - ### 1.1 - GPO de sécurité - Politique de sécurité PowerShell
  - ### 1.2 - GPO de sécurité - Stratégie de mot de passe
  - ### 1.3 - GPO de sécurité - Blocage complet ou partiel au panneau de configuration

### 2 - Ajout d'une machine au domaine 
  - ### 2.1 - Ajout d'une machine Windows 10
    
### 3 - Création d'un serveur GLPI sur une VM Debian 12 (CLI)
  - ### 3.1 - Configuration du serveur GLPI (Via l'interface graphique)

<HR>

## 1 - Mise en place de Group Policy Object 

Nos unités organisationnelles et nos groupes sont mis en place. Nous avons décidé d'implémenter certaines GPO pour paramétrer la sécurité et la configuration des machines clientes.

### 1.1 - GPO de sécurité - Politique de sécurité PowerShell            
Cette GPO sert à bloquer l'accès de la console PowerShell à tous les utilisateurs non abilités et qui n'en ont pas l'utilité.                  
**CREATION**
1. Cliquer sur Tools ---> Group Policy Management
2. Clic-droit sur `Group Policy Object` ---> `New` ---> Entrer un nom pertinent en rapport avec l'usage de la GPO. Ici, nous l'avons nommé "USERS_Security_Powershell"
3. Cliquer sur cette nouvelle GPO et supprimer "Authenticated Users" de l'onglet "Security Filtering"
4. Clic-droit sur la GPO, sélectionner `Edit`
5. Sélectionner `User Configuration` ---> `Policies` ---> `Administrative Templates` ---> `System`
6. Dans l'onglet de droite, sélectionner `Don't run specified Windows Applications`
7. Cocher `Enabled`, puis cliquer sur `Show` et rentrer les applications suivantes :

<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\GPO_Powershell_config1.png" width=500></P>

8. Cliquer sur `OK` puis `Apply`

**CONFIGURATION**
1. Clic-droit sur le UO à laquelle vous souhaitez rattacher la GPO. Ici, nous choisissons l'UO "Communication et Relations Publiques" ---> `Link a existing GPO...`
2. Sélectionner, parmi la liste des GPO existantes, "USERS_Security_Powershell"
La GPO est bien appliquée sur cette UO et à toutes celles qui en héritent.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\GPO_Powershell_result.png" width=500></P>

### 1.2 - GPO de sécurité - Stratégie de mot de passe  
Cette GPO sert à contrôler au mieux les comportements des salariés par l’instauration de règles (longueur minimale du mot de passe, expiration, etc.).  
<br>
**CREATION**  
1. Cliquer sur _Tools_ > _Group Policy Management_  
2. Cliquer sur _Domains_ > _billu.com_  
3. Clic-droit sur Default _Domain Policy_ > _Edit..._  
4. Allez ensuite sur Computer _Configuration_ > _Policies_ > _Windows Settings_ > _Security Settings_ > _Account Policies_ > _Password Policy_.  
<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\SC_ajout_gpo_mdp_01.png" width=500></P>

Ici vous pouvez modifier les paramètres souhaités pour la sécurité des mots de passe des utilisateurs.  
<br>
`Enforce password history` : Nombre d’anciens mots de passe stockés dans l’historique de l’AD qui ne peuvent être utilisés à nouveau.

`Maximum password age` : Défini à quel moment expirera le mot de passe en nombre de jours.

`Minimum password age` : Établir le nombre de jours à partir duquel un utilisateur pourra changer le mot de passe.

`Minimum password lengh` : Configurer la longueur minimale du mot de passe. Il est recommandé d’opter pour au moins 8 caractères et même jusqu’à 12.

`Password must meet complexity requirements` : Signifie si le mot de passe doit répondre à des exigences de complexité.Il impose également l’usage de 3 types de caractères différents appartenant aux 5 catégories suivantes :  
 - lettres majuscules
 - lettres minuscules
 - chiffres
 - caractères spéciaux
 - caractères Unicode

<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\SC_ajout_gpo_mdp_02.png" width=500></P>

Une fois les paramètres modifiés, vous pouvez vérifier s'ils ont bien été pris en compte en accédant à l’onglet _Settings_ de l’interface _Default Domain Policy_.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\SC_ajout_gpo_mdp_03.png" width=500></P>

Vérification lors d'un changement de mot de passe pour un utilisateur.  
<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\ajout_gpo_mdp_04.png" width=500></P>

### 1.3 - GPO de sécurité - Blocage complet ou partiel au panneau de configuration

**A : CREATION**  
1. Cliquer sur _Tools_ > _Group Policy Management_  
2. Cliquer sur _Domains_ > _billu.com
3. Clique droit sur le domaine puis "Create a GPO in this domain, and Link it here"
   <P ALIGN="center"><IMG src="..\Ressources\Annexes S03\capture d'ecran creation de de la gpo (CP).png" width=500></P>
4. donner un nom a la GPO  par exemple : Block Control Panel Access for Non-Admins 
 
**B : Configuration**
1. clique droit sur la nouvelle GPO Accédez à _User Configuration_ > _Policies_ > _Administrative Templates_ > _Control Panel_
2. clique sur _Prohibit access to Control Panel and PC settings_ > _Apply_ puis sur _ok_
   <P ALIGN="center"><IMG src="..\Ressources\Annexes S03\gpo-panelControl.png" width=500></P>
3. tester avec un poste client Essayez d'accéder au Panneau de configuration et normalement Vous devriez avoir cela
    
     <P ALIGN="center"><IMG src="..\Ressources\Annexes S03\capture d'ecran paneau de configuration.png" width=500></P>




## 2 - Ajout d'une machine au domaine  

### 2.1 - Ajout d'une machine Windows 10 à un domaine.

Ouvir les _Settings_ et cliquer sur _About_ 
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/Sc_add_pc_domain_01.png" width=500></P>  

Dans _About_, cliquer sur l'option _Advanced system settings_ et une fois la fenêtre ouverte, aller dans l'onglet _Computer Name_ et cliquer sur _Change..._  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/Sc_add_pc_domain_02.png" width=500></P>  

Modifier le nom de l'ordinateur et changer l'option `Member of` sur _Domain_ avec le nom de domaine (ici billu.com) puis cliquer sur _ok_  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/Sc_add_pc_domain_03.png" width=500></P>  

Utiliser un compte administrateur pour effectuer les changements.
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/Sc_add_pc_domain_04.png" width=500></P>  

Si tout est configuré correctement, vous devriez voir ce message.  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/Sc_add_pc_domain_05.png" width=500></P>  

ATTENTION ! Pensez à bien redémarrer votre machine pour appliquer les changements.  

## 3 - Création d'un serveur GLPI sur une VM Debian 12 (CLI)

###  Pré-requis

- Une VM Debian 12 
  - Nom de compte : `root`
  - Mot de passe : `Azerty1*`
  - Adresse IP : `172.18.255.3`

###   Préparation du serveur GLPI

### ***Mise à jour du système***

Une fois connecté sur la VM Debian, éxécuter la commande suivant afin de mettre à jour le système : 

```bash
apt-get update && sudo apt-get upgrade
```
### ***Téléchargement et installation des paquets nécéssaires***


Exécuter la commande suivante afin d'installer les paquets `Apache2`, `Maria DB`, et `PHP` (Penser également à appuyer sur `O` puis sur la touche `Entrée` pour valider)
```bash
apt-get install apache2 php mariadb-server
```



Exécuter ensuite la commande suivante pour installer les extensions PHP nécéssaires au bon fonctionnement de GLPI : 
```bash
apt-get install php-xml php-common php-json php-mysql php-mbstring php-curl php-gd php-intl php-zip php-bz2 php-imap php-apcu php-ldap
```



### ***Installation et configuration de MariaDB***

Exécuter la commande suivante pour préparer MariaDB à l'hebergement de la base de données de GLPI : 
```bash
mysql_secure_installation
```


Pour les questions qui seront posées : 
  - Appuyer sur `Entrée` pour la 1ère question (Comme il s'agit de la 1ère installation, il n'y a pas de mot de passe de configuré)
  - Taper `n` à la question `Switch to unix_socket authentication`
  - Taper `Y` à la question `Change the root password`, puis entrer un mot de passe et confirmer une deuxièeme fois ce même mot de passe (Dans notre cas, ce sera `Azerty1*`)
  - Taper `Y` à toutes les autres questions


Exécuter ensuite la commande suivante pour se connecter à MariaDB : 
```bash
mysql -u root -p
```
Exécuter ensuite les commandes suivantes afin de créer la base de données `billu_glpi`, ainsi que l'utilisateur `glpi` associé au mot de passe `Azerty1*`
```bash
CREATE DATABASE billu_glpi;
GRANT ALL PRIVILEGES ON billu_glpi.* TO glpi@localhost IDENTIFIED BY "Azerty1*";
FLUSH PRIVILEGES;
EXIT
```

### ***Téléchargement et installation de GLPI***

Exécuter les commandes suivantes afin de télécharger GLPI à partir du lien [GitHub](https://github.com/glpi-project/glpi/releases/) officiel, dans un dossier temporaire : 

```bash
wget https://github.com/glpi-project/glpi/releases/download/10.0.15/glpi-10.0.15.tgz
```

1. Création du dossier pour glpi

```bash
mkdir /var/www/html/glpi.Billu.com
```

2. Décompression du contenu téléchargé
```bash
tar -xzvf glpi-10.0.15.tgz
```

3. Copie du dossier décompréssé vers le nouveau crée
 ```bash
cp -R glpi/* /var/www/html/glpi.billu.com
```
4. Suppression du fichier index.php dans /var/www/html
```bash  
rm /var/www/html/index.html
```
5. Droits d'accès aux fichiers
```bash  
chown -R www-data:www-data /var/www/html/glpi.Billu.com
chmod -R 775 /var/www/html/glpi.Billu.com
```

##  Configuration de PHP
  

**Edition du fichier /etc/php/8.1/apache2/php.ini**

```bash
nano /etc/php/8.1/apache2/php.ini
```

Modification des paramètres :
```c
memory_limit = 64M # <= à changer
file_uploads = on
max_execution_time = 600 # <= à changer
session.auto_start = 0
session.use_trans_sid = 0
```

et a la fin en Redémarrer Debian Server.

### 3.1 - Configuration du serveur GLPI (Via l'interface graphique)

Dans un premier temps, nous devons nous rendre sur un hôte disposant d'une interface graphique, et connecté sur le même réseau que celui qui heberge le serveur GLPI.
Dans notre cas, ce sera une VM WIndows 10 Pro , Ouvrir ensuite un navigateur et inscrire l'adresse suivante : <Adresse_IP_Serveur_GLPI>/glpi.lab.lan > Nous saisissons nos identifiants et notre mot de passe, et nous arrivons dons sur la page ci-dessous :

<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\CP.interfaceGLPI.png" width=500></P>

1. Nous nous assurons de modifier le mot de passe et d'effacer le fichier. install/install.php ,Comme le mentionne la notification en orange.

2. Nous allons désormais ajouter notre serveur de contrôle de domaine et Active Directory **THOR** 
   Pour commencer, on se connecte à GLPI avec nos identifiants, puis dirigez-vous vers le menu. "Configuration", cliquez sur "Authentification".

<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\CP.GLPI-AnnuaireLDAP.png" width=500></P>

3. On clique sur "Ajouter" et renseignons les informations concernant notre serveur contrôleur de domaine, en s'assurant d'indiquer la bonne adresse IP et le 
   BaseDN.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\cp.GLPI- Annuaire LDPA-THOR.Billu.com.png" width=500></P>

4. Pour terminer, cliquez sur Sauvegarder puis effectuez un test pour vérifier que tout fonctionne correctement. Pour cela, cliquez sur Tester en haut à gauche du 
   menu LDAP. Normalement, un message indiquant la réussite du test devrait apparaître.
<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\CP .test Glpi.png" width=500></P>















