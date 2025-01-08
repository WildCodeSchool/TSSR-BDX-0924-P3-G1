==============================

# P3-G1 BILLU

==============================

## Mise en place de Group Policy Object 

Nos unités organisationnelles et nos groupes sont mis en place. Nous avons décidé d'implémenter certaines GPO pour paramétrer la sécurité et la configuration des machines clientes.

**GPO de sécurité - Politique de sécurité PowerShell**            
Cette GPO sert à bloquer l'accès de la console PowerShell à tous les utilisateurs non abilités et qui n'en ont pas l'utilité.
CREATION
1. Cliquer sur Tools ---> Group Policy Management
2. Clic-droit sur `Group Policy Object` ---> `New` ---> Entrer un nom pertinent en rapport avec l'usage de la GPO. Ici, nous l'avons nommé "USERS_Security_Powershell"
3. Cliquer sur cette nouvelle GPO et supprimer "Authenticated Users" de l'onglet "Security Filtering"
4. Clic-droit sur la GPO, sélectionner `Edit`
5. Sélectionner `User Configuration` ---> `Policies` ---> `Administrative Templates` ---> `System`
6. Dans l'onglet de droite, sélectionner `Don't run specified Windows Applications`
7. Cocher `Enabled`, puis cliquer sur `Show` et rentrer les applications suivantes :

<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\GPO_Powershell_config1.png" width=500></P>

8. Cliquer sur `OK` puis `Apply`

CONFIGURATION
1. Clic-droit sur le UO à laquelle vous souhaitez rattacher la GPO. Ici, nous choisissons l'UO "Communication et Relations Publiques" ---> `Link a existing GPO...`
2. Sélectionner, parmi la liste des GPO existantes, "USERS_Security_Powershell"
La GPO est bien appliquée sur cette UO et à toutes celles qui en héritent.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S03\GPO_Powershell_result.png" width=500></P>

