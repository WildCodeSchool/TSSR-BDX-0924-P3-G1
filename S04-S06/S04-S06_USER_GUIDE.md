# Guide d'utilisation de Zabbix

Ce guide fournit les étapes essentielles pour utiliser et configurer Zabbix, une solution de supervision open-source.

---

## 1 - Accéder à l'interface Zabbix

Une fois Zabbix installé et configuré, accédez à son interface web en entrant l'URL suivante dans un navigateur :

```
http://172.18.255.4/zabbix
```

Connectez-vous avec les identifiants par défaut :
- **Utilisateur** : `Admin`
- **Mot de passe** : `zabbix`

Il est recommandé de modifier le mot de passe après la première connexion.

---

## 2 - Ajouter un hôte (serveur ou équipement) au Dashboard

### Étape 1 : Accéder à la section "Configuration des hôtes"
Dans le menu principal, allez dans :
```
Configuration -> Hôtes
```
Cliquez sur **Créer un hôte**.

### Étape 2 : Renseigner les informations de base
- **Nom de l'hôte** : Identifiant du serveur (ex: `Serveur_Web`)
- **Nom visible** : Nom affiché dans l'interface
- **Groupe** : Ajoutez l'hôte à un groupe existant ou créez-en un nouveau
- **Interfaces** :
  - Type : `Agent Zabbix`, `SNMP`, `JMX`, `IPMI` selon le type de supervision
  - Adresse IP de l'hôte : Exemple `192.168.1.10`
  - Port par défaut : `10050` pour Zabbix Agent

### Étape 3 : Associer un modèle de supervision
Dans l'onglet **Templates** :
- Cliquez sur **Ajouter un modèle**
- Sélectionnez un modèle adapté (ex: `Template OS Linux` pour un serveur Linux)

### Étape 4 : Appliquer et vérifier
- Cliquez sur **Ajouter** pour enregistrer l'hôte
- Vérifiez que l'hôte apparaît dans le tableau avec le statut **Actif**

---

## 3 - Types de configuration de base

### Surveillance par agent Zabbix
L'agent Zabbix permet de collecter des métriques détaillées sur l'hôte supervisé.
- Vérifiez que `zabbix-agent2` est installé et actif sur l'hôte supervisé :

```bash
systemctl status zabbix-agent2
```
- Configurez `/etc/zabbix/zabbix_agent2.conf` pour pointer vers le serveur Zabbix :

```bash
Server=172.18.255.4
ServerActive=172.18.255.4
Hostname=Serveur_Web
```

- Redémarrez le service :
```bash
systemctl restart zabbix-agent2
```

### Surveillance via SNMP
Pour surveiller un équipement réseau, activez et configurez le protocole SNMP :
1. Vérifiez que l'équipement supporte SNMP et qu'il est activé
2. Ajoutez une interface SNMP lors de l'ajout de l'hôte dans Zabbix
3. Associez un modèle SNMP existant (ex: `Template SNMP Device`)

### Surveillance via HTTP (Web Monitoring)
Permet de superviser la disponibilité d'un site web :
1. Accédez à **Configuration -> Hôtes**
2. Sélectionnez un hôte et ouvrez l'onglet **Web Scenarios**
3. Cliquez sur **Créer un scénario** et définissez :
   - Nom du scénario
   - URL de la page à tester
   - Méthode HTTP (GET, POST, etc.)
4. Ajoutez des étapes de test et définissez des seuils d'alerte

---

## 4 - Création d'une alerte et notification

### Étape 1 : Configurer les médias de notification
1. Allez dans **Administration -> Médias**
2. Ajoutez un nouveau média (ex: email, Slack, Telegram)
3. Renseignez les paramètres (ex: serveur SMTP pour les emails)

### Étape 2 : Définir une action d'alerte
1. Accédez à **Configuration -> Actions**
2. Cliquez sur **Créer une action**
3. Définissez :
   - Nom de l’action (ex: "Alerte Serveur Down")
   - Conditions de déclenchement (ex: `hôte indisponible depuis 5 min`)
   - Opérations : envoyer une notification à un utilisateur ou exécuter un script

---

## 5 - Personnalisation des tableaux de bord

### Ajouter un widget
1. Accédez à **Monitoring -> Dashboard**
2. Cliquez sur **Modifier le tableau de bord**
3. Ajoutez un **widget** (graphique, liste des événements, carte réseau...)
4. Configurez les paramètres et validez

### Créer un tableau de bord personnalisé
1. Accédez à **Monitoring -> Dashboard**
2. Cliquez sur **Créer un tableau de bord**
3. Ajoutez des widgets adaptés aux besoins de supervision

---

## 6 - Rapports et analyses

### Générer un rapport sur la disponibilité
1. Accédez à **Monitoring -> Rapports**
2. Sélectionnez "Disponibilité des services"
3. Filtrez par période et par hôte
4. Exportez les données au format CSV ou PDF

### Consulter les logs et événements
1. Accédez à **Monitoring -> Journal d'événements**
2. Filtrez par type d’événement, période et gravité

---

## Conclusion
Ce guide présente les fonctionnalités de base de Zabbix. Pour une configuration avancée, consultez la documentation officielle : [https://www.zabbix.com/documentation/current/fr/](https://www.zabbix.com/documentation/current/fr/)
