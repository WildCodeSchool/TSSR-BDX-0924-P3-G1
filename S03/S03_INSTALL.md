==============================

# P3-G1 BILLU

==============================
<HR>

## SOMMAIRE :  
### 1 - Mise en place de Group Policy Object
  - ### 1.1 - GPO de sécurité - Politique de sécurité PowerShell
  - ### 1.2 - GPO de sécurité - Stratégie de mot de passe
  - ### 1.3 - GPO de sécurité -
  - ### 1.4 - GPO standard -
  - ### 1.5 - GPO standard -
  - ### 1.6 - GPO standard -

### 2 - Ajout d'une machine au domaine 
  - ### 2.1 - Ajout d'une machine Windows 10

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
<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\SC_ajout_gpo_mdp_04.png" width=500></P>



## 2 - Ajout d'une machine au domaine  

### 2.1 - Ajout d'une machine Windows 10

<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/Sc_add_pc_domain_01.png" width=500></P>  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/Sc_add_pc_domain_02.png" width=500></P>  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/Sc_add_pc_domain_03.png" width=500></P>  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/Sc_add_pc_domain_04.png" width=500></P>  
<P ALIGN="center"><IMG src="..\Ressources/Annexes S03/Sc_add_pc_domain_05.png" width=500></P>  
