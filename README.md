=========================================

# Documentation Générale

=========================================

## Mise en contexte

Dans le cadre de notre projet 3 au sein de la Wild Code School, nous avons objectif principal de créer l'infrascture réseau et système d'une entreprise, **BillU**.

## Présentation du projet et objectifs

**Qui sommes nous ?**
**BillU** est une filiale du groupe international RemindMe, qui a plus de 2000 collaborateurs dans le monde. Elle est spécialisée dans le développement de logiciels, entre-autre de facturation. Le groupe prévoit un budget conséquent pour développer cette filiale. Le siège Français se situe à Paris (dans le 20 eme arrondissement).
Avec une équipe talentueuse de développeurs et d'experts en finance, elle est déterminée à fournir des logiciels de pointe qui simplifient les processus financiers et améliorent l'efficacité opérationnelle pour ses clients.
BillU comprend actuellement 167 personnes.

## Présentation de l'équipe, rôles par sprint

| **Rôles**     | **Product Owner** | **Scrum Master** | **Technicien** |
| ------------- | ----------------- | ---------------- | -------------- |
| **Semaine 1** | Anthony           | Fred             | Hamza          |
| **Semaine 2** | Anthony           | Fred             | Hamza          |
| **Semaine 3** | Anthony           | Fred             | Hamza          |
| **Semaine 4** | Anthony           | Fred             | Hamza          |
| **Semaine 5** | Anthony           | Fred             | Hamza          |
| **Semaine 6** | Anthony           | Fred             | Hamza          |

## 3- Les 12 Sprints

### Le Sprint 1 - 19/11/2024 au 29/11/2024

| Équipe  |  Rôle  | Schéma du réseau | Convention de nommage | Mise en place outils de gestion | Liste de matériels |
| :-----: | :----: | :--------------: | :-------------------: | :-----------------------------: | :----------------: |
|         |        |    Principal     |      Secondaire       |            Principal            |     Secondaire     |
|  Hamza  | Membre |        X         |                       |                                 |         X          |
| Anthony |   PO   |        X         |           X           |                X                |         X          |
|  Fred   |   SM   |        X         |                       |                X                |                    |
|         |        |  100% le 29/11   |     100% le 23/11     |          100% au 22/11          |   100% au 22/11    |

Nous avons eu quelques difficultés à faire le shéma réseau avec les connaissances que nous avions. Nous avons opté pour attribuer à chaque département un VLAN. Le diagramme réseau se trouve [ici](Ressources/Annexes S01/S01_diagramme_reseau_billu.jpg).

### Le Sprint 2-6 - 02/01/2025 au 10/01/2025

| Équipe  |  Rôle  | Schéma du réseau | Création Win-Serv GUI avec ADDS, DHCP, DNS | Création Win Core DC et réplication | Création Debian Serv sous le domaine |
| :-----: | :----: | :--------------: | :----------------------------------------: | :---------------------------------: | :----------------------------------: |
|         |        |    Principal     |                 Principal                  |              Principal              |              Principal               |
|  Hamza  | Membre |                  |                                            |                                     |                  X                   |
| Anthony |   PO   |        X         |                                            |                  X                  |                                      |
|  Fred   |   SM   |                  |                     X                      |                                     |                                      |
|         |        |  100% le 29/11   |               100% le 23/11                |            100% au 22/11            |            100% au 22/11             |

Suite...

| Équipe  |  Rôle  | Gestion de l'arborescence AD |     GLPI     | Intégration des utilisateurs - Script |     GPO      |
| :-----: | :----: | :--------------------------: | :----------: | :-----------------------------------: | :----------: |
|         |        |          Principal           |  Principal   |               Principal               |  Principal   |
|  Hamza  | Membre |                              |      X       |                                       |              |
| Anthony |   PO   |                              |              |                                       |      X       |
|  Fred   |   SM   |              X               |              |                   X                   |      X       |
|         |        |        100% le 03/01         | 50% le 09/01 |             100% au 07/01             | 33% au 10/01 |

Nous avons accumulé beaucoup de retard nous obligeant à revoir nos objectifs et ne garder que les principaux. Le choix a été fait en début de sprint de tout recommencer de puis le début pour repartir sur de bonnes bases concernant nos VM sur Proxmox avec une nomenclature adaptée, et une configuration respectant les objectifs définis. Nous avons aussi dû réévaluer la conception de notre réseau. Concernant l'intégration des utilisateurs dans l'AD, nous avons rencontré quelques problèmes pour l'automatisation avec un script. L'intégration des utilisateurs dans les UO fonctionne en script mais pas l'intégration dans les groupes (services). L'installation de GLPI s'est correctement déroulée main il subsiste encore quelques problèmes concernant la configuration. Gérer notre temps a été notre plus grande problématique, un retard encore subsiste, toutes les GPO n'ont pas encore été crées et l'installation et la configuration de GLPI doivent être finalisées.

## Difficultés rencontrées : problèmes techniques rencontrés
