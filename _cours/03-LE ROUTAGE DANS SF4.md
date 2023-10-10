# Le Routage | Symfony 6

> Doc de référence : https://symfony.com/doc/current/routing.html

Suite à installation nous n'avons pour le moment aucune route de défini dans notre application. A nous de faire le nécessaire.
En réalité, symfony nous offres plusieurs possibilités selon nos préférences pour gérer les routes *(URL)* de notre application : 

> Annotations, YAML, PHP et XML

## Le YAML

 YAML, est un langage simple qui décrit les données. Il permet de représenter des données structurées, comme le ferait XML par exemple, mais de manière plus naturelle et moins verbeuse. C'est à dire de manière aisément modifiable et  compréhensibles par un humain, quel que soit le langage de programmation".

La plupart des fichiers de configuration dans symfony sont au format YAML.

Rendez-vous sur :
>  config / routes.yaml

Nous allons retirer les commentaires et créer notre premier contrôleur.

    home:
        path: /
        controller: App\Controller\DefaultController::home

*Explication du fonctionnement des routes en YAML*

## Création de DefaultController

> Doc de référence : https://symfony.com/doc/current/controller.html

 1. Créer une nouvelle classe 'DefaultController dans le dossier `src/Controller`

**Nous allons écrire ensemble notre première action :**

    use Symfony\Component\HttpFoundation\Response;
    
    public function home() {
        return new Response("<html><body><h1>PAGE D'ACCUEIL</h1></body></html>");
    }

Actualisons maintenant notre page pour voir le résultat.
Testons maintenant dans notre console les commandes suivantes :
> php bin/console debug:router --env=prod
> php bin/console debug:router

 - Que pouvez-nous constater ?
 - D'où proviennent les routes complémentaires ? A quoi servent-elles ?

![enter image description here](https://github.com/biynmedia/Formation-Symfony/blob/master/LES-FONDAMENTAUX/captures/symfony_debug_console_dev.png?raw=true)

## Les Annotations

Dans symfony, pour plus de facilité, nous pouvons écrire nos routes avec des annotations.
> Doc de référence : https://symfony.com/doc/current/routing.html#creating-routes

Nous pouvons maintenant écrire notre première route grâce aux annotations.
**Par exemple pour afficher les articles d'une catégorie :** 

    /**
      * Page permettant d'afficher les articles d'une catégorie
      * ex. http://localhost:8000/politique
      */
    #[Route('/{alias}', name: 'default_category', methods: ['GET'])]
    public function category($alias = 'politique') {
        return new Response("<html><body><h1>PAGE CATEGORIE : $alias </h1></body></html>");
    }

Nous pouvons ensuite tester dans notre console, la détection de nos routes par Symfony :

    php bin/console router:match /politique

![enter image description here](https://github.com/biynmedia/Formation-Symfony/blob/master/LES-FONDAMENTAUX/captures/symfony_debug_console_route.png?raw=true)

#### Mettons à jour notre fonction home avec les annotations PHP
#### Créons notre route pour afficher les articles.

### En plus :  Les contrôleurs notable
Testons les deux contrôleurs suivants :

#### RedirectController

> Doc de référence : https://symfony.com/doc/current/routing.html#redirecting-to-urls-and-routes-directly-from-a-route

Ajoutons dans notre fichier routes.yaml le code suivant :

    home_alt:
        path: /accueil
        controller: Symfony\Bundle\FrameworkBundle\Controller\RedirectController
        defaults:
            route: home
            permanent: true
            
Grâce à **redirectAction** du **RedirectController**, je peux créer une redirection sans avoir dû créer un contrôleur personnalisé..

#### TemplateController

> Doc de référence : https://symfony.com/doc/current/templates.html#templates-render-from-route

Il se peut que dans certains cas, nous ayons besoin d'afficher une simple page, sans pour autant passer de paramètre. Nous pouvons alors grâce au TemplateController éviter la création d'un contrôleur dédié.

    mentions_legales:
        path:         /page/mentions-legales
        controller:   Symfony\Bundle\FrameworkBundle\Controller\TemplateController
        defaults:
            template: static/mentions-legales.html.twig


### Le parcours d'une requète

![enter image description here](https://github.com/biynmedia/Formation-Symfony/blob/master/LES-FONDAMENTAUX/captures/request-flow.png?raw=true)

Written with ❤️ by [Hugo LIEGEARD](https://github.com/hugoliegeard).
Screenshots 📸 by [Frogg's web tools](https://tool.frogg.fr/).
