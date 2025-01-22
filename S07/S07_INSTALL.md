==============================

# P3-G1 BILLU

==============================

# Mise en place d'un serveur de messagerie - iRedMail
Notre serveur de messagerie sera installé avec une VM Debian 12.8.

## Pré requis de la machine 
- Nom de la machine : `Hulk`
- Adresse IP : `172.18.255.5`
- DNS : `172.18.255.1`
- Domaine : `billu.com`

la machine a été renommée "Hulk" puis son interface réseau a été configurée. Elle a ensuite été ajoutée sous le domaine "billu.com"

## Installation de iRedMail sur la machine

**1. Installer les dépendances de iRedMail**
````bash
sudo apt update && sudo apt install -y gzip dialog wget curl tar
````

**2. Télécharger et extraire l'archive sur le serveur**
````bash
cd /root
wget https://github.com/iredmail/iRedMail/archive/refs/tags/1.7.1.tar.gz
tar zxf 1.7.0.tar.gz
cd iRedMail-1.7.1
````

**3. Démarrer l'installateur**
````bash
sudo bash iRedMail.sh
````
Pour rentrer dans l'installation, sélectionner `YES`

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_Messagerie_1.png" width=600></P>

Points importants lors de l’installation :

- Emplacement de stockage des boîtes aux lettres : Par défaut `/var/vmail/`.
- Préférence de serveur Web : Sélectionner `Nginx`

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_Messagerie_2.png" width=600></P>

- Backend pour les comptes de messagerie : Choisir `MariaDB`

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_Messagerie_4.png" width=600></P>

- Mot de passe pour l'accès à la base de données : `Azerty1*`
- Nom de domaine : Entrer `billu.com`.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_Messagerie_3.png" width=600></P>
  
- Mot de passe administrateur : Définir le mot de passe pour l’administrateur du domaine `Azerty1*`.
- Webmail : Sélectionner les options par défaut, `Roudcubemail`, `netdata`, `iRedAdmin`, `Fail2ban`.
- Récapitulatif des options de configuration :

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_Messagerie_5.png" width=600></P>

- Répondre `YES` aux deux dernières questions posées :

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_Messagerie_6.png" width=600></P>

- une message vous informe que l'installation s'est éffectuée ave succès, redémarrer la machine

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_Messagerie_7.png" width=600></P>
  

## Enregistrements DNS sur le serveur Windows Graphique, Thor

**MX**
1. Ouvrir le gestionnaire DNS dans *Tools*
2. Sélectionner *Thor* puis *Forward Lookup Zone* puis clic-droit sur *billu.com* ===> cliquer sur `New Mail Exchanger (MX)...`
3. Donner le nom `mail`
4. S'assurer que le domaine affiché soit `mail.billu.com`.
5. Priorité : Garder la valeur par défaut, `10`.
6. Cliquez sur "OK" pour enregistrer.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_RecordsDNS_1.png" width=500></P>

**A**
1. Ouvrir le gestionnaire DNS dans *Tools*
2. Sélectionner *Thor* puis *Forward Lookup Zone* puis clic-droit sur *billu.com* ===> cliquer sur `New Host (A or AAAA)...`
3. Donner le nom `mail`
4. Donner l'ip `172.18.255.5`.
5. Cliquez sur "OK" pour enregistrer.

**CNAME**
1. Clic-droit sur *billu.com* ===> cliquer sur `New Alias (CNAME)...`
2. Donner le nom de l'alias `iredmail`
3. Donner le nom de domaine complet de la cible `mail.billu.com`
4. Cliquez sur "OK" pour enregistrer.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_RecordsDNS_2.png" width=500></P>

Vérifier dans la fenêtre de droite du DNS Manager que les enregistrements ont bien été éffectués. Celà devrait apparaitre comme ci-dessous : 

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_RecordsDNS_3.png" width=600></P>

<P ALIGN="center"><IMG src="..\Ressources\Annexes S07\Capture_RecordsDNS_4.png" width=600></P>

Le serveur de messagerie est fonctionnel. La documentation concernant l'utilisation de `Roundcube` et `iRedMail` se situe dans le fichier `S07_USER_GUIDE.md`.


# Mise en place d'un serveur de supervision - Zabbix
Notre serveur de supervision sera installé avec une VM Debian 12.8.

## Pré requis de la machine   
- Nom de la machine : `Spiderman`  
- Adresse IP : `172.18.255.4`  
- DNS : `172.18.255.1`  
- Gateway : `172.18.255.254`  
- Domaine : `billu.com`  

## Installation de Zebbix sur la machine  

### 1 - Installation des dépendances.  

Effectuez la commande `apt install sudo gpg curl wget`  

### 2 - Installation de PostgreSQL   

Installer dabord les dépôts PostgreSQL et désactiver les dépôts PostgreSQL système par défaut. Lorsque le message suivant apparaît : _« Ce script activera le dépôt APT PostgreSQL sur apt.postgresql.org sur votre système. Le nom de code de la distribution utilisé sera bookworm-pgdg. »_ appuyez sur **Entrée** pour continuer et confirmer l'installation depuis le dépôt officiel.  

Utilisez les commandes suivantes :  
`apt install -y postgresql-common`  
`/usr/share/postgresql-common/pgdg/apt.postgresql.org.sh`  

Installer ensuite la dernière version de PostgreSQL (version 17)  
`apt -y install postgresql-17`  

Lancer PostgreSQL et configurer le pour qu'il démarre automatiquement lors du démarrage du système  
`systemctl enable postgresql --now`  

### 3 - Installation du serveur Zabbix et des composants

Une fois la base données installée, procéder à l'installation du serveur Zabbix et de tous ses composants.

Ajouter les dépôts Zabbix et vidons le cache d'installation. 

```bash
root@spiderman:~# wget https://repo.zabbix.com/zabbix/7.2/release/debian/pool/main/z/zabbix-release/zabbix-release_latest_7.2+debian12_all.deb
root@spiderman:~# dpkg -i zabbix-release_latest_7.2+debian12_all.deb
root@spiderman:~# apt update
```

Nous installons tous les composants nécessaires de Zabbix.

Dans ce cas, nous utiliserons Zabbix Agent 2 comme agent principal de supervision, recommandé pour ses nombreuses fonctionnalités supplémentaires.  
`apt install zabbix-server-pgsql zabbix-frontend-php php8.2-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent2 zabbix-web-service`  

### 4 - Initialisation de la base de données

Commencez par créer un utilisateur de base de données pour Zabbix. Pendant le processus, un mot de passe d'accès sera demandé. Ensuite, créez une base de données vide et attribuez les autorisations nécessaires.  

`sudo -u postgres createuser --pwprompt zabbix`  
`sudo -u postgres createdb -O zabbix zabbix`  

À ce stade, nous pouvons importer le schéma et les données par défaut. Le mot de passe saisi précédemment sera de nouveau demandé.  
`zcat /usr/share/zabbix/sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix`

### 5 - Configuration du Serveur Zabbix

Ouvrez le fichier de configuration du serveur Zabbix.
`nano /etc/zabbix/zabbix_server.conf`  
Attention il est fortement recommendait de faire un backup du fichier avant modification ( `cp zabbix_server.conf zabbix_server.conf.backup` par exemple)

Modifiez les paramètres suivants comme indiqué ci-dessous :  
```bash
...
DBPassword=motdepasse
StartReportWriters=1
WebServiceURL=http://localhost:10053/report
...
```

Configurez les packages linguistiques pour l'interface de Zabbix :  
```bash
sed -i '/# fr_FR.UTF-8 UTF-8/s/^# //' /etc/locale.gen
sed -i '/# en_US.UTF-8 UTF-8/s/^# //' /etc/locale.gen
locale-gen
```

Redémarrez les services liés et configurez-les pour un démarrage automatique :  
```bash
systemctl restart zabbix-server zabbix-web-service zabbix-agent2 apache2
systemctl enable zabbix-server zabbix-web-service zabbix-agent2 apache2
```

### 6 - Configuration de l'Interface de Zabbix

Depuis un poste administrateur, accédez à l'URL où Zabbix est en cours d'exécution, par exmple dans notre cas http://172.18.255.4/zabbix 

Suivez l'assistant d'installation initiale pour configurer les paramètres requis, tels que la connexion à la base de données et les informations de base sur le serveur.

Connectez-vous ensuite avec les identifiants par défaut (Admin/zabbix) pour accéder au tableau de bord initial.

Après avoir sélectionné la langue par défaut, cliquez sur Étape suivante pour accéder à la page de vérification des prérequis minimaux.

![Cature_SC_Conf_Zabbix_01](./Ressources/Annexes_S07/SC_Conf_Zabbix_01.png)
![Cature_SC_Conf_Zabbix_02](./Ressources/Annexes_S07/SC_Conf_Zabbix_02.png)
![Cature_SC_Conf_Zabbix_03](./Ressources/Annexes_S07/SC_Conf_Zabbix_03.png)
![Cature_SC_Conf_Zabbix_04](./Ressources/Annexes_S07/SC_Conf_Zabbix_04.png)
![Cature_SC_Conf_Zabbix_05](./Ressources/Annexes_S07/SC_Conf_Zabbix_05.png)

