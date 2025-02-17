# Guide Utilisateur - VPN Site-à-Site avec pfSense et IPsec

## 1 - Introduction
Ce guide utilisateur fournit des instructions sur l'utilisation et la gestion du VPN site-à-site configuré entre Billu.com et EchoTech-Solutions.lan via pfSense et IPsec. Il couvre la connexion, le dépannage et la surveillance du VPN.

## 2 - Accéder à l'interface de gestion
Pour administrer le VPN, connectez-vous à l'interface Web de pfSense :

- **Billu.com** : `https://10.0.0.2`
- **EchoTech-Solutions.lan** : `https://10.0.0.3`

Connectez-vous avec vos identifiants administrateurs.

## 3 - Vérification de l'état du VPN
### 3.1 - Vérifier la connexion IPsec
1. Accédez à **Status -> IPsec**
2. Vérifiez que la connexion est **établie**.
3. Si le tunnel est **down**, essayez de le redémarrer.

### 3.2 - Tester la connectivité
Depuis un poste du réseau Billu.com :
```bash
ping 10.10.0.7
```
Depuis un poste du réseau EchoTech-Solutions.lan :
```bash
ping 172.18.255.1
```
Si les pings échouent, voir la section dépannage.

## 4 - Dépannage
### 4.1 - Redémarrer le tunnel VPN
1. Accédez à **VPN -> IPsec -> Status**.
2. Cliquez sur **Disconnect** puis **Connect** pour redémarrer le tunnel.

### 4.2 - Vérifier les journaux
1. Allez dans **Status -> System Logs -> IPsec**.
2. Recherchez des erreurs et ajustez la configuration si nécessaire.

### 4.3 - Vérifier les règles de pare-feu
1. Allez dans **Firewall -> Rules -> IPsec**.
2. Vérifiez que le trafic entre `172.18.0.0/16` et `10.10.0.0/16` est autorisé.

## 5 - Gestion et maintenance
### 5.1 - Ajouter de nouvelles connexions VPN
Si une nouvelle connexion doit être ajoutée, suivez les étapes de la documentation d'installation et assurez-vous que les nouvelles sous-réseaux sont autorisés.

### 5.2 - Sauvegarde de la configuration
1. Accédez à **Diagnostics -> Backup & Restore**.
2. Cliquez sur **Download Configuration** pour sauvegarder le fichier de configuration actuel.

### 5.3 - Mise à jour de pfSense
1. Allez dans **System -> Update**.
2. Vérifiez les mises à jour disponibles et appliquez-les si nécessaire.

## 6 - Contact et support
En cas de problème persistant, contactez l'administrateur réseau de votre société pour assistance.

---

## Annexe
- [Documentation officielle pfSense](https://docs.netgate.com/pfsense/en/latest/)
- [Forum de support pfSense](https://forum.netgate.com/)
