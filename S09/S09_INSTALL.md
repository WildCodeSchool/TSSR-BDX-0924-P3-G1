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
