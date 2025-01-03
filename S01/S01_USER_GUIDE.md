# SPRINT 01

## Schéma prévisionnel du réseau

Voici le plan prévisionnel du réseau, ce plan peut être amené a etre modifié.  

![Diagramme_reseau](/Ressources/S01_diagramme_reseau_billu.jpg)

## Plan d'adressage IP

Le réseau de la société BillU est en 172.18.1.0/16

Le réseau sera découper en 10 VLAN, 1 pour chaque département et 1 VLAN pour les serveurs.  
En voici un exemple :  

| **Serveur LAN** | **VLAN 255** | **172.18.255.0/24** |
|:---:|:---:|:---:|
| Adresse IP | Nom | Commentaire |
| 172.18.255.0 |  | Adresse Réseau |
| 172.18.255.1 | Thor | AD - DHCP - DNS |
| 172.18.255.2 | IronMan | AD principal - DNS |
| 172.18.255.3 | Deadpool | Serveur Debian12 GLPI |
| 172.18.255.255 | | Adresse du routeur |  
| 172.18.255.255 | | Adresse de Broadcast |    

| **Serveur LAN** | **VLAN 10** | **172.18.10.0/23** |
|:---:|:---:|:---:|
| Adresse IP | Nom | Commentaire |
| 172.18.10.0 |  | Adresse Réseau |
| 172.18.10.1 | PC-DEV-01 | PC utilisateur |
| 172.18.10.2 | PC-DEV-02 | PC utilisateur |
| 172.18.10.3 | PC-DEV-03 | PC utilisateur |
| 172.18.10.255 | | Adresse de Broadcast |  


## Convention de nommage

### 1 - Ordinateurs (Clients et Serveurs) : 

| TYPES :	| 			DÉPARTEMENT : |  
|:---|:---|
| PC : postes fixes		|		COM : Communication et Relations publiques |  
| LT : postes portables		|	JUR : Département Juridique |
| SRV : serveurs physiques	|		DEV : Développement logiciel |  
| VM : machines virtuelles		|	DIR : Direction |
| DC : contrôleurs de domaine  |	DSI : Directeur des Systèmes d’Information |
| FS : serveurs de fichiers		|	FIN : Finance et Comptabilité |
| DB : bases de données		|	QHS : QHSE | 
| GEN : général		|		SCO : Service Commercial | 
| SUP : supervision		|		REC : Service Recrutement |
| RT : routeur | |
| PFS : pfsense | |

Poste utilisateur portable dans le département Finance :  
**LT-FIN-001**  
Poste utilisateur fixe dans le département Développement logiciel :  
**PC-DEV-015**  
Serveur contrôleur de domaine principal :  
**SRV-DC-GEN-01**  
Serveur de fichiers physique QHSE :  
**SRV-FS-QHSE-01**  
VM pour un serveur Active Directory :  
**VM-DC-01**  

Pour plus de sécurité nous appliqueront des noms de personnage marvel pour les serveurs, voici quelques exemples :  

| Nom | Nom de poste | Fonction |
| :---- | :-----: | :------ |
| Thor | SRV-DC-01 | AD - DHCP - DNS |
| IronMan | SRV-DC-02 | AD principal - DNS |
| Deadpool | VM-DC-01 | Serveur Debian12 GLPI |

### 2 - Routeurs et Matériel Réseau : 

| TYPES :			|		SITE : |  
| :---- | :---- |
| RT : routeurs		|			PAR : Paris | 
| SW : switchs	|  
| AP : points accès WiFi	|

Routeur principal du site :    
**RT-PAR-01**   
Switch pour le réseau du département Juridique :    
**SW-JUR-01**    
Point d'accès WiFi pour l'étage 3 :    
**AP-PAR-03**    


### 3 - Utilisateurs :

#### STRUCTURE : 

1 - PrénomInitial.Nom  

Utilisateur standard sans homonyme :  
**j.dupont**

Pour les admins :  
**adm.j.dupont**

2 - PrénomInitial.Nom-Département  

Utilisateur avec homonyme :  
**j.dupont-dev, j.dupont-dsi**   

3 - PrénomInitial.Nom-DépartementNuméro

Utilisateur avec homonyme dans le même département :  
**j.dupont-dev01**, **j.dupont-dev02**  


### 4 - Périphériques supplémentaires :  

IMPRIMANTES STRUCTURE  :   

PRN-Site-DépartementNuméro  

PRN-PAR-DEV01  

NAS STRUCTURE  :   

NAS-Site-Numéro  

NAS-PAR-01  



