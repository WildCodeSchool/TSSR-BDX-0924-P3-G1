==============================

# P3-G1 BILLU

==============================

# Pré requis
Un serveur de messagerie dans le domaine `billu.com` doit être installé et configuré. La documentation de trouve sur le fichier `S07_ISTALL.md`.

# Utilisation de la messagerie - côté client 

## 1. Roundcube - Webmail
Nous allons pouvoir nous connecter sur une machine cliente à **Roundcube**, l'url étant l'adresse IP : `172.18.255.5/mail/`
L'interface de Roundcube apparait, entrer les identifiants suivants :
  - Nom d'utilisateur : `postmaster@billu.com`
  - Mot de passe : `Azerty1*`
Puis cliquer sur `CONNEXION`

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_Roundcube_1.png" width=500></P>

L'interface d'accueil de la messagerie s'ouvre : 

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_Roundcube_2.png" width=600></P>

## 2. IredAdmin - Tableau de bord
Nous allons pouvoir nous connecter à **iRedAdmin**, l'url étant l'adresse IP : `172.18.255.5/iredadmin/`
L'interface de iRedAdmin apparait, entrer les identifiants suivants :
  - Nom d'utilisateur : `postmaster@billu.com`
  - Mot de passe : `Azerty1*`
Puis cliquer sur `Login`

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_iRedAdmin_1.png" width=600></P>

Le tableau de bord de iRedAdmin s'ouvre, on peut maintenant ajouter un utilisateur de notre domaine. Cliquer sur le bouton `+ Add...` et rentrer les informations de l'utilisateur Adam Thomas du département développement Logiciel, et lui attribuer un mot de passe.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_iRedAdmin_2.png" width=600></P>

On peut ajouter ainsi plusieurs utilisateurs, le résultat de ces ajouts se trouve dans l'onglet `Domains and Accounts` comme ci- dessous :

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_iRedAdmin_3.png" width=600></P>

## 3. Retour sur Roundcube
Se connecter avec notre premier utilisateur, Adam Thomas :

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_Roundcube_3.png" width=600></P>

Ecrire un mail test à notre deuxième utilsateur, Amélie Blanchet.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_Roundcube_4.png" width=600></P>

Se connecter avec les identifiants d'Amélie Blanchet, le mail a bien été reçu, la création et la configuration d'adresse mail est opérationnelle.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_Roundcube_5.png" width=600></P>







