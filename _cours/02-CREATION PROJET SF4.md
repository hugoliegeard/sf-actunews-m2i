# Installation de Symfony 6

https://symfony.com/doc/current/index.html
Suivi des étapes de setup : https://symfony.com/doc/current/setup.html
## Installation simple grâce à la CLI Symfony :

### Pré-requis

Avant de procéder à votre installation de Symfony, vérifier que vous avez les dépendances suivantes : 

 - Composer : https://getcomposer.org/
 - Git : https://git-scm.com/

### Installation de la CLI Symfony (Windows) :

Grâce à la CLI de Symfony, nous allons pouvoir créer et déployer très rapidement nos projets symfony. Nos bénéficierons également d'un serveur de développement local sécurisé en HTTPS.  🎉

> CLI Symfony : https://symfony.com/download

Nous allons tout d'abord installer un utilitaire qui va automatiser l'installation et les mises à jour de la CLI : `scoop`

> Rendez-vous sur : https://scoop.sh/

A partir de la ouvrez votre PowerShell en mode "Administrateur" et exécutez la commande suivante : 

```
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser*
```
Fermez votre PowerShell et rouvrez le en mode "Normal"
Executez la dernière commande : 

```
irm get.scoop.sh | iex
```

Lancez l'installation de la CLI Symfony : 

    scoop install symfony-cli

### Création du Projet

Nous allons créer une application web traditionnelle

    symfony new --webapp actunews

### Lancement du Serveur

     cd actunews
     symfony serve

Pour effectuer le lancement en arrière plan du terminal : 

    symfony serve -d

### Ouverture dans le navigateur

**Composer** via la CLI de Symfony à installer pour nous automatiquement toute l'architecture de Symfony.

>http://localhost:8000/

### Barre de Débogage

Observez la barre de débogage. Au fur et à mesure que nous installerons de nouveaux packages, nous verrons de nouvelles options apparaître.

> Petit tour de découverte des options de la barre.

### Installation et Configuration du Plugin Symfony pour PHPStorm

Le plugin symfony pour PHPStorm permettra à notre IDE de reconnaître toutes les fonctionnalités de Symfony. 

**Nous allons installer :**

 1. PHP Annotations
![enter image description here](https://github.com/biynmedia/Formation-Symfony/blob/master/LES-FONDAMENTAUX/captures/plugin%20annotation.png?raw=true)
 2. PHP Toolbox
![enter image description here](https://github.com/biynmedia/Formation-Symfony/blob/master/LES-FONDAMENTAUX/captures/plugin%20toolbox.png?raw=true)
 3. Symfony Plugin
![enter image description here](https://raw.githubusercontent.com/biynmedia/Formation-Symfony/master/LES-FONDAMENTAUX/captures/plugin%20symfony.png)

> Nous pouvons ensuite activer le plugin et redémarrer PHPStorm.
> PS : Vérifiez que **App Directory** pointe sur le dossier **src** et **WebDirectory** sur le dossier **public**

![enter image description here](https://github.com/biynmedia/Formation-Symfony/blob/master/LES-FONDAMENTAUX/captures/symfony_settings.png?raw=true)

### Découvrir l'Architecture de SF6
> Doc de Référence : https://symfony.com/doc/current/page_creation.html#checking-out-the-project-structure

Written with ❤️ by [Hugo LIEGEARD](https://github.com/hugoliegeard).
Screenshots 📸 by [Frogg's web tools](https://tool.frogg.fr/).
