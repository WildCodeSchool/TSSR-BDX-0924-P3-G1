# Guide Utilisateur FreePBX

Ce guide détaille l'utilisation de l'interface Web FreePBX pour gérer les fonctionnalités courantes, y compris l'importation d'utilisateurs depuis un Active Directory.

## 1 - Accès à l’interface Web

1. Ouvrez un navigateur Web et accédez à :
   ```
   http://172.18.255.10/admin
   ```
2. Connectez-vous avec les identifiants administrateur définis lors de l’installation.

## 2 - Création et Gestion des Extensions

### Ajouter une extension SIP
1. Accédez à **Admin -> Extensions**
2. Cliquez sur **Ajouter une extension SIP**
3. Remplissez les champs suivants :
   - **User Extension** : Numéro d’extension (ex: 101)
   - **Display Name** : Nom de l’utilisateur
   - **Secret** : Mot de passe SIP
4. Cliquez sur **Submit**, puis sur **Apply Config**

## 3 - Configuration d’un Trunk SIP
1. Allez dans **Connectivity -> Trunks**
2. Cliquez sur **Add Trunk**
3. Remplissez les champs :
   - **Nom du Trunk**
   - **Hostname / IP du fournisseur SIP**
   - **Authentification SIP** (Nom d’utilisateur et mot de passe)
4. Enregistrez et appliquez les modifications

## 4 - Importation des utilisateurs depuis Active Directory

### Étape 1 : Activer le module LDAP
1. Accédez à **Admin -> Module Admin**
2. Recherchez **User Management** et assurez-vous qu’il est installé
3. Si nécessaire, installez le module **LDAP**

### Étape 2 : Configurer la connexion à Active Directory
1. Allez dans **Admin -> User Management**
2. Cliquez sur **Directory** puis **Add Directory**
3. Remplissez les champs suivants :
   - **Nom** : Active Directory
   - **Type** : LDAP
   - **Host** : Adresse IP ou domaine du serveur AD
   - **Base DN** : Ex: `DC=echotech-solutions,DC=lan`
   - **Bind DN** : `CN=Admin,DC=echotech-solutions,DC=lan`
   - **Mot de passe** : Mot de passe de l’admin AD
   - **Filter** : `(objectClass=user)`
4. Cliquez sur **Submit**, puis sur **Apply Config**

### Étape 3 : Importer les utilisateurs
1. Allez dans **Admin -> User Management -> Users**
2. Sélectionnez **Import Users**
3. Choisissez l'annuaire AD précédemment configuré
4. Sélectionnez les utilisateurs à importer et cliquez sur **Import**

## 5 - Configuration des Permissions Utilisateurs
1. Accédez à **Admin -> User Management**
2. Sélectionnez un utilisateur importé
3. Allez dans **Permissions** et attribuez les droits d'accès aux fonctionnalités
4. Enregistrez et appliquez la configuration

## 6 - Test et Dépannage
- Vérifiez si les utilisateurs peuvent se connecter avec leur extension
- Testez les appels internes et externes
- Consultez les logs en cas de problème :
  ```bash
  tail -f /var/log/asterisk/full
  ```

## 7 - Conclusion
Vous avez maintenant un guide pour gérer FreePBX depuis son interface Web et importer des utilisateurs depuis un Active Directory.
