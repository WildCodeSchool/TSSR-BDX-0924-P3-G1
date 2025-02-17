## Tableau de synthèse des éléments du schéma

1. ID du matériel
2. Nom du matériel dans la GUI Proxmox
3. Nom du matériel dans la machine
4. Type d'objet Proxmox (VM ou CT)
5. OS
6. Fonction principal
7. N° de carte réseau (vmbr)
8. Adresse IP, CIDR
9. Nombre de disques, et par disque :
   1. Taille totale (en Go)
   2. Espace libre (en Go)
   3. Espace libre (en %)
10. RAM :
    1. Taille totale (En Go)
    2. Taille utilisée, en moyenne (en %)

Format :

- Tableau markdown dans Github
- Fichier **Synthese_Materiel.md** dans le dossier de la dernière semaine de projet 3.

| ID                        | 1041                    | 1042                | 1043               | 1044            | 1046            | 1048            | 1049            | 1052                    | 1053               | 1054            | 1055            | 1059                |
| ------------------------- | ----------------------- | ------------------- | ------------------ | --------------- | --------------- | --------------- | --------------- | ----------------------- | ------------------ | --------------- | --------------- | ------------------- |
| **Nom dans Proxmox**      | G1-SRV-DC-01            | G1-SRV-DC-02        | G1-SRV-SUP-01      | G1-PC-DEV-01    | G1-SRV-MAIL-01  | G1-SRV-GLPI-01  | G1-SRV-WEB-01   | G1-SRV-WSUS-01          | G1-SRV-PBX-01      | G1-PC-FIN-01    | PC-DIR-01       | G1-PC-DSI-A1        |
| **Nom dans la machine**   | Thor                    | IronMan             | SpiderMan          | PC-DEV-01       | Hulk            | DeadPool        | Wolverine       | Thanos                  | Flash              | PC-FIN-01       | PC-DIR-01       | PC-DSI-A1           |
| **Type d'objet Proxmox**  | VM                      | VM                  | VM                 | VM              | VM              | VM              | VM              | VM                      | VM                 | VM              | VM              | VM                  |
| **OS**                    | Windows Server GUI 2022 | Windows Server Core | Debian 12.8        | Windows 10      | Debian 12.8     | Debian 12.8     | Debian 12.8     | Windows Server GUI 2022 | Debian 12.8        | Windows 10      | Windows 10      | Windows 10          |
| **Fonction Principale**   | ADDS/DHCP/DNS           | ADDS Réplication    | Supervision Zabbix | Machine cliente | Serveur Mail    | GLPI            | Serveur Web     | Mises à jour-WSUS       | Téléphonie-FreePBX | Machine cliente | Machine cliente | PC d'administration |
| **N° de carte réseau**    | vmbr1025                | vmbr1025            | vmbr1025           | vmbr1025        | vmbr1025        | vmbr1025        | vmbr1040        | vmbr1025                | vmbr1025           | vmbr1025        | vmbr1025        | vmbr1025            |
| **Adresse IP, CIDR**      | 172.18.255.1/16         | 172.18.255.2/16     | 172.18.255.4/16    | 172.18.10.7/16  | 172.18.255.5/16 | 172.18.255.3/16 | 172.18.255.9/16 | 172.18.255.7/16         | 172.18.10.0/16     | 172.18.10.1/16  | 172.18.10.2/16  | 172.18.10.6/16      |
| **Nombre de disques**     | 3                       | 1                   | 1                  | 1               | 1               | 1               | 1               | 2                       | 1                  | 1               | 1               | 1                   |
| **Taille Totale (Go)**    | 132                     | 32                  | 32                 | 50              | 32              | 32              | 32              | 82                      | 32                 | 50              | 50              | 50                  |
| **Espace libre (Go / %)** |                         |                     |                    |                 |                 |                 |                 |                         |                    |                 |                 |                     |
| **RAM Totale**            | 4Go                     | 2Go                 | 4Go                | 4Go             | 2Go             | 2Go             | 2Go             | 4Go                     | 2Go                | 4Go             | 4Go             | 4Go                 |
| **RAM (Go et %)**         | 4Go 59,05%              | 2Go 42,05%          | 4Go 47,53%         | 4Go 80,86%      | 2Go 88,32%      | 2Go 41,93%      | 2Go 8,38%       | 4Go 52,60%              | 2Go 81,40%         | 4Go             | 4Go             | 4Go 87,61%          |
