=========================================

# TSSR-BDX-2409-P3-G1 BILLU

=========================================

## 1. Mise en contexte

Dans le cadre de notre projet 3 au sein de la Wild Code School, nous avons objectif principal de créer l'infrastructure réseau et système d'une entreprise, **BillU**.

## 2. Présentation du projet et objectifs

**Qui sommes nous ?**
**BillU** est une filiale du groupe international RemindMe, qui a plus de 2000 collaborateurs dans le monde. Elle est spécialisée dans le développement de logiciels, entre-autre de facturation. Le groupe prévoit un budget conséquent pour développer cette filiale. Le siège Français se situe à Paris (dans le 20 eme arrondissement).
Avec une équipe talentueuse de développeurs et d'experts en finance, elle est déterminée à fournir des logiciels de pointe qui simplifient les processus financiers et améliorent l'efficacité opérationnelle pour ses clients.
BillU comprend actuellement 167 personnes.

## 3. Présentation de l'équipe, rôles par sprint - Les 12 Sprints

### Le Sprint 1 - 19/11/2024 au 29/11/2024

| Équipe  |    Rôle    | Schéma du réseau | Convention de nommage | Mise en place outils de gestion | Liste de matériels |
| :-----: | :--------: | :--------------: | :-------------------: | :-----------------------------: | :----------------: |
|         |            |    Principal     |      Secondaire       |            Principal            |     Secondaire     |
|  Hamza  | Technicien |        X         |                       |                                 |         X          |
| Anthony |     PO     |        X         |           X           |                X                |         X          |
|  Fred   |     SM     |        X         |                       |                X                |                    |
|         |            |  100% le 29/11   |     100% le 23/11     |          100% au 22/11          |   100% au 22/11    |

Nous avons eu quelques difficultés à faire le shéma réseau avec les connaissances que nous avions. Nous avons fait le choix d'attribuer à chaque département un VLAN.

### Le Sprint 2-6 - 02/01/2025 au 10/01/2025

| Équipe  |    Rôle    |    Schéma du réseau   | Création Win-Serv GUI avec ADDS, DHCP, DNS | Création Win Core DC et réplication | Création Debian Serv sous le domaine |
| :-----: | :--------: | :-------------------: | :----------------------------------------: | :---------------------------------: | :----------------------------------: |
|         |            |       Principal       |                 Principal                  |              Principal              |              Principal               |
|  Hamza  | Technicien |                       |                                            |                                     |                  X                   |
| Anthony |     PO     |            X          |                                            |                  X                  |                                      |
|  Fred   |     SM     |                       |                     X                      |                                     |                                      |
|         |            |     100% le 29/11     |               100% le 23/11                |            100% au 22/11            |            100% au 22/11             |

Suite...

| Équipe  |  Rôle      | Gestion de l'arborescence AD |        GLPI       | Intégration des utilisateurs - Script |        GPO        |
| :-----: | :--------: | :--------------------------: | :---------------: | :-----------------------------------: | :---------------: |
|         |            |          Principal           |     Principal     |               Principal               |     Principal     |
|  Hamza  | Technicien |                              |         X         |                                       |                   |
| Anthony |     PO     |                              |                   |                                       |         X         |
|  Fred   |     SM     |              X               |                   |                   X                   |         X         |
|         |            |        100% le 03/01         |    50% le 09/01   |             100% au 07/01             |   33% au 10/01    |

Nous avons accumulé beaucoup de retard nous obligeant à revoir nos objectifs et ne garder que les principaux. Le choix a été fait en début de sprint de tout recommencer de puis le début pour repartir sur de bonnes bases concernant nos VM sur Proxmox avec une nomenclature adaptée, et une configuration respectant les objectifs définis. Nous avons aussi dû réévaluer la conception de notre réseau. Concernant l'intégration des utilisateurs dans l'AD, nous avons rencontré quelques problèmes pour l'automatisation avec un script. L'intégration des utilisateurs dans les UO fonctionne en script mais pas l'intégration dans les groupes (services). L'installation de GLPI s'est correctement déroulée main il subsiste encore quelques problèmes concernant la configuration. Gérer notre temps a été notre plus grande problématique, un retard encore subsiste, toutes les GPO n'ont pas encore été crées et l'installation et la configuration de GLPI doivent être finalisées.

