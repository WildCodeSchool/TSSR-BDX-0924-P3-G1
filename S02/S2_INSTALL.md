==============================

# Guide Aministrateur

==============================

## Pré-Requis techniques

| **Système**  | **Windows Server 2022 Graphic** | **Windows Server 2022 Core** |
| ------------ | ------------------------------- | ---------------------------- |
| **HostName** | SRV-DC-01                       | SRV-DC-02                    |
| **Login**    | Administrator                   | Administrator                |
| **Password** | Azerty1\*                       | Azerty1\*                    |

## Installation de l'ADDS, DHCP et DNS sur Windows Server Graphic

1. Cliquer sur _Manage_ puis _Add Roles and Features_.
<P ALIGN="center"><IMG src="Annexes S02\Capture d'écran 2024-11-28 140642.png" width=600></P>

2. Sélectionner _Role-based or feature-based installation_.
3. Sélectionner le serveur.
4. Sélectionner _Active Directory Domain Services_ puis cliquer sur l'option `Add features`.
5. De la même manière, cocher sur _DHCP Server_ puis cliquer sur l'option `Add features`.
6. Cocher ensuite sur _DNS Server_ puis cliquer sur l'option `Add features`.

<P ALIGN="center"><IMG src="Annexes S02\Capture d'écran 2024-11-28 142055.png" width=600></P>

7. Cliquer sur `Next` jusqu'à la fin de l'assistant d'installation puis cliquer sur `Install`. S'il ne le fait pas automatiquement, redémarrer l'ordinateur afin qu'il prenne en charge ses nouveaux rôles.
