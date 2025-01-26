==============================

# P3-G1 BILLU

==============================

# Mise en place d'un serveur de gestion des mises à jour **WSUS**

## Pré requis de la machine 
- Une Vm avec le role  gestionnaire serveur 
- Nom de la machine : `Thanos`
- Adresse IP : `172.18.255.6`
- DNS : `172.18.255.1`
- Domaine : `billu.com`



## Installation du Role  **WSUS** sur la machine

## Étape 1 : Préparer le Serveur
1. Assurez-vous que le serveur est à jour et intégré au domaine `Billu.com`.
   
2. Créez une partition dédiée pour stocker les mises à jour (par exemple, `D:\WSUS`).

## Étape 2 : Installer le Rôle WSUS
1. Ouvrez le **Gestionnaire de serveur**.
2. Cliquez sur **Gérer** puis **Ajouter des rôles et fonctionnalités**.
3. Suivez l'assistant jusqu'à l'étape **Sélection des rôles de serveur**.
4. Sélectionnez **Windows Server Update Services** **WSUS**
5. Ajoutez les fonctionnalités nécessaires 
6. Suivez les instructions pour terminer l'installation

## Étape 3 Configuration du serveur WSUS 

1. Une fois que vous êtes sur l'interface de WSUS, sélectionnez la langue souhaitée, puis cliquez sur "Suivant".
2. On clique sur start connecting
3. On poursuit avec le choix de langue pour faire les mises à jour
4. Sélectionnez les produits pour lesquels il est nécessaire de récupérer les mises à jour.
5. nous sélectionnons le type de mise à jour que nous souhaitons opter pour.
6. on choisi qu'elle frequance  selon le besoin et on clique sur finish pour terminer l'installation et tous se passe bien on doit arriver sur la console de serveur WSUS 















