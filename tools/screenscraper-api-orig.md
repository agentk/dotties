---
source: https://www.screenscraper.fr/webapi2.php
collected: 2025-07-06
---

﻿

Présentation de l'API

**Attention : la version 2 est en mode betatest, des modifications peuvent etre apportées a tout moment sur cette version de l'API sans préavis. Notre API vous permet d’obtenir l'intégralité des données et des médias de ScreenScraper pour l'intégrer dans vos applications : front-ends, utilitaires. Toutes nos requêtes permettent d’obtenir en retour les informations voulues au format XML, JSON ou ini.

**Qui peut utiliser l'API ?**

  
**L'API ScreenScraper ne peut être intégré que dans les applications entièrement gratuites et distribuées, ou, dans le cas contraire, avec l'autorisation préalable et les conditions dictées par l'équipe de ScreenScraper.** Tout manquement à cette règle pourra faire l’objet d’une coupure de compte, voir d’éventuelles poursuites judiciaires !  
Si vous êtes développeur et voulez intégrer notre API, [contactez-nous via le forum](https://www.screenscraper.fr/forumsujets.php?frub=12&numpage=0) pour présenter votre logiciel et obtenir vos identifiants et mot de passe à fournir à l’API pour valider vos droits d’exploitation de celle-ci

**Comment faire des requêtes a notre API ?**

  
Les demandes d’informations et/ou média à l'API ScreenScraper sont effectuées par l’appel de requêtes URL de type GET et un document XML ou json est retourné. Exemple Jeu Recherche: [https://api.screenscraper.fr/api2/jeuInfos.php?devid=xxx&devpassword=yyy&softname=zzz&ssid=test&sspassword=test&output=xml&crc=50ABC90A&systemeid=1&romtype=rom&romnom=Sonic%20The%20Hedgehog%202%20(World).zip&romtaille=749652](https://api.screenscraper.fr/api2/jeuInfos.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test&crc=50ABC90A&systemeid=1&romtype=rom&romnom=Sonic%20The%20Hedgehog%202%20\(World\).zip&romtaille=749652)**

Combien de requêtes simultanés a l'API est autorisé ?

En fonction du niveau de contribution de l'utilisateur (à la base de données ou financière) celui-ci se fait attribuer des ouvertures de « Threads ».

**Qu’est-ce qu’un « Thread » ?**

Certains logiciels de scrape, comme « Universal XML Scraper » vous permette de gagner du ‘temps de scrape’ en ne traitant pas les roms une par une, mais simultanément en parallèle. Le nombre de scrape simultané est ce que l’on appelle un « Thread ». Donc avec 4 Threads, vous scrapez vos roms 4 par 4, ce qui représente un gain de temps énorme. Par contre, cela sollicite beaucoup plus votre ordinateur et votre bande passante (il faut donc que celui-ci ai les ressources nécessaires) mais surtout, sollicite beaucoup plus la base de données et le serveur qui l’héberge. C’est pour cela que le système de « récompense » a été mis en place. Pour vous remercier de contribuer à la vie de la base de données Screenscraper on vous offre la possibilité de puiser dans ses ressources plus efficacement.

**Comment gagner des « Threads » ?**

Il existe 2 méthodes simples : - Participer à la base de données en proposant de nouvelles informations ou de nouveaux medias - Participer financièrement à l’hébergement de la base de données via Tipee ou Patreon.

**Combien puis-je gagner de « Threads » ?**

  
Consulter la [F.A.Q](faq.php) pour plus d'informations  

Combien de requêtes a l'API est autorisé par minute et par jour ?

Depuis environ le milieu de l'année 2019, un système de « Quota » a été intégré a l'API afin d'éviter la saturation de nos serveurs.

Le principe est de limiter le droit d'accés a l'API pour chaque utilisateur **par minute** et **par jour** en fonction de leur niveau et leur participation financière.

Consulter la [F.A.Q](faq.php) pour plus d'informations

Les informations de « Quota » sont renvoyées dans les données utilisateurs afin que celui-ci soit facilement intégrable et géré directement par le logiciel de scrape.

Cette gestion de « Quota » par logiciel est désormais obligatoire afin de ne pas saturer nos serveurs pour rien.

Retour d'erreurs

**Les requêtes de l'API renvoi des numeros d'erreurs HTTP en cas de problème. les voici :**

**Erreur**

**Description**

**Cause**

400

problème avec l'url

l'url d'appel a l'api ne contient aucune information

400

Il manque des champs obligatoires dans l'url

l'un des champs minimum obligatoire est manquant dans l'url d'appel a l'api

400

Erreur dans le nom du fichier rom : celui-ci contient un chemin d'accés

le nom du fichier rom envoyé est de type "!mnt!sda1!batocera!roms!..."

400

Champ crc, md5 ou sha1 erroné

Le champ crc, md5 ou sha1 n'est pas correctement formaté

400

Problème dans le nom du fichier rom

Le nom du fichier rom n'est pas conforme

401

API fermé pour les non membres ou les membres inactifs

Le Serveur est saturé (utilisation CPU>60%)

403

Erreur de login : Vérifier vos identifiants développeur !

identifiants developpeur éronnés

404

Erreur : Jeu non trouvée ! / Erreur : Rom/Iso/Dossier non trouvée !

Impossible de trouver une concordance sur la rom demandé

423

API totalement fermé

Le Serveur a de grave problème

426

Le logiciel de scrape utilisé a été blacklisté (non conforme / version obsolète)

Il faut changer de version de logiciel

429

Le nombre de threads autorisé pour le membre est atteint

Il faut reduire la vitesse de requètes

429

Le nombre de threads par minute autorisé pour le membre est atteint

Il faut reduire la vitesse de requètes

429

The maximum threads allowed to leecher users is already used

Il faut reduire la vitesse de requètes

429

The maximum threads is already used

Il faut reduire la vitesse de requètes

430

Votre quota de scrape est dépassé pour aujourd'hui !

Le membre a scraper plus de x (voir F.A.Q) roms dans la journée

431

Faite du tri dans vos fichiers roms et repassez demain !

Le membre a scraper plus de x (voir F.A.Q) roms non reconnu par ScreenScraper

Liste des requêtes

ssinfraInfos.php : Informations sur l'infrastructure ScreenScraper

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**output** : xml(par defaut),json  
Item : **serveurs** (informations serveurs ScreenScraper)

Elements Retournés :

  
**cpu1** : % d'utilisation du CPU du serveur 1 (moyenne des 5 dernières minutes)  
**cpu2** : % d'utilisation du CPU du serveur 2 (moyenne des 5 dernières minutes)  
**cpu3** : % d'utilisation du CPU du serveur 3 (moyenne des 5 dernières minutes)  
**threadsmin** : Nombre d'accés a l'api depuis la dernière minute  
**nbscrapeurs** : Nombre de scrapeurs utilisant l'api depuis la dernière minute  
**apiacces** : Nombre d'accés a l'api dans la journée en cours (GMT+1)

Status

  
**closefornomember** : API fermée pour les anonymes (non inscrits ou non identifiés) (0 : ouvert / 1 : fermé)  
**closeforleecher** : API fermée pour les membres non participant (aucune proposition validé) (0 : ouvert / 1 : fermé)

Quota

  
**maxthreadfornonmember** : Nombre maximum de threads ouverts pour les anonymes (non inscrits ou non identifiés) en même temps par l'api  
**threadfornonmember** : Nombre actuel de threads ouverts par les anonymes (non inscrits ou non identifiés) en même temps par l'api  
**maxthreadformember** : Nombre maximum de threads ouverts pour les membres en même temps par l'api  
**threadformember** : Nombre actuel de threads ouverts par les membres en même temps par l'api  
Exemple d'appel  
[https://api.screenscraper.fr/api2/ssinfraInfos.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml](https://api.screenscraper.fr/api2/ssinfraInfos.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml)  

ssuserInfos.php : Informations sur l'utilisateur ScreenScraper

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**output** : xml(par defaut),json  
**ssid** : identifiant ScreenScraper de l'utilisateur  
**sspassword** : Mot de passe ScreenScraper de l'utilisateur  
Item : **ssuser** (informations utilisateurs ScreenScraper)

Elements Retournés :

  
**id** : pseudo de l'utilisateur sur ScreenScraper  
**numid** : identifiant numérique de l'utilisateur sur ScreenScraper  
**niveau** : niveau de l'utilisateur sur ScreenScraper  
**contribution** : niveau de contribution financière sur ScreenScraper (2 = 1 Thread Supplémentaire / 3 et + = 5 Threads Supplémentaires)  
**uploadsysteme** : Compteur de contributions valides (média de système) proposés par l'utilisateur  
**uploadinfos** : Compteur de contributions valides (infos texte) proposés par l'utilisateur  
**romasso** : Compteur de contributions valides (association de rom) proposés par l'utilisateur  
**uploadmedia** : Compteur de contributions valides (média de jeu) proposés par l'utilisateur  
**propositionok** : Nombre de propositions de l'utilisateur validées par un modérateur  
**propositionko** : Nombre de propositions de l'utilisateur refusées par un modérateur  
**quotarefu** : Pourcentage de refu de proposition de l'utilisateur

Threads

  
**maxthreads** : Nombre de threads autorisés pour l'utilisateur (également indiqué pour les non-inscrits)  
**maxdownloadspeed** : Vitesse de téléchargement (en Ko/s) autorisée pour l'utilisateur (également indiqué pour les non-inscrits)

Quotas

  
**requeststoday** : Nombre d'appel total a l'api pendant la journée en court  
**requestskotoday** : Nombre d'appel a l'api avec un retour négatif (rom/jeu non trouvé) pendant la journée en court  
**maxrequestspermin** : Nombre d'appel a l'api maximum autorisé par minute pour l'utilisateur (voir F.A.Q.)  
**maxrequestsperday** : Nombre d'appel a l'api maximum autorisé par jour pour l'utilisateur (voir F.A.Q.)  
**maxrequestskoperday** : Nombre d'appel a l'api avec un retour négatif (rom/jeu non trouvé) maximum autorisé par jour pour l'utilisateur (voir F.A.Q.)

**visites** : nombre de visites de l'utilisateur sur ScreenScraper

  
**datedernierevisite** : date de la dernière visite de l'utilisateur sur ScreenScraper (format : yyyy-mm-jj hh:mm:ss)  
**favregion** : région favorite de visites de l'utilisateur sur ScreenScraper (france,europe,usa,japon)  
Exemple d'appel  
[https://api.screenscraper.fr/api2/ssuserInfos.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=&sspassword=](https://api.screenscraper.fr/api2/ssuserInfos.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=&sspassword=)  

userlevelsListe.php : Liste des niveaux utilisateurs de ScreenScraper

nbJoueursListe.php : Liste des nombres de joueurs

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**output** : xml(par defaut),json  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateur  
Items : **nbjoueur**

Elements Retournés :

  
**id** : identifiant numérique du nombre de joueurs  
**nom** : Désignation du nombre de joueurs  
**parent** : identifiant numérique du nombre de joueurs parent (0 si aucun parent)  
Exemple d'appel  
[https://api.screenscraper.fr/api2/nbJoueursListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=XML&ssid=test&sspassword=test](https://api.screenscraper.fr/api2/nbJoueursListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=XML&ssid=test&sspassword=test)  

supportTypesListe.php : Liste des types de supports

romTypesListe.php : Liste des types de roms

genresListe.php : Liste des genres

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**output** : xml(par defaut),json  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateur  
Items : **genres**

Elements Retournés :

  
**genre** (xml) / **_id_** (json) {  
  **id** : identifiant numérique du genre  
  **nom\_de** : nom du genre en Allemand  
  **nom\_en** : nom du genre en Anglais  
  **nom\_es** : nom du genre en Espagnol  
  **nom\_fr** : nom du genre en Français  
  **nom\_it** : nom du genre en Italien  
  **nom\_pt** : nom du genre en Portugais  
  **parent** : id du genre parent (0 si genre principal)  
  **medias** {  
    **media\_pictomonochrome** : url de téléchargement du média : Pictogramme Monochrome  
    **media\_pictocouleur** : url de téléchargement du média : Pictogramme Couleur  
    **media\_background** : url de téléchargement du média : Fond d'écran   }

}

Exemple d'appel  
[https://api.screenscraper.fr/api2/genresListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test](https://api.screenscraper.fr/api2/genresListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test)  

regionsListe.php : Liste des regions

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**output** : xml(par defaut),json  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateur  
Items : **regions**

Elements Retournés :

  
**region** (xml) / **_id_** (json) {  
  **id** : identifiant numérique de la region  
  **nomcourt** : nom court de la region  
  **nom\_de** : nom de la region en Allemand  
  **nom\_en** : nom de la region en Anglais  
  **nom\_es** : nom de la region en Espagnol  
  **nom\_fr** : nom de la region en Français  
  **nom\_it** : nom de la region en Italien  
  **nom\_pt** : nom de la region en Portugais  
  **parent** : id de la region parent (0 si genre principal)  
  **medias** {  
    **media\_pictomonochrome** : url de téléchargement du média : Pictogramme Monochrome  
    **media\_pictocouleur** : url de téléchargement du média : Pictogramme Couleur  
    **media\_background** : url de téléchargement du média : Fond d'écran   }

}

Exemple d'appel  
[https://api.screenscraper.fr/api2/regionsListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test](https://api.screenscraper.fr/api2/regionsListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test)  

languesListe.php : Liste des langues

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**output** : xml(par defaut),json  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateur  
Items : **langues**

Elements Retournés :

  
**langue** (xml) / **_id_** (json) {  
  **id** : identifiant numérique de la langue  
  **nomcourt** : nom court de la langue  
  **nom\_de** : nom de la langue en Allemand  
  **nom\_en** : nom de la langue en Anglais  
  **nom\_es** : nom de la langue en Espagnol  
  **nom\_fr** : nom de la langue en Français  
  **nom\_it** : nom de la langue en Italien  
  **nom\_pt** : nom de la langue en Portugais  
  **parent** : id de la langue parent (0 si genre principal)  
  **medias** {  
    **media\_pictomonochrome** : url de téléchargement du média : Pictogramme Monochrome  
    **media\_pictocouleur** : url de téléchargement du média : Pictogramme Couleur  
    **media\_background** : url de téléchargement du média : Fond d'écran   }

}

Exemple d'appel  
[https://api.screenscraper.fr/api2/languesListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test](https://api.screenscraper.fr/api2/languesListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test)  

classificationListe.php : Liste des Classification (Game Rating)

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**output** : xml(par defaut),json  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateur  
Items : **classifications**

Elements Retournés :

  
**langue** (xml) / **_id_** (json) {  
  **id** : identifiant numérique de la classification  
  **nomcourt** : nom court de la classification  
  **nom\_de** : nom de la classification en Allemand (si existante)  
  **nom\_en** : nom de la classification en Anglais (si existante)  
  **nom\_es** : nom de la classification en Espagnol (si existante)  
  **nom\_fr** : nom de la classification en Français (si existante)  
  **nom\_it** : nom de la classification en Italien (si existante)  
  **nom\_pt** : nom de la classification en Portugais (si existante)  
  **parent** : id de la classification parent (0 si genre principal)  
  **medias** {  
    **media\_pictomonochrome** : url de téléchargement du média : Pictogramme Monochrome  
    **media\_pictocouleur** : url de téléchargement du média : Pictogramme Couleur  
    **media\_background** : url de téléchargement du média : Fond d'écran   }

}

Exemple d'appel  
[https://api.screenscraper.fr/api2/classificationListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test](https://api.screenscraper.fr/api2/classificationListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test)  

mediasSystemeListe.php : Liste des médias pour les systèmes

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**output** : xml(par defaut),json  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateur  
Items : **medias**

Elements Retournés :

  
**media** (xml) / **_id_** (json) {  
  **id** : identifiant numérique du média  
  **nomcourt** : nom court du média  
  **nom** : nom long du média  
  **categorie** : catégorie du média  
  **plateformtypes** : liste des types de systéme ou le média est présent (id du type de système séparé par des | , si vide = tout types de système)  
  **plateforms** : liste des systémes ou le média est présent (id du type de système séparé par des | , si vide = tout systèmes)  
  **type** : type de média  
  **fileformat** : format de fichier du média  
  **fileformat2** : 2eme format de fichier du média accepté a la proposition  
  **autogen** : média auto-généré (0=non,1=oui)  
  **multiregions** : média multi-regions (0=non,1=oui)  
  **multisupports** : média multi-supports (0=non,1=oui)  
  **multiversions** : média multi-versions (0=non,1=oui)  
  **extrainfostxt** : informations complémentaires du média  
} Exemple d'appel  
[https://api.screenscraper.fr/api2/mediasSystemeListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test](https://api.screenscraper.fr/api2/mediasSystemeListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test)  

mediasJeuListe.php : Liste des médias pour les jeux

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**output** : xml(par defaut),json  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateur  
Items : **medias**

Elements Retournés :

  
**media** (xml) / **_id_** (json) {  
  **id** : identifiant numérique du média  
  **nomcourt** : nom court du média  
  **nom** : nom long du média  
  **categorie** : catégorie du média  
  **plateformtypes** : liste des types de systéme ou le média est présent (id du type de système séparé par des | , si vide = tout types de système)  
  **plateforms** : liste des systémes ou le média est présent (id du type de système séparé par des | , si vide = tout systèmes)  
  **type** : type de média  
  **fileformat** : format de fichier du média  
  **fileformat2** : 2eme format de fichier du média accepté a la proposition  
  **autogen** : média auto-généré (0=non,1=oui)  
  **multiregions** : média multi-regions (0=non,1=oui)  
  **multisupports** : média multi-supports (0=non,1=oui)  
  **multiversions** : média multi-versions (0=non,1=oui)  
  **extrainfostxt** : informations complémentaires du média  
} Exemple d'appel  
[https://api.screenscraper.fr/api2/mediasJeuListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test](https://api.screenscraper.fr/api2/mediasJeuListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test)  

infosJeuListe.php : Liste des infos pour les jeux

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**output** : xml(par defaut),json  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateur  
Items : **infos**

Elements Retournés :

  
**info** (xml) / **_id_** (json) {  
  **id** : identifiant numérique de l'info  
  **nomcourt** : nom court de l'info  
  **nom** : nom long de l'info  
  **categorie** : catégorie de l'info  
  **plateformtypes** : liste des types de systéme ou l'info est présent (id du type de système séparé par des | , si vide = tout types de système)  
  **plateforms** : liste des systémes ou l'info est présent (id du type de système séparé par des | , si vide = tout systèmes)  
  **type** : type d'info  
  **autogen** : info auto-généré (0=non,1=oui)  
  **multiregions** : info multi-regions (0=non,1=oui)  
  **multisupports** : info multi-supports (0=non,1=oui)  
  **multiversions** : info multi-versions (0=non,1=oui)  
  **multichoix** : info multi-choix (0=non,1=oui)  
} Exemple d'appel  
[https://api.screenscraper.fr/api2/infosJeuListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test](https://api.screenscraper.fr/api2/infosJeuListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test)  

infosRomListe.php : Liste des infos pour les roms

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**output** : xml(par defaut),json  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateur  
Items : **infos**

Elements Retournés :

  
**info** (xml) / **_id_** (json) {  
  **id** : identifiant numérique de l'info  
  **nomcourt** : nom court de l'info  
  **nom** : nom long de l'info  
  **categorie** : catégorie de l'info  
  **plateformtypes** : liste des types de systéme ou l'info est présent (id du type de système séparé par des | , si vide = tout types de système)  
  **plateforms** : liste des systémes ou l'info est présent (id du type de système séparé par des | , si vide = tout systèmes)  
  **type** : type d'info  
  **autogen** : info auto-généré (0=non,1=oui)  
  **multiregions** : info multi-regions (0=non,1=oui)  
  **multisupports** : info multi-supports (0=non,1=oui)  
  **multiversions** : info multi-versions (0=non,1=oui)  
  **multichoix** : info multi-choix (0=non,1=oui)  
} Exemple d'appel  
[https://api.screenscraper.fr/api2/infosRomListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test](https://api.screenscraper.fr/api2/infosRomListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test)  

mediaGroup.php : Téléchargement des médias images des groupes de jeux

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateur  
**crc** : calcul crc de l'image existante en local  
**md5** : calcul md5 de l'image existante en local  
**sha1** : calcul sha1 de l'image existante en local  
**groupid** : identifiant numérique du groupes (voir genreListe.php, modeListe.php,... / type de groupes = genre, mode, famille, theme, style)  
**media** : identifiant texte du média à retourner (voir genreListe.php, modeListe.php,... / type de groupes = genre, mode, famille, theme, style)  
**mediaformat**(non obligatoire) : format (extension) du media : ex : jpg, png, mp4, zip, mp3, ... ( donnée informative : ne retourne pas le média au format spécifié)  
Paramètres de sortie :  
**maxwidth**(non obligatoire) : Largeur Maximum en pixels de l'image retournée  
**maxheight**(non obligatoire) : Hauteur Maximum en pixels de l'image retournée  
**outputformat**(non obligatoire) : Format (extension) de l'image retournée : **png** ou **jpg**  
Element Retourné : **Image PNG** ou

Texte **CRCOK** ou **MD5OK** ou **SHA1OK** si le paramètres crc, md5 ou sha1 est identique au calcul crc, md5 ou sha1 de l'image du serveur (optimisation des mises à jour)

ou

Texte **NOMEDIA** si le fichier média n'a pas été trouvé

  
Exemple d'appel  
[https://api.screenscraper.fr/api2/mediaGroup.php?devid=xxx&devpassword=yyy&softname=zzz&ssid=test&sspassword=test&crc=&md5=&sha1=&groupid=1&media=logo-monochrome](https://api.screenscraper.fr/api2/mediaGroup.php?devid=xxx&devpassword=yyy&softname=zzz&ssid=test&sspassword=test&crc=&md5=&sha1=&groupid=1&media=logo-monochrome)  

mediaCompagnie.php : Téléchargement des médias images des Compagnies de jeux

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateur  
**crc** : calcul crc de l'image existante en local  
**md5** : calcul md5 de l'image existante en local  
**sha1** : calcul sha1 de l'image existante en local  
**companyid** : identifiant numérique de la compagnie  
**media** : identifiant texte du média à retourner  
**mediaformat**(non obligatoire) : format (extension) du media : ex : jpg, png, mp4, zip, mp3, ... ( donnée informative : ne retourne pas le média au format spécifié)  
Paramètres de sortie :  
**maxwidth**(non obligatoire) : Largeur Maximum en pixels de l'image retournée  
**maxheight**(non obligatoire) : Hauteur Maximum en pixels de l'image retournée  
**outputformat**(non obligatoire) : Format (extension) de l'image retournée : **png** ou **jpg**  
Element Retourné : **Image PNG** ou

Texte **CRCOK** ou **MD5OK** ou **SHA1OK** si le paramètres crc, md5 ou sha1 est identique au calcul crc, md5 ou sha1 de l'image du serveur (optimisation des mises à jour)

ou

Texte **NOMEDIA** si le fichier média n'a pas été trouvé

  
Exemple d'appel  
[https://api.screenscraper.fr/api2/mediaCompagnie.php?devid=xxx&devpassword=yyy&softname=zzz&ssid=test&sspassword=test&crc=&md5=&sha1=&companyid=3&media=logo-monochrome](https://api.screenscraper.fr/api2/mediaCompagnie.php?devid=xxx&devpassword=yyy&softname=zzz&ssid=test&sspassword=test&crc=&md5=&sha1=&companyid=3&media=logo-monochrome)  

systemesListe.php : Liste des systèmes / informations systèmes / informations médias systèmes

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**output** : xml(par defaut),json  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateur  
Item : **ssuser** (informations utilisateurs ScreenScraper)

Elements Retournés :

  
**id** : pseudo de l'utilisateur sur ScreenScraper  
**niveau** : niveau de l'utilisateur sur ScreenScraper  
**contribution** : niveau de contribution financière sur ScreenScraper (2 = 1 Thread Supplémentaire/3 et + = 5 Threads Supplémentaires)  
**uploadsysteme** : Compteur de contributions valides (média de système) proposés par l'utilisateur  
**uploadinfos** : Compteur de contributions valides (infos texte) proposés par l'utilisateur  
**romasso** : Compteur de contributions valides (association de rom) proposés par l'utilisateur  
**uploadmedia** : Compteur de contributions valides (média de jeu) proposés par l'utilisateur  
**maxthreads** : Nombre de threads autorisés pour l'utilisateur (également indiqué pour les non-inscrits)  
**maxdownloadspeed** : Vitesse de téléchargement (en Ko/s) autorisée pour l'utilisateur (également indiqué pour les non-inscrits)  
**requeststoday** : Nombre d'appel a l'api pendant la journée en court  
**requestskotoday** : Nombre d'appel a l'api avec un retour négatif (rom/jeu non trouvé) pendant la journée en court  
**maxrequestsperdmin** : Nombre d'appel a l'api maximum autorisé par minute pour l'utilisateur (voir F.A.Q.)  
**maxrequestsperday** : Nombre d'appel a l'api maximum autorisé par jour pour l'utilisateur (voir F.A.Q.)  
**maxrequestskoperday** : Nombre d'appel a l'api avec un retour négatif (rom/jeu non trouvé) maximum autorisé par jour pour l'utilisateur (voir F.A.Q.)  
**visites** : nombre de visites de l'utilisateur sur ScreenScraper  
**datedernierevisite** : date de la dernière visite de l'utilisateur sur ScreenScraper (format : yyyy-mm-jj hh:mm:ss)  
**favregion** : région favorite de visites de l'utilisateur sur ScreenScraper (france,europe,usa,japon)  
Items : **systeme** (xml) / **systemes** (json)

Elements Retournés :

  
**id** : identifiant numérique du système (à refournir dans les autres requêtes de l’api)  
**parentid** : identifiant numérique du système parent  
**noms** {  
  **nom\_xx** : Nom du système Région xx (xx = variable "nomcourt" de l'API regionsListe.php)   ...

  **nom\_recalbox** : Nom du système dans le front-end Recalbox

  
  **nom\_retropie** : Nom du système dans le front-end Retropie  
  **nom\_launchbox** : Nom du système dans le front-end Launchbox  
  **nom\_hyperspin** : Nom du système dans le front-end Hyperspin  
  **noms\_commun** : Noms commun donnée au système en général }

**extensions** : extensions des fichiers de roms utilisables (tous emulateurs confondus)

  
**compagnie** : Nom de la société de production du système  
**type** : Type de système (Arcade,Console,Console Portable,Emulation Arcade,Flipper,Online,Ordinateur,Smartphone)  
**datedebut** : Année de début de production  
**datefin** : Année de fin de production  
**romtype** : Type(s) de roms (voir requête **romTypesListe**)  
**supporttype** : Type du ou des supports d’origines du système (voir requête **supportTypesListe**)  
**medias** {  
**media\_logosmonochrome** {  
  **media\_logomonochrome\_xx** : url de téléchargement du média : Logo Monochrome région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
  **media\_logomonochrome\_xx\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_logomonochrome\_xx\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_logomonochrome\_xx\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)   ... }

**media\_wheels** {

  
  **media\_wheel\_xx** : url de téléchargement du média : Logo Couleur région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
  **media\_wheel\_xx\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_wheel\_xx\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_wheel\_xx\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)   ... }

**media\_wheelscarbon** {

  
  **media\_wheelcarbon\_xx** : url de téléchargement du média : Wheel Carbon région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
  **media\_wheelcarbon\_xx\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_wheelcarbon\_xx\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_wheelcarbon\_xx\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)   ... }

**media\_wheelscarbonvierge** {

  
  **media\_wheelcarbonvierge\_xx** : url de téléchargement du média : Wheel Carbon vierge région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
  **media\_wheelcarbonvierge\_xx\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_wheelcarbonvierge\_xx\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_wheelcarbonvierge\_xx\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)   ... }

**media\_wheelssteel** {

  
  **media\_wheelsteel\_xx** : url de téléchargement du média : Wheel Steel région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
  **media\_wheelsteel\_xx\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_wheelsteel\_xx\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_wheelsteel\_xx\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)   .. }

**media\_wheelssteelvierge** {

  
  **media\_wheelsteelvierge\_xx** : url de téléchargement du média : Wheel Steel vierge région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
  **media\_wheelsteelvierge\_xx\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_wheelsteelvierge\_xx\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_wheelsteelvierge\_xx\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)   ... }

**media\_photos** {

  
  **media\_photo\_xx** : url de téléchargement du média : Photo du système région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
  **media\_photo\_xx\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_photo\_xx\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_photo\_xx\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)   ... }

**media\_video** : url de téléchargement du média : Vidéo de présentation du système

  
  **media\_video\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_video\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_video\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)

**media\_fanart** : url de téléchargement du média : Fanart du jeux (fond d'écran personnalisé)

  
  **media\_fanart\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_fanart\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_fanart\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
**media\_bezels** {  
  **media\_bezels4-3** {  
    **media\_bezel4-3\_xx** : url de téléchargement du média : Bezel 4:3 pour jeux horizontaux région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
    **media\_bezel4-3\_xx\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
    **media\_bezel4-3\_xx\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
    **media\_bezel4-3\_xx\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)     ...   }

  **media\_bezels4-3v** {

  
    **media\_bezel4-3v\_xx** : url de téléchargement du média : Bezel 4:3 pour jeux verticaux région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
    **media\_bezel4-3v\_xx\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
    **media\_bezel4-3v\_xx\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
    **media\_bezel4-3v\_xx\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)     ...   }

  **media\_bezels16-9** {

  
    **media\_bezel16-9\_xx** : url de téléchargement du média : Bezel 16:9 pour jeux horizontaux région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
    **media\_bezel16-9\_xx\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
    **media\_bezel16-9\_xx\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
    **media\_bezel16-9\_xx\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)     ...   }

  **media\_bezels16-9v** {

  
    **media\_bezel16-9v\_xx** : url de téléchargement du média : Bezel 16:9 pour jeux verticaux région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
    **media\_bezel16-9v\_xx\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
    **media\_bezel16-9v\_xx\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
    **media\_bezel16-9v\_xx\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)     ...   }

  **media\_bezels16-10** {

  
    **media\_bezel16-10\_xx** : url de téléchargement du média : Bezel 16:10 pour jeux horizontaux région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
    **media\_bezel16-10\_xx\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
    **media\_bezel16-10\_xx\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
    **media\_bezel16-10\_xx\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)     ...   }

  **media\_bezels16-10** {

  
    **media\_bezel16-10v\_xx** : url de téléchargement du média : Bezel 16:10 pour jeux verticaux région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
    **media\_bezel16-10v\_xx\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
    **media\_bezel16-10v\_xx\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
    **media\_bezel16-10v\_xx\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)     ...   } }

**media\_backgrounds** {

  
  **media\_background\_xx** : url de téléchargement du média : Background du système région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
  **media\_background\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_background\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_background\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)   ...   }

**media\_screenmarquees** {

  
  **media\_screenmarquee\_xx** : url de téléchargement du média : ScreenMarquee du système région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
  **media\_screenmarquee\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_screenmarquee\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_screenmarquee\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)   ...   }

**media\_screenmarqueevierges** {

  
  **media\_screenmarqueevierge\_xx** : url de téléchargement du média : ScreenMarquee Vierge du système région vierge  
  **media\_screenmarqueevierge\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_screenmarqueevierge\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_screenmarqueevierge\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)   ...   }

**media\_boxs3dvierge** {

  
  **media\_box3dvierge\_xx** : url de téléchargement du média : Image du boitier en vue 3D vierge région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
  **media\_box3dvierge\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_box3dvierge\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_box3dvierge\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)   ... }

**media\_supports2dvierge** {

  
  **media\_support2dvierge\_xx** : url de téléchargement du média : Image du support en vue de face vierge région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
  **media\_support2dvierge\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_support2dvierge\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_support2dvierge\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)   ... }

**media\_controleur** {

  
  **media\_controleur\_xx** : url de téléchargement du média : Image du controleur (ou de la console portable entière) en vue de face région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
  **media\_controleur\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_controleur\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_controleur\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)   ... }

**media\_illustration** {

  
  **media\_illustration\_xx** : url de téléchargement du média : Image du système en vue isométrique dessus/avant région xx (xx = variable "nomcourt" de l'API regionsListe.php)  
  **media\_illustration\_crc** : identifiant CRC32 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_illustration\_md5** : identifiant md5 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)  
  **media\_illustration\_sha1** : identifiant sha1 du fichier média (vous permet de checker si le média en ligne et le même qu'en local avant de la télécharger)   ... } Exemple d'appel  
[https://api.screenscraper.fr/api2/systemesListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=XML&ssid=test&sspassword=test](https://api.screenscraper.fr/api2/systemesListe.php?devid=xxx&devpassword=yyy&softname=zzz&output=XML&ssid=test&sspassword=test)  

mediaSysteme.php : Téléchargement des médias images des systèmes

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateur  
**crc** : calcul crc de l'image existante en local  
**md5** : calcul md5 de l'image existante en local  
**sha1** : calcul sha1 de l'image existante en local  
**systemeid** : identifiant numérique du système (voir systemesListe.php)  
**media** : identifiant texte du média à retourner (voir systemesListe.php)  
**mediaformat**(non obligatoire) : format (extension) du media : ex : jpg, png, mp4, zip, mp3, ... ( donnée informative : ne retourne pas le média au format spécifié)  
Paramètres de sortie :  
**maxwidth**(non obligatoire) : Largeur Maximum en pixels de l'image retournée  
**maxheight**(non obligatoire) : Hauteur Maximum en pixels de l'image retournée  
**outputformat**(non obligatoire) : Format (extension) de l'image retournée : **png** ou **jpg**  
Element Retourné : **Image PNG** ou

Texte **CRCOK** ou **MD5OK** ou **SHA1OK** si le paramètres crc, md5 ou sha1 est identique au calcul crc, md5 ou sha1 de l'image du serveur (optimisation des mises à jour)

ou

Texte **NOMEDIA** si le fichier média n'a pas été trouvé

  
Exemple d'appel  
[https://api.screenscraper.fr/api2/mediaSysteme.php?devid=xxx&devpassword=yyy&softname=zzz&ssid=test&sspassword=test&crc=&md5=&sha1=&systemeid=1&media=wheel(wor)](https://api.screenscraper.fr/api2/mediaSysteme.php?devid=xxx&devpassword=yyy&softname=zzz&ssid=test&sspassword=test&crc=&md5=&sha1=&systemeid=1&media=wheel\(wor\))  

mediaVideoSysteme.php : Téléchargement des médias vidéos des systèmes

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateur  
**crc** : calcul crc de la video existante en local  
**md5** : calcul md5 de la video existante en local  
**sha1** : calcul sha1 de la video existante en local  
**systemeid** : identifiant numérique du système (voir systemesListe.php)  
**media** : identifiant texte du média à retourner (voir systemesListe.php)  
**mediaformat** : format (extension) du media : ex : jpg, png, mp4, zip, mp3, ... (non obligatoire, donnée informative : ne retourne pas le média au format spécifié)  
Element Retourné : **Video MP4** ou

Texte **CRCOK** ou **MD5OK** ou **SHA1OK** si le paramètres crc, md5 ou sha1 est identique au calcul crc, md5 ou sha1 de la vidéo du serveur (optimisation des mises à jour)

ou

Texte **NOMEDIA** si le fichier média n'a pas été trouvé

Exemple d'appel  
[https://api.screenscraper.fr/api2/mediaVideoSysteme.php?devid=xxx&devpassword=yyy&softname=zzz&ssid=test&sspassword=test&crc=&md5=&sha1=&systemeid=1&media=video](https://api.screenscraper.fr/api2/mediaVideoSysteme.php?devid=xxx&devpassword=yyy&softname=zzz&ssid=test&sspassword=test&crc=&md5=&sha1=&systemeid=1&media=video)  

jeuRecherche.php : Recherche d'un jeu avec son nom (retourne une table de jeux (limité a 30 jeux) classés par probabilité)

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**output** : xml(par defaut),json  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateur  
**systemeid**(non obligatoire) : identifiant numérique du système (voir systemesListe.php)  
**recherche** : nom du jeu recherché  
Item : **serveurs** (informations serveurs ScreenScraper)

Elements Retournés :

  
**serveurcpu1** : % d'utilisateur CPUs sur le serveur principal actuel  
**serveurcpu2** : % d'utilisateur CPUs sur le serveur secondaire actuel  
**threadsmin** : nombre d'accés a l'API depuis les 60 dernières secondes  
**nbscrapeurs** : nombre d'utilisateurs de l'API actuellement  
**apiacces** : nombre d'accés a l'API aujourd'hui (heure Française)  
Item : **ssuser** (informations utilisateurs ScreenScraper)

Elements Retournés :

  
**id** : pseudo de l'utilisateur sur ScreenScraper  
**niveau** : niveau de l'utilisateur sur ScreenScraper  
**contribution** : niveau de contribution financière sur ScreenScraper (2 = 1 Thread Supplémentaire/3 et + = 5 Threads Supplémentaires)  
**uploadsysteme** : Compteur de contributions valides (média de système) proposés par l'utilisateur  
**uploadinfos** : Compteur de contributions valides (infos texte) proposés par l'utilisateur  
**romasso** : Compteur de contributions valides (association de rom) proposés par l'utilisateur  
**uploadmedia** : Compteur de contributions valides (média de jeu) proposés par l'utilisateur  
**maxthreads** : Nombre de threads autorisés pour l'utilisateur (également indiqué pour les non-inscrits)  
**maxdownloadspeed** : Vitesse de téléchargement (en Ko/s) autorisée pour l'utilisateur (également indiqué pour les non-inscrits)  
**requeststoday** : Nombre d'appel a l'api pendant la journée en court  
**requestskotoday** : Nombre d'appel a l'api avec un retour négatif (rom/jeu non trouvé) pendant la journée en court  
**maxrequestsperdmin** : Nombre d'appel a l'api maximum autorisé par minute pour l'utilisateur (voir F.A.Q.)  
**maxrequestsperday** : Nombre d'appel a l'api maximum autorisé par jour pour l'utilisateur (voir F.A.Q.)  
**maxrequestskoperday** : Nombre d'appel a l'api avec un retour négatif (rom/jeu non trouvé) maximum autorisé par jour pour l'utilisateur (voir F.A.Q.)  
**visites** : nombre de visites de l'utilisateur sur ScreenScraper  
**datedernierevisite** : date de la dernière visite de l'utilisateur sur ScreenScraper (format : yyyy-mm-jj hh:mm:ss)  
**favregion** : région favorite de visites de l'utilisateur sur ScreenScraper (france,europe,usa,japon)  
Item XML : **jeux** (table) puis **jeu**  
Item JSON : **jeux** (table)

Elements Retournés :

Identique a l'API jeuInfos mais sans les infos sur les roms Exemple d'appel  
[https://api.screenscraper.fr/api2/jeuRecherche.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test&systemeid=1&recherche=sonic](https://api.screenscraper.fr/api2/jeuRecherche.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test&systemeid=1&recherche=sonic)  

jeuInfos.php : Informations sur un jeu / Médias d'un jeu

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**output** : xml(par defaut),json  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateur  
**crc**\* : calcul crc du fichier rom/iso/dossier existant en local  
**md5**\* : calcul md5 du fichier rom/iso/dossier existant en local  
**sha1**\* : calcul sha1 du fichier rom/iso/dossier existant en local  
**systemeid** : identifiant numérique du système (voir systemesListe.php)  
**romtype** : Type de "rom" : fichier rom unique / fichier iso unique / dossier  
**romnom** : nom du fichier (avec extension) ou nom du dossier  
**romtaille**\* : Taille en octet du fichier ou du dossier  
**serialnum** : Forcer la recherche du jeu avec le numero de série de la rom (iso) associé  
**gameid**\*\* : Forcer la recherche du jeu avec son identifiant numérique  
_\* a moins d'une dérogation, vous devez envoyer au moins un (le mieux serait les 3) de ces calculs (crc,md5,sha1) d'identification de fichier rom/iso ou dossier avec votre requete ET la taille (on octect du fichier ou du dossier)._  
_\*\* Aucune information sur la rom n'est envoyée dans ce cas._  
Item : **serveurs** (informations serveurs ScreenScraper)

Elements Retournés :

  
**serveurcpu1** : % d'utilisateur CPUs sur le serveur principal actuel  
**serveurcpu2** : % d'utilisateur CPUs sur le serveur secondaire actuel  
**threadsmin** : nombre d'accés a l'API depuis les 60 dernières secondes  
**nbscrapeurs** : nombre d'utilisateurs de l'API actuellement  
**apiacces** : nombre d'accés a l'API aujourd'hui (heure Française)  
Item : **ssuser** (informations utilisateurs ScreenScraper)

Elements Retournés :

  
**id** : pseudo de l'utilisateur sur ScreenScraper  
**niveau** : niveau de l'utilisateur sur ScreenScraper  
**contribution** : niveau de contribution financière sur ScreenScraper (2 = 1 Thread Supplémentaire/3 et + = 5 Threads Supplémentaires)  
**uploadsysteme** : Compteur de contributions valides (média de système) proposés par l'utilisateur  
**uploadinfos** : Compteur de contributions valides (infos texte) proposés par l'utilisateur  
**romasso** : Compteur de contributions valides (association de rom) proposés par l'utilisateur  
**uploadmedia** : Compteur de contributions valides (média de jeu) proposés par l'utilisateur  
**maxthreads** : Nombre de threads autorisés pour l'utilisateur (également indiqué pour les non-inscrits)  
**maxdownloadspeed** : Vitesse de téléchargement (en Ko/s) autorisée pour l'utilisateur (également indiqué pour les non-inscrits)  
**requeststoday** : Nombre d'appel a l'api pendant la journée en court  
**requestskotoday** : Nombre d'appel a l'api avec un retour négatif (rom/jeu non trouvé) pendant la journée en court  
**maxrequestsperdmin** : Nombre d'appel a l'api maximum autorisé par minute pour l'utilisateur (voir F.A.Q.)  
**maxrequestsperday** : Nombre d'appel a l'api maximum autorisé par jour pour l'utilisateur (voir F.A.Q.)  
**maxrequestskoperday** : Nombre d'appel a l'api avec un retour négatif (rom/jeu non trouvé) maximum autorisé par jour pour l'utilisateur (voir F.A.Q.)  
**visites** : nombre de visites de l'utilisateur sur ScreenScraper  
**datedernierevisite** : date de la dernière visite de l'utilisateur sur ScreenScraper (format : yyyy-mm-jj hh:mm:ss)  
**favregion** : région favorite de visites de l'utilisateur sur ScreenScraper (france,europe,usa,japon)  
Item : **jeu**

Elements Retournés :

  
**id** : identifiant numérique du jeu  
**romid** : identifiant numérique de la rom  
**notgame** : (true/false) indique si la rom est assigner a un jeu ou a un NON jeu (demo/appli/...)  
**nom** : Nom du jeu (interne ScreenScraper)  
**noms** {  
  **nom\_ss** : Nom du jeu (interne ScreenScraper)  
  **nom\_xx** : Titre du jeu région xx (xx = variable "nomcourt" de l'API regionsListe.php)   ... }

_Si la rom est assigné a un NON jeu, le tag "ZZZ(notgame):" est ajouté a l'avant du nom interne ScreenScraper et les noms par région_

**regionshortnames** {

  
  **regionshortname** : Nom court de la region de la rom (si dispo) }

**cloneof** : ID du Clone (si dispo)

  
**systeme** {  
  **id** : Identifiant numérique du systeme du jeu  
  **nom** : Nom du systeme du jeu  
  **parentid** : Identifiant numérique du systeme parent du systeme du jeu }

**editeur** : Nom de l'editeur

  
**editeurmedias** {  
  **editeurmedia\_pictomonochrome** : url de téléchargement du média : Logo Monochrome de l'éditeur  
  **editeurmedia\_pictocouleur** : url de téléchargement du média : Logo Couleur de l'éditeur }

**developpeur** : Nom du developpeur

  
**developpeurmedias** {  
  **developpeurmedia\_pictomonochrome** : url de téléchargement du média : Logo Monochrome du developpeur  
  **developpeurmedia\_pictocouleur** : url de téléchargement du média : Logo Couleur du developpeur }

**joueurs** : Nombre de joueurs

  
**notemedias** {  
  **joueursmedia\_pictoliste** : url de téléchargement du média : Pictogramme de liste  
  **joueursmedia\_pictomonochrome** : url de téléchargement du média : Pictogramme Monochrome  
  **joueursmedia\_pictocouleur** : url de téléchargement du média : Pictogramme Couleur }

**note** : Note sur 20

  
**notemedias** {  
  **notemedia\_pictoliste** : url de téléchargement du média : Pictogramme de liste  
  **notemedia\_pictomonochrome** : url de téléchargement du média : Logo Monochrome  
  **notemedia\_pictocouleur** : url de téléchargement du média : Logo Couleur }

**topstaff** : Jeu inclu dans le TOP Staff ScreenScraper _(0: non inclu, 1: inclu)_

  
**rotation** : rotation de l'écran de jeu _(uniquement pour les jeux arcade)_  
**resolution** : résolution du jeu _(uniquement pour les jeux arcade)_  
**synopsis** {  
  **synopsis\_xx** : Description du jeu en langue xx (xx = variable "nomcourt" de l'API languesListe.php)   ... }

**classifications** {

  
  **classifications\__organisme_** Classification du jeu  
  **classifications\__organisme_\_medias** {  
    **classifications\__organisme_\_media\_pictoliste** : url de téléchargement du média : Pictogramme de liste  
    **classifications\__organisme_\_media\_pictomonochrome** : url de téléchargement du média : Pictogramme Monochrome  
    **classifications\__organisme_\_media\_pictocouleur** : url de téléchargement du média : Pictogramme Couleur   } }

**dates** {

  
  **id texte region (france=date\_fr,europe=date\_eu,usa=date\_us,japon=date\_jp,...)** : Date de sortie dans la région indiquées }

**genres** {

  
  **genres\_id** \[  
    **genre\_id** : Identifiant Numérique du genre du jeu (Voir genresListe.php)  
    **nomcourt** : Identifiant Numérique version "genres normalisés" (Voir [wikipedia](https://en.wikipedia.org/wiki/List_of_video_game_genres) + 20 : genre = "Adulte")  
    **principale** : Genre Principale (0: non principale, 1: Principale)  
    **parentid** : Identifiant Numérique du genre principale du genre (Voir genresListe.php)   \]

  **genre\__id_\_medias** { _id : identifiant numerique du genre (Voir genresListe.php)_

  
    **genre\__id_\_media\_pictoliste** : url de téléchargement du média : Pictogramme de liste  
    **genre\__id_\_media\_pictomonochrome** : url de téléchargement du média : Pictogramme Monochrome  
    **genre\__id_\_media\_pictocouleur** : url de téléchargement du média : Pictogramme Couleur   }

  **genres\_xx** \[

  
    **genre\_xx** : Genre du jeu en langue xx (xx = variable "nomcourt" de l'API languesListe.php) (Voir genresListe.php)   \]   ... }

**modes** {

  
  **modes\_id** \[  
    **mode\_id** : Identifiant Numérique du mode de jeu   \]

  **mode\__id_\_medias** { _id : identifiant numerique du mode de jeu_

  
    **mode\__id_\_media\_pictoliste** : url de téléchargement du média : Pictogramme de liste  
    **mode\__id_\_media\_pictomonochrome** : url de téléchargement du média : Pictogramme Monochrome  
    **mode\__id_\_media\_pictocouleur** : url de téléchargement du média : Pictogramme Couleur   }

  **modes\_xx** \[

  
    **mode\_xx** : Mode de jeu en langue xx (xx = variable "nomcourt" de l'API languesListe.php)   \]   ... }

**familles** {

  
  **familles\_id** \[  
    **famille\_id** : Identifiant Numérique de la famille du jeu   \]

  **famille\__id_\_medias** { _id : identifiant numerique de la famille de jeux_

  
    **famille\__id_\_media\_pictoliste** : url de téléchargement du média : Pictogramme de liste  
    **famille\__id_\_media\_pictomonochrome** : url de téléchargement du média : Pictogramme Monochrome  
    **famille\__id_\_media\_pictocouleur** : url de téléchargement du média : Pictogramme Couleur   }

  **familles\_xx** \[

  
    **famille\_xx** : Famille du jeu en langue xx (xx = variable "nomcourt" de l'API languesListe.php) (ex: "Sonic & Knuckles" Famille : "Sonic the Hedgehog")   \]   ... }

**numeros** {

  
  **numeros\_id** \[  
    **numero\_id** : Identifiant Numérique du numero du jeu   \]

  **numero\__id_\_medias** { _id : identifiant numerique du numero du jeu_

  
    **numero\__id_\_media\_pictoliste** : url de téléchargement du média : Pictogramme de liste  
    **numero\__id_\_media\_pictomonochrome** : url de téléchargement du média : Pictogramme Monochrome  
    **numero\__id_\_media\_pictocouleur** : url de téléchargement du média : Pictogramme Couleur   }

  **numeros\_xx** \[

  
    **numero\_xx** : Numéro dans la série du jeu en langue xx (xx = variable "nomcourt" de l'API languesListe.php)   \]   ... }

**themes** {

  
  **themes\_id** \[  
    **theme\_id** : Identifiant Numérique du theme du jeu   \]

  **theme\__id_\_medias** { _id : identifiant numerique du theme du jeu_

  
    **theme\__id_\_media\_pictoliste** : url de téléchargement du média : Pictogramme de liste  
    **theme\__id_\_media\_pictomonochrome** : url de téléchargement du média : Pictogramme Monochrome  
    **theme\__id_\_media\_pictocouleur** : url de téléchargement du média : Pictogramme Couleur   }

  **themes\_xx** \[

  
    **theme\_xx** : Theme du jeu en langue xx (xx = variable "nomcourt" de l'API languesListe.php)   \]   ... }

**styles** {

  
  **styles\_id** \[  
    **style\_id** : Identifiant Numérique du style du jeu en français (Voir genresListe.php)   \]

  **style\__id_\_medias** { _id : identifiant numerique du style du jeu_

  
    **style\__id_\_media\_pictoliste** : url de téléchargement du média : Pictogramme de liste  
    **style\__id_\_media\_pictomonochrome** : url de téléchargement du média : Pictogramme Monochrome  
    **style\__id_\_media\_pictocouleur** : url de téléchargement du média : Pictogramme Couleur   }

  **styles\_xx** \[

  
    **style\_xx** : Style du jeu en langue xx (xx = variable "nomcourt" de l'API languesListe.php)   \]   ... }

**sp2kcfg** : Contenu texte du fichier de config .p2k (Pad2Keyboard) recalbox

**actions** \[

  
  **action** {  
    **id** : Identifiant Numérique de l'action  
    **controle** \[  
      **langue** : Langue de l'action  
      **text** : Texte de l'action dans la langue indiquée  
      **recalboxtext** : Texte de l'action dans la langue indiquée et boutons standardisés recalbox     \]   }   ... \]

**couleurs** \[

  
  **couleur** {  
    **id** : Identifiant Numérique de la couleur  
    **controle** : identifiant textuel du controle  
    **hexa** : code hexadécimal de la couleur   }   ... \]

**medias** {

  
  **media\_screenshot** : url de téléchargement du média : Capture d'écran  
  **media\_fanart** : url de téléchargement du média : Fanart du jeux (fond d'écran personnalisé)  
  **media\_video** : url de téléchargement du média : Capture Vidéo du jeu  
  **media\_marquee** : url de téléchargement du média : Marquee  
  **media\_screenmarquee** : url de téléchargement du média : Screen Marquee  
**media\_wheels** {  
  **media\_wheel\_xx** : url de téléchargement du média : Logo Couleur région région xx (xx = variable "nomcourt" de l'API regionsListe.php)   ... }

**media\_wheelscarbon** {

  
  **media\_wheelcarbon\_xx** : url de téléchargement du média : Wheel version Carbon région région xx (xx = variable "nomcourt" de l'API regionsListe.php)   ... }

**media\_wheelssteel** {

  
  **media\_wheelsteel\_xx** : url de téléchargement du média : Wheel version Steel région région xx (xx = variable "nomcourt" de l'API regionsListe.php)   ... }

**media\_boitiers** {

  
  **media\_boitiers\_texture** {  
    **media\_boitier\_texture\_xx** : url de téléchargement du média : Image Texture du boitier région région xx (xx = variable "nomcourt" de l'API regionsListe.php)     ...   }

  **media\_boitiers\_2d** {

  
    **media\_boitier\_2d\_xx** : url de téléchargement du média : Image Boitier version 2D région région xx (xx = variable "nomcourt" de l'API regionsListe.php)     ...   }

  **media\_boitiers\_3d** {

  
    **media\_boitier\_3d\_xx** : url de téléchargement du média : Image Boitier version 3D région région xx (xx = variable "nomcourt" de l'API regionsListe.php)     ...   } }

**media\_supports** {

  
  **media\_supports\_texture** {  
    **media\_support\_texture\_xx** : url de téléchargement du média : Image Texture du support région région xx (xx = variable "nomcourt" de l'API regionsListe.php)     ...   }

  **media\_supports\_2d** {

  
    **media\_support\_2d\_xx** : url de téléchargement du média : Image Support version 2D région xx (xx = variable "nomcourt" de l'API regionsListe.php)     ...   } }

Pour les Jeux multi-support (exemple sur plusieurs CD), ajouter le numéro de support, exemple : **media\_support\_texture\_fr1** ou **media\_support\_2d\_eu2**

**media\_flyer** {

  
  **media\_flyer\_xx** : url de téléchargement du média : Image du flyer région xx (xx = variable "nomcourt" de l'API regionsListe.php)   ... }

Pour les Flyers multi-pages, ajouter le numéro de page, exemple : **media\_flyer\_wor1**, **media\_flyer\_wor2**, ...

**media\_manuel** {

  
  **media\_manuel\_xx** : url de téléchargement du média : Manuel format PDF - région xx (xx = variable "nomcourt" de l'API regionsListe.php)   ... }

**media\_bezels** {

  
  **media\_bezel4-3** {  
    **media\_bezel4-3\_xx** : url de téléchargement du média : Bezel 4:3 du jeu région xx (xx = variable "nomcourt" de l'API regionsListe.php)     ...   }

  **media\_bezel16-9** {

  
    **media\_bezel16-9\_xx** : url de téléchargement du média : Bezel 16:9 du jeu région xx (xx = variable "nomcourt" de l'API regionsListe.php)     ...   }

  **media\_bezel16-10** {

  
    **media\_bezel16-10\_xx** : url de téléchargement du média : Bezel 16:10 du jeu région xx (xx = variable "nomcourt" de l'API regionsListe.php)     ...   } }

**roms** \[ _Liste des roms connus associées au jeu_

  
  **rom** (xml) / **romid** (json) {  
    **id** : identifiant numérique de la rom  
    **romnumsupport** : numero de support (ex : 1 = disquette 01 ou CD 01)  
    **romtotalsupport** : nombre total de support (ex : 2 = 2 disquettes ou 2 CDs)  
    **romfilename** : nom du ficher rom ou du dossier  
    **romsize** : taille en octect du fichier rom ou taille du contenu du dossier  
    **romcrc** : résultat du calcul CRC32 du fichier rom ou du fichier le plus gros du dossier "rom"  
    **rommd5** : résultat du calcul MD5 du fichier rom ou du fichier le plus gros du dossier "rom"  
    **romsha1** : résultat du calcul SHA1 du fichier rom ou du fichier le plus gros du dossier "rom"  
    **romcloneof** : identifiant numérique de la rom parent si la rom est un clone (Systèmes Arcade)  
    **beta** : Version Beta du jeu (0=non / 1=oui)  
    **demo** : Version Demo du jeu (0=non / 1=oui)  
    **trad** : Version Traduite du jeu (0=non / 1=oui)  
    **hack** : Version Modifiée du jeu (0=non / 1=oui)  
    **unl** : Jeu non "Officiel" (0=non / 1=oui)  
    **alt** : Version Alternative du jeu (0=non / 1=oui)  
    **best** : Meilleur Version du jeu (0=non / 1=oui)  
    **netplay** : Compatible Netplay (0=non / 1=oui) \]

**rom** { _Informations sur la rom scrapé (si trouvé dans la base de données)_

  
  **rom** (xml) / **romid** (json) {  
    **id** : identifiant numérique de la rom  
    **romnumsupport** : numero de support (ex : 1 = disquette 01 ou CD 01)  
    **romtotalsupport** : nombre total de support (ex : 2 = 2 disquettes ou 2 CDs)  
    **romfilename** : nom du ficher rom ou du dossier  
    **romserial** : numero de série du fabriquant  
    **romregions** : region(s) de la rom ou du dossier (ex : "fr,us,sp" )  
    **romlangues** : langue(s) de la rom ou du dossier (ex : "fr,en,es" )  
    **romtype** : type de rom  
    **romsupporttype** : type de support  
    **romsize** : taille en octect du fichier rom ou taille du contenu du dossier  
    **romcrc** : résultat du calcul CRC32 du fichier rom ou du fichier le plus gros du dossier "rom"  
    **rommd5** : résultat du calcul MD5 du fichier rom ou du fichier le plus gros du dossier "rom"  
    **romsha1** : résultat du calcul SHA1 du fichier rom ou du fichier le plus gros du dossier "rom"  
    **romcloneof** : identifiant numérique de la rom parent si la rom est un clone (Systèmes Arcade)  
    **beta** : Version Beta du jeu (0=non / 1=oui)  
    **demo** : Version Demo du jeu (0=non / 1=oui)  
    **trad** : Version Traduite du jeu (0=non / 1=oui)  
    **hack** : Version Modifiée du jeu (0=non / 1=oui)  
    **unl** : Jeu non "Officiel" (0=non / 1=oui)  
    **alt** : Version Alternative du jeu (0=non / 1=oui)  
    **best** : Meilleur Version du jeu (0=non / 1=oui)  
    **netplay** : Compatible Netplay (0=non / 1=oui)  
    **joueurs** : Nombre de joueurs spécifique a la rom (si différente du jeu "d'origine")  
    **dates** {  
      **id texte region (france=date\_fr,europe=date\_eu,usa=date\_us,japon=date\_jp,...)** : Date de sortie spécifique a la rom (si différente du jeu "d'origine") dans la région indiquées     }

    **editeur** : Nom de l'editeur spécifique a la rom (si différente du jeu "d'origine")

  
    **developpeur** : Nom du developpeur spécifique a la rom (si différente du jeu "d'origine")  
    **synopsis** {  
      **synopsis\_xx** : Description spécifique a la rom (si différente du jeu "d'origine") en langue xx (xx = variable "nomcourt" de l'API languesListe.php)       ...     }

    **clonetypes** {

  
      **clonetypes\_id** : identifiant numérique du type de clone  
      **clonetypes\_xx** : désignation du type de hack région xx (xx = variable "nomcourt" de l'API regionsListe.php)       ...     }

    **hacktypes** {

  
      **hacktypes\_id** : identifiant numérique du type de hack  
      **hacktypes\_xx** : désignation du type de hack région xx (xx = variable "nomcourt" de l'API regionsListe.php)       ...     }   } } Exemple d'appel  
[https://api.screenscraper.fr/api2/jeuInfos.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test&crc=50ABC90A&systemeid=1&romtype=rom&romnom=Sonic%20The%20Hedgehog%202%20(World).zip&romtaille=749652](https://api.screenscraper.fr/api2/jeuInfos.php?devid=xxx&devpassword=yyy&softname=zzz&output=xml&ssid=test&sspassword=test&crc=50ABC90A&systemeid=1&romtype=rom&romnom=Sonic%20The%20Hedgehog%202%20\(World\).zip&romtaille=749652)  

mediaJeu.php : Téléchargement des médias images des jeux

Paramètres d'entrées :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**ssid**(non obligatoire) : identifiant ScreenScraper de l'utilisateur  
**sspassword**(non obligatoire) : Mot de passe ScreenScraper de l'utilisateu  
**crc** : calcul crc de l'image existante en local  
**md5** : calcul md5 de l'image existante en local  
**sha1** : calcul sha1 de l'image existante en local  
**systemeid** : identifiant numérique du système (voir systemesListe.php)  
**jeuid** : identifiant numérique du jeux (voir jeuInfos.php)  
**media** : identifiant texte du média à retourner (voir jeuInfos.php)  
**mediaformat**(non obligatoire) : format (extension) du media : ex : jpg, png, mp4, zip, mp3, ... ( donnée informative : ne retourne pas le média au format spécifié)  
Paramètres de sortie :  
**maxwidth**(non obligatoire) : Largeur Maximum en pixels de l'image retournée  
**maxheight**(non obligatoire) : Hauteur Maximum en pixels de l'image retournée  
**outputformat**(non obligatoire) : Format (extrension) de l'image retournée : **png** ou **jpg**  
Element Retourné : **Image PNG** ou

Texte **CRCOK** ou **MD5OK** ou **SHA1OK** si le paramètres crc, md5 ou sha1 est identique au calcul crc, md5 ou sha1 de l'image du serveur (optimisation des mises à jour)

ou

Texte **NOMEDIA** si le fichier média n'a pas été trouvé

  
Exemple d'appel  
[https://api.screenscraper.fr/api2/mediaJeu.php?devid=xxx&devpassword=yyy&softname=zzz&ssid=test&sspassword=test&crc=&md5=&sha1=&systemeid=1&jeuid=3&media=wheel-hd(wor)](https://api.screenscraper.fr/api2/mediaJeu.php?devid=xxx&devpassword=yyy&softname=zzz&ssid=test&sspassword=test&crc=&md5=&sha1=&systemeid=1&jeuid=3&media=wheel-hd\(wor\))  

mediaVideoJeu.php : Téléchargement des médias vidéos des jeux

Paramètres :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**ssid** : identifiant ScreenScraper de l'utilisateur (optionel)  
**sspassword** : Mot de passe ScreenScraper de l'utilisateur (optionel)  
**crc** : calcul crc de la video existante en local  
**md5** : calcul md5 de la video existante en local  
**sha1** : calcul sha1 de la video existante en local  
**systemeid** : identifiant numérique du système (voir systemesListe.php)  
**jeuid** : identifiant numérique du système (voir jeuInfos.php)  
**media** : identifiant texte du média à retourner (voir jeuInfos.php)  
**mediaformat** : format (extension) du media : ex : jpg, png, mp4, zip, mp3, ... (non obligatoire, donnée informative : ne retourne pas le média au format spécifié)  
Element Retourné : **Video MP4** ou

Texte **CRCOK** ou **MD5OK** ou **SHA1OK** si le paramètres crc, md5 ou sha1 est identique au calcul crc, md5 ou sha1 de la vidéo du serveur (optimisation des mises à jour)

ou

Texte **NOMEDIA** si le fichier média n'a pas été trouvé

  
Exemple d'appel  
[https://api.screenscraper.fr/api2/mediaVideoJeu.php?devid=xxx&devpassword=yyy&softname=zzz&ssid=test&sspassword=test&crc=&md5=&sha1=&systemeid=1&jeuid=3&media=video](https://api.screenscraper.fr/api2/mediaVideoJeu.php?devid=xxx&devpassword=yyy&softname=zzz&ssid=test&sspassword=test&crc=&md5=&sha1=&systemeid=1&jeuid=3&media=video)  

mediaManuelJeu.php : Téléchargement des manuels des jeux

Paramètres :  
**devid** : votre identifiant développeur  
**devpassword** : votre mot de passe développeur  
**softname** : nom du logiciel appelant  
**ssid** : identifiant ScreenScraper de l'utilisateur (optionel)  
**sspassword** : Mot de passe ScreenScraper de l'utilisateur (optionel)  
**crc** : calcul crc du fichier manuel existant en local  
**md5** : calcul md5 du fichier manuel existant en local  
**sha1** : calcul sha1 du fichier manuel existant en local  
**systemeid** : identifiant numérique du système (voir systemesListe.php)  
**jeuid** : identifiant numérique du système (voir jeuInfos.php)  
**media** : identifiant texte du média à retourner (voir jeuInfos.php)  
**mediaformat** : format (extension) du media : ex : jpg, png, mp4, zip, mp3, pdf, ... (non obligatoire, donnée informative : ne retourne pas le média au format spécifié)  
Element Retourné : **Manuel PDF** ou

Texte **CRCOK** ou **MD5OK** ou **SHA1OK** si le paramètres crc, md5 ou sha1 est identique au calcul crc, md5 ou sha1 de la vidéo du serveur (optimisation des mises à jour)

ou

Texte **NOMEDIA** si le fichier média n'a pas été trouvé

  
Exemple d'appel  
[https://api.screenscraper.fr/api2/mediaManuelJeu.php?devid=xxx&devpassword=yyy&softname=zzz&ssid=test&sspassword=test&crc=&md5=&sha1=&systemeid=1&jeuid=3&media=manuel(eu)](https://api.screenscraper.fr/api2/mediaManuelJeu.php?devid=xxx&devpassword=yyy&softname=zzz&ssid=test&sspassword=test&crc=&md5=&sha1=&systemeid=1&jeuid=3&media=manuel\(eu\))  

  

botNote.php : Système pour l'automatisation d'envoi de note de jeu d'un membre ScreenScraper

  

botProposition.php : Système pour automatisation d'envoi de propositions d'infos ou de médias a ScreenScraper

La requête doit être envoyée sous forme d'un formulaire html de type "multipart/form-data" avec la methode "POST".

Paramètres d'entrées :

  
**ssid** : (type "text") identifiant ScreenScraper de l'utilisateur  
**sspassword** : (type "text") Mot de passe ScreenScraper de l'utilisateur  
**gameid** : (type "text") identifiant numérique du jeu sur ScreenScraper ou

**romid** : (type "text") identifiant numérique de la rom sur ScreenScraper

Pour proposer une info textuelle :

**modiftypeinfo** : (type "text") type d'info envoyé (voir liste "modiftypeinfo")

  
**modifregion** : (type "text") nom court de la region de l'information (optionel: voir liste "modiftypeinfo" / liste des régions "regionsListe.php")  
**modiflangue** : (type "text") nom court de la langue de l'information (optionel: voir liste "modiftypeinfo" / liste des régions "languesListe.php")  
**modifversion** : (type "text") version de l'information (optionel: voir liste "modiftypeinfo")  
**modiftexte** : (type "text") Information proprement dite  
**modifsource** : (type "text") (optionel) Source (url de la page internet, scan du support original, auteur, ...) de l'information

**Exemple de formulaire html :**

  
`<html>   <head>   <META http-equiv="Content-Type" content="text/html; charset=UTF-8">    <META http-equiv="content-language" content="fr">    <title></title>   </head>    <body>      <form name="myform" id="myform" method="post" enctype="multipart/form-data" action="https://api.screenscraper.fr/api2/botProposition.php?ssid=xxx&sspassword=yyy">        <input type="text" name="gameid" value="3">        <input type="text" name="modiftypeinfo" value="description">       <input type="text" name="modifregion" value="">          <input type="text" name="modiflangue" value="fr">        <input type="text" name="modifversion" value="">        <input type="text" name="modiftexte" value="ici, le synopsis du jeu ! ne pas valider, c'est un test ;)">        <input type="text" name="modifsource" value="botProposition / source de l'info">       <input type="submit" value="envoyer">      </form>          <script>      document.getElementById("myform").submit();    </script>             </body> </html>`  Pour proposer un média :

**modiftypemedia** : (type "text") type de média envoyé (voir liste "modiftypemedia")

  
**modifmediafile** : (type "file") Fichier (Format du fichier : voir liste "modiftypemedia")  
**modifmediafileurl** : (type "text") url du média a télécharger (Format du fichier : voir liste "modiftypemedia")  
**modiftyperegion** : (type "text") nom court de la region de l'information (optionel: voir liste "modiftypemedia" / liste des régions "regionsListe.php")  
**modiftypenumsupport** : (type "text") numero de support (optionel: voir liste "modiftypemedia" / numéro de 0 a 10)  
**modiftypeversion** : (type "text") version de l'information (optionel: voir liste "modiftypemedia")  
**modifmediasource** : (type "text") (optionel) Source (url de la page internet, scan du support original, auteur, ...) de l'information

Elements Retournés :

Renvoi une information textuelle sur le bon ou mauvais fonctionnement de la procédure

Liste des types d'infos textuelles pour les jeux (modiftypeinfo)

Type

Designation

Région

Langue

Choix Multiple

Format

name

Nom du jeux (par Région)

obligatoire

Texte

editeur

Editeur

Texte

developpeur

Developpeur

Texte

players

Nombre de Joueur(s)

Nom du groupe (voir groupes)

score

Note

Note sur 20 de 0 a 20

rating

Classification

oui

Nom du groupe (voir groupes)

genres

Genre(s)

oui

Nom français du groupe (voir groupes)

datessortie

Date(s) de sortie

obligatoire

Format : aaaa-mm-jj ("xxxx-01-01" si année seulement)

rotation

Rotation

0 a 360

resolution

Resolution

Texte : Largeur x hauteur en pixels ( ex : 320x240)

modes

Mode(s) de Jeux

oui

Texte

familles

Famille(s)

oui

Nom de la famille (ex: "Sonic" pour "Sonic 3D pinball")

numero

Numero

oui

Nom de la serie + Numero dans la série (ex : "sonic the Hedgehog 2")

styles

Style(s)

oui

Texte : Style graphique

themes

Theme(s)

Texte : Thème du jeu (ex : "Vampire")

description

Synopsis

obligatoire

Texte

Liste des types d'infos textuelles pour les roms (modiftypeinfo)

Type

Designation

Région

Langue

Choix Multiple

Format

developpeur

Developpeur

Texte

editeur

Editeur

Texte

datessortie

Date(s) de sortie

obligatoire

Format : aaaa-mm-jj ("xxxx-01-01" si année seulement)

players

Nombre de Joueur(s)

Nom du groupe (voir groupes)

regions

Région(s)

oui

Nom français du groupe (voir groupes)

langues

Langue(s)

oui

Nom français du groupe (voir groupes)

clonetype

Type(s) de Clone

oui

Texte

hacktype

Type(s) de Hack

oui

Texte

friendly

Ami avec...

oui

Texte

serial

Numero de série constructeur

oui

Texte

description

Synopsis

obligatoire

Texte

Liste des types de média (regionsListe)

Type

Designation

Format

Région

Num Support

Multi-Version

sstitle

Screenshot Titre

jpg

obligatoire

ss

Screenshot

jpg

obligatoire

fanart

Fan Art

jpg

video

Vidéo

mp4

themehs

Thème Hyperspin

zip

marquee

Marquee

png

screenmarquee

ScreenMarquee

png

obligatoire

overlay

Overlay

png

obligatoire

manuel

Manuel

pdf

obligatoire

flyer

Flyer

jpg

obligatoire

obligatoire

steamgrid

Steam Grid

jpg

maps

Maps

jpg

oui

wheel

Wheel

png

obligatoire

wheel-hd

Logos HD

png

obligatoire

box-2D

Boitier : Avant

png

obligatoire

obligatoire

box-2D-side

Boitier : Tranche

png

obligatoire

obligatoire

box-2D-back

Boitier : Arrière

png

obligatoire

obligatoire

box-texture

Boitier : Texture

png

obligatoire

obligatoire

support-texture

Support : Texture

png

obligatoire

obligatoire

box-scan

Boitier : Source(s)

png

obligatoire

obligatoire

oui

support-scan

Support : Source(s)

png

obligatoire

obligatoire

oui

bezel-4-3

Bezel 4:3 Horizontal

png

obligatoire

bezel-4-3-v

Bezel 4:3 Vertical

png

obligatoire

bezel-4-3-cocktail

Bezel 4:3 Cocktail

png

obligatoire

bezel-16-9

Bezel 16:9 Horizontal

png

obligatoire

bezel-16-9-v

Bezel 16:9 Vertical

png

obligatoire

bezel-16-9-cocktail

Bezel 16:9 Cocktail

png

obligatoire

wheel-tarcisios

Wheel Tarcisio's

png

videotable

Vidéo Table (FullHD)

mp4

videotable4k

Vidéo Table (4k)

mp4

videofronton16-9

Vidéo Fronton (3 Ecrans)

mp4

videofronton4-3

Vidéo Fronton (2 Ecrans)

mp4

videodmd

Vidéo DMD

mp4

videotopper

Vidéo Topper

mp4

sstable

Screenshot Table

jpg

ssfronton1-1

Screenshot Fronton 1:1

jpg

ssfronton4-3

Screenshot Fronton 4:3

jpg

ssfronton16-9

Screenshot Fronton 16:9

jpg

ssdmd

Screenshot DMD

jpg

sstopper

Screenshot Topper

jpg
