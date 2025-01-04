==============================

# P3-G1 BILLU

==============================

## Pré-Requis techniques

| **Système**  | **Windows Server 2022 Graphic** | **Windows Server 2022 Core** |
| ------------ | ------------------------------- | ---------------------------- |
| **HostName** | SRV-DC-01                       | SRV-DC-02                    |
| **Login**    | Administrator                   | Administrator                |
| **Password** | Azerty1\*                       | Azerty1\*                    |

Toutes les VM sont installées sur l'hyperviseur Proxmox

## Installation d'une machine virtuelle Windows Server 2022 Graphic - Thor

A partir de templates mis à notre disposition, nous pouvons installer nos machines. Pour la Windows Server 2022, voici la marche à suivre.
1. Choisir le template *1098-Template-Windows-Server-2022* puis clic-droit `Clone`
2. Choisir le **VM ID** entre 1041 et 1059.
3. Dans **Name**, respecter la nomenclature G1-"Nom de la machine". En l'occurence ici, G1-SRV-DC-01.
4. Dans **Ressource Pool**, choisir `TSSR-2409-BDX-P3-G1-`.
5. Dans **Mode**, sélectionner `Full Clone`.
6. Dans l'onglet **Hardware**, cliquer sur `Add` et ajouter un `Network Device`. Brige : vmbr1025 BillU (LAN) / Model : Intel E1000 et décocher `Firewall`.
7. Lancer le serveur, puis configurer l'adresse IPv4 comme suit :

- **Adresse IP**  : 172.168.255.1    
- **Masque**      : 255.255.0.0       
- **Passerelle**  : 172.168.255.254   

## Installation de l'ADDS, DHCP et DNS sur Windows Server Graphic

1. Cliquer sur _Manage_ puis _Add Roles and Features_.
<P ALIGN="center"><IMG src="..\Ressources\Annexes S02\Capture d'écran 2024-11-28 140642.png" width=500></P>

2. Sélectionner _Role-based or feature-based installation_.
3. Sélectionner le serveur.
4. Sélectionner _Active Directory Domain Services_ puis cliquer sur l'option `Add features`.
5. De la même manière, cocher sur _DHCP Server_ puis cliquer sur l'option `Add features`.
6. Cocher ensuite sur _DNS Server_ puis cliquer sur l'option `Add features`.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S02\Capture d'écran 2024-11-28 142055.png" width=500></P>

7. Cliquer sur `Next` jusqu'à la fin de l'assistant d'installation puis cliquer sur `Install`. S'il ne le fait pas automatiquement, redémarrer l'ordinateur afin qu'il prenne en charge ses nouveaux rôles.

## Création des Unités Organisationnelles au sein de l'AD
Selon le schéma établit, nous pouvons créer nos **UO**. Une UO *France* est crée afin d'anticiper une éventuelle extension de l'entreprise dans un autre pays. Une UO *Paris* est crée pour anticiper un extension dans une autre ville de France et de la même manière, une UO *20-Paris* est crée pour anticiper une extension dans un autre arrondissement de Paris. Ensuite, les UO correspondent aux différents départements de BillU et des groupes sont aussi créés correspondants aux différents services dans les départements.

<P ALIGN="center"><IMG src="..\Ressources\Annexes S02\Capture d'écran 2024-11-28 142055.png" width=500></P>
