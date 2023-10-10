# Introduction à Symfony
## Composer
### Présentation

> Site Internet : https://getcomposer.org/
> Téléchargement : https://getcomposer.org/Composer-Setup.exe

Composer est un gestionnaire de dépendance qui vous permettra de définir les différentes dépendances pour votre projet. Composer utilise un fichier composer.json qui contient plusieurs informations sur le projet dont la liste des librairies utilisées. Il est ensuite capable de télécharger automatiquement ces librairies (et les dépendances associées) et de générer un autoloader pour les utiliser simplement dans vos projets PHP.

### Packagist

> Site Internet : https://packagist.org/
> Exemple : https://packagist.org/packages/symfony/var-dumper

Packagist est le repository principal de Composer. Il intègre des packages public installable à partir de Composer.

### Installation de VarDumper avec composer

Il existe plus d'une cinquantaine de composants Symfony.
Vous pouvez les utiliser individuellement ou ensemble dansDifférence entre Bundle / Package et Recipe ?
### Installation de VarDumper
Les composants de Symfony.

Il sont donc modulables. et c'est génial !
Je peux donc les utiliser en dehors du framework pour mes projets en PHP...

Prenons le cas du composant *VarDumper* :
https://symfony.com/doc/current/components/var_dumper.html

**Dans notre dossier projet exécutons la commande suivante :**

    composer require symfony/var-dumper

Nous observons un nouveau dossier et deux nouveaux fichiers :

 - vendor/
 - composer.json
 - composer.lock

**composer.json** : Le rôle principal du fichier  est de stocker la configuration des paquets à installer ainsi que leurs contraintes de version

**composer.lock** : Le rôle de ce fichier est de stocker les versions des paquets qui ont été installés lors de l’appel à la commande “composer install”.

L’objectif de ce fichier est de conserver les mêmes versions des paquets lors d’un déploiement de l’application ou lors de la récupération du projet par un collègue.

Cela permet d’éviter tous les effets de bord possible lié au changement de version d’un composant.

**Voyons comment l'utiliser :**

Créons maintenant un nouveau fichier `index.php` avec le code suivant :

    <?php
    
    // Activer l'autochargement des classes.
    // Ainsi, plus besoin de faire de require.
    require('vendor/autoload.php');
    
    // Déclaration de variables
    $string = "Je suis en string";
    $array = [1, 2, 3, 4];
    $datetime = new  Datetime();
    $bool = true;
    
    // Debuggage avec var_dump ou print_r
    
    dump($string);
    dump($array);
    dump($bool);
    dump($datetime);

Que pouvez-vous constater ?
**Ce composant va nous faciliter la vie en terme de debuggage !**

> NOTA BENE Grâce au mécanisme d'autoload de composer, nous n'avons plus besoin d'importer nos classes manuellement. Plus de requiere et autre include...

Vous pouvez utiliser n'importe quels composants symfony dans vos projets de la même façon !

Vive Composer, Vive Symfony et Vive la France 
*Trêve de flagornerie, passons aux choses sérieuses !*

Written with ❤️ by [Hugo LIEGEARD](https://github.com/hugoliegeard).
