# TSSR-2409-P3-G1-BuildYourInfra-BillU

### **Installation**

✔️ **Pré-requis: 1 Go de RAM et 20 Go de disque dur**

L'ISO peut se récupérer à cette adresse : https://www.freepbx.org/downloads/

Au démarrage de la VM, dans la liste, choisir la version recommandée.
<P ALIGN="center"><IMG src="..\Ressources/Annexes_S09/SC.freePBX_instalation_01 .png" width=500></P>



Puis sélectionner `Graphical Installation - Output to VGA`.
<P ALIGN="center"><IMG src="..\Ressources\Annexes_S09/SC_freePBX_installation_02.png" width=500></P>


Enfin choisir `FreePBX Standard`
<P ALIGN="center"><IMG src="..\Ressources/Annexes_S09/SC_FreePBX_installation_03.png" width=500></P>

Pendant l'installation, il faut configurer le mot de passe root (`Root password is not set` s'affiche).
<P ALIGN="center"><IMG src="..\Ressources/Annexes_S09/SC_freePBX_installation_04.png" width=500></P>



Cliquer sur `ROOT PASSWORD` et entrer un mot de passe (robuste, est-il besoin de le préciser ?) pour le compte `root`.

:warning: ***Le clavier est en anglais donc attention aux lettres des touches du clavier QWERTY !***

Une fois l'installation terminée, et au redémarrage de la machine, se connecter en `root` et changer la langue du clavier en `français` en indiquant 
les commandes suivantes : 

``` bash
localectl set-locale LANG=fr_FR.utf8
localectl set-keymap fr
localectl set-x11-keymap fr
```

<P ALIGN="center"><IMG src="..\Ressources/Annexes_S09/SC_freePBX_INstallation_05.png" width=500></P>

Puis changer la configuration IP en éxécutant : 

``` bash
nano /etc/sysconfig/network-scripts/ifcfg-eth0
```
<P ALIGN="center"><IMG src="..\Ressources/Annexes_S09/SC.freePBX_Installation_6.png" width=500></P>


**Connexion WEB**
A partir d'un navigateur web, se connecter sur l'adresse du serveur afin d'arriver sur l'interface de gestion de FreePBX. Ici, le DNS a été pointé pour pouvoir y en indiquant l'URLhttp://freepbx

<P ALIGN="center"><IMG src="..\Ressources/Annexes_S09/SC.freePBX_graphique_2.png" width=500></P>

<P ALIGN="center"><IMG src="..\Ressources/Annexes_S09/SC_creationde compte_freepbx .png" width=500></P>
Indiquez également une adresse e-mail pour les notifications et cliquez sur Setup System.

Dans la fenêtre suivante, cliquez sur FreePBX Administration et reconnectez-vous en root.

<P ALIGN="center"><IMG src="..\Ressources/Annexes_S09/SC_freepbx_login.png" width=500></P>
<P ALIGN="center"><IMG src="..\Ressources/Annexes_S09/SC_freepbx_login02.png" width=500></P>

Laissez les langages par défaut et cliquez sur Submit.
<P ALIGN="center"><IMG src="..\Ressources/Annexes_S09/SC_freePBX_Langue .png" width=500></P>

À la fenêtre d'activation du pare-feu, cliquez sur Abort.
<P ALIGN="center"><IMG src="..\Ressources/Annexes_S09/SC_freepbx_firewall.png" width=500></P>
<P ALIGN="center"><IMG src="..\Ressources/Annexes_S09/SC_freepbx_firewall_2.png" width=500></P>


À la fenêtre d'essai de SIP Station, cliquez sur Not Now.
<P ALIGN="center"><IMG src="..\Ressources/Annexes_S09/SC_freepbx_dashbord_01.png" width=500></P>


Une fois sur le tableau de bord, cliquez sur Apply Config (en rouge) pour valider toutes les actions précédentes.

**Activation du serveur**

* Cette activation n'est pas obligatoire, mais elle permet d'avoir accès à l'ensemble des fonctionnalités du serveur.
* Allez dans le menu Admin  puis System Admin.
* Un message indique que le système n'est pas activé.
* Dans la fenêtre qui s'affiche, cliquez surActivate
* Entrez une adresse e-mail et attendez quelques instants.
* Dans la fenêtre qui s'affiche, renseignez-vous sur les différentes informations,
* et : Verser Which best describes you:I use your products and services with my Business(s) and do not want to resell it

   Pour Do you agree to receive product and marketing emails from Sangoma ?     cocherNo

* Cliquer surCreate
* Dans la fenêtre d'activation, cliquez sur Activateet attendez que l'activation se fasse.
* Dans les fenêtres qui s'affichent, cliquez sur Skip
* Mise à jour des modules du serveur

La fenêtre de mise à jour des modules va s'afficher automatiquement.

* Cliquer sur Update Now.
* Une fois que tout est terminé, cliquez sur Apply config.

* Il peut y avoir des erreurs sur les serveurs suite à la mise à jour des modules et dans ce cas, l'accès au serveur ne se fait pas.

* Les modules incriminés sont précis et il faut les réinstaller et les activer.

* Dans ce cas, sur le serveur en CLI, exécuter les commandes suivantes :

``` bash
fwconsole ma install <module>
fwconsole ma enable <module>
Par exemple pour les modules userman, voicemail, et sysadmin:
```




``` bash
fwconsole ma install userman
fwconsole ma enable userman
fwconsole ma install voicemail
fwconsole ma enable voicemail
fwconsole ma install sysadmin
fwconsole ma enable sysadmin
```


Se rendre sur le serveur en CLI et exécuter la commande suivante pour faire la mise à jour du serveur :

``` bash
yum update
```

* Et enfin, redémarrez le serveur

**Mise à jour complémentaire des modules**

* Se connecter en rootvia la console web, et vse rendre dans le Dashboard pour voir s'il manque des modules.

* Se rendre dans le menu Adminpuis Modules Admin, et dans l'onglet Module Update.

* Dans la fenêtre qui s'affiche, dans la colonne Status, sélectionnez ceux qui sont en Disabled, Pending Upgrade...et qui ont une licence GPL.

* Sélectionnez alors le boutonUpgrade to ....

* Cliquer sur Process.

* Dans la fenêtre qui apparaît, cliquez sur Confirm.

* Quand tout est terminé, cliquez sur Apply config.

**Création d'utilisateurs et de lignes sur le serveur**

* Se rendre dans le menu ApplicationspuisExtensions
<P ALIGN="center"><IMG src="..\Ressources/Annexes_S09/SC_freepbx_compte_users.png" width=500></P>
  

* Aller sur l'onglet SIP [chan_pjsip] Extensionspuis choisir des utilisateurs de l'AD ( Malki Hamza et Anthony Vidal  pour l'exemple)

<P ALIGN="center"><IMG src="..\Ressources/Annexes_S09/SC_freepbx_telephonie .png" width=500></P>










