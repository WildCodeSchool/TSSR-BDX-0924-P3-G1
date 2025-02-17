# Installation et Configuration de FreePBX

Ce guide détaille l'installation et la configuration d'un serveur FreePBX dans l'infrastructure de Billu.com.

## 1 - Objectif
Installer et configurer un serveur FreePBX avec une adresse IP fixe `172.18.255.10` pour gérer la téléphonie VoIP.

## 2 - Pré-requis
- Machine dédiée avec FreePBX installé
- Accès administrateur à l'interface Web FreePBX
- Connexion Internet pour télécharger les mises à jour

## 3 - Configuration Initiale de FreePBX

### Étape 1 : Accéder à l’interface Web
Accédez à FreePBX via un navigateur :
```
http://172.18.255.10/admin
```
Suivez l’assistant d’installation pour configurer :
- **Identifiants administrateur**
- **Paramètres réseau**
- **Extensions et trunks**

### Étape 2 : Configurer les paramètres réseau
1. Connectez-vous à l'interface Web FreePBX
2. Allez dans **Admin -> System Admin -> Network Settings**
3. Définissez l’adresse IP statique : `172.18.255.10`
4. Appliquez les modifications et redémarrez le système si nécessaire

## 4 - Configuration des Extensions et Trunks

### Étape 1 : Ajouter une extension SIP
1. **Admin -> Extensions**
2. Cliquez sur **Ajouter une extension SIP**
3. Définissez :
   - Numéro d'extension (ex: 101)
   - Mot de passe SIP
   - Code PIN de messagerie
4. Enregistrez et appliquez les modifications

### Étape 2 : Configurer un Trunk SIP
1. **Connectivity -> Trunks**
2. Cliquez sur **Add Trunk**
3. Définissez les informations de votre fournisseur SIP
4. Appliquez la configuration

## 5 - Vérification et Tests
- Testez une connexion SIP avec un softphone (ex: Zoiper, Linphone)
- Vérifiez la connectivité en appelant une autre extension
- Consultez les logs en cas de problème :
```bash
tail -f /var/log/asterisk/full
```

## 6 - Sécurisation du Serveur
- Activer **Fail2Ban** pour bloquer les tentatives de connexion frauduleuses
- Restreindre les accès SSH et interface Web aux IPs autorisées
- Modifier les ports SIP si nécessaire

## 7 - Sauvegarde et Maintenance
- Sauvegardez la configuration via **Admin -> Backup & Restore**
- Planifiez des mises à jour régulières via **Admin -> System Admin -> Updates**

## 8 - Conclusion
Votre serveur FreePBX est maintenant installé et configuré pour gérer la téléphonie VoIP de votre entreprise.
