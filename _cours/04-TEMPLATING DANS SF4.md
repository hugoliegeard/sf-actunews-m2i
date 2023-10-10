# Le Templating | Symfony 6

Nous allons mettre en place le thème de notre projet ActuNews.
Mais avant cela, nous allons découvrir Twig.

> Doc de référence : 
> https://symfony.com/doc/current/templating.html
> https://twig.symfony.com

## Présentation de Twig

Les templates vont nous permettre de séparer le code PHP du code HTML/XML/Text, etc. Seulement, pour faire du HTML de présentation, on a toujours besoin d'un peu de code dynamique : faire une boucle pour afficher toutes les annonces de notre plateforme, créer des conditions pour afficher un menu différent pour les utilisateurs authentifiés ou non, etc. Pour faciliter ce code dynamique dans les templates, le moteur de templates Twig offre son pseudo-langage à lui. 
*Source : Openclassroom.*

## Mise en Place de notre Thème

**Nous allons maintenant procéder aux étapes suivantes :**

 - Création de notre structure HTML de base : **base.html.twig** ;
 - Hériter du **Controller** Symfony ;
 - Rendu du template Twig de notre page d'Accueil.

> Doc de Référence
> https://symfony.com/doc/current/controller.html#the-base-controller-classes-services et https://symfony.com/doc/current/controller.html#rendering-templates

Créons tout d'abord notre fichier `templates/base.html.twig`
> NOTA BENE : Ce fichier servira de support, de squelette à l'ensemble de nos autres pages.

    <!doctype html>
    <!--
       _        _
      /_\   ___| |_ _   _ _ __   _____      _____
     //_\\ / __| __| | | | '_ \ / _ \ \ /\ / / __|
    /  _  \ (__| |_| |_| | | | |  __/\ V  V /\__ \
    \_/ \_/\___|\__|\__,_|_| |_|\___| \_/\_/ |___/
    -->
    <html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>{% block title %}{% endblock %}</title>
        {% block stylesheets %}{% endblock %}
    </head>
    <body>
    
    {# -- Nous mettrons contenu HTML ici -- #}
    {% block body %}{% endblock %}
    {% block javascripts %}{% endblock %}
    
    </body>
    </html>

Dans ce fichier de base, nous utilisons un système de `{% block %}{% endblock %}`. Cette architecture nous permet de définir des emplacements dans lequel nous pourront venir plus tard positionner du code.

Pour vous aider à comprendre, imaginer le parking d'une résidence avec avec des places numérotés et attribuées à chaque résident. Le soir après une dure journée de travail, le résident en rentrant chez lui regagne sa place de parking.

C'est la même chose aussi, au moment de la compilation de votre template, le code HTML que vous aurez défini rejoindra la place de parking  `le block` qui lui correspond.

> Dans quelques instants vous allez voir le résultat ;-)

Allez, mettons à jour notre controleur `src/Controller/DefaultController` :

    use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
    
    class DefaultController extends AbstractController
    
    public function home() {
        return $this->render('base.html.twig');
    }

Rendez-vous sur la page : http://localhost:8000 et observons le code source.

Que constatez-vous ?

Notre fichier de base est bien compilé !
Ce n'est que le début ! Allons plus loin 🤗

## Mise en Place de notre Thème

Nous allons mettre en place l'architecture nécessaire au fonctionnement de notre thème ActuNews en nous appuyant sur twig et bootstrap.

**Tout d'abord, ajoutons dans notre fichier de base le CSS et le JS et bootstrap.**

Mettons ensuite en place notre thème :

 1. Création du Menu `templates/components/_nav.html.twig`

*Nous utiliserons la navbar de bootstrap :*
https://getbootstrap.com/docs/5.3/components/navbar/#nav

```html
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="{{ path('home') }}">ActuNews</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="{{ path('default_category', { 'alias' : 'politique' }) }}">Politique</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="{{ path('default_category', { 'alias' : 'economie' }) }}">Economie</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="{{ path('default_category', { 'alias' : 'social' }) }}">Social</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="{{ path('default_category', { 'alias' : 'culture' }) }}">Culture</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
```

 2. Création du Footer `templates/components/_footer.html.twig`
 
*Pour aller plus vite utilisez le code ci-dessous :*

    <!-- Pied de page -->
    <footer class="mt-4 pt-4 ">
        <div class="container border-top">
            <div class="row">
                <div class="col-12 col-md">
                    <h5>Actunews</h5>
                    <small class="d-block text-muted">&copy; 2023 </small>
                </div>
                <div class="col-6 col-md">
                    <h5>Catégories</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-muted">Politique</a></li>
                        <li><a href="#" class="text-muted">Economie</a></li>
                        <li><a href="#" class="text-muted">Culture</a></li>
                        <li><a href="#" class="text-muted">Loisirs</a></li>
                    </ul>
                </div>
                <div class="col-6 col-md">
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-muted">Contactez-nous</a></li>
                        <li><a href="#" class="text-muted">Mentions légales</a></li>
                        <li><a href="#" class="text-muted">Politique de confidentialité</a></li>
                        <li><a href="#" class="text-muted">Plan du site</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container-fluid bg-dark">
            <div class="row">
                <div class="col">
                    <p class="text-center text-white">&copy; Actunews  2023 </p>
                </div>
            </div>
        </div>
    </footer>
    <!-- Fin -- Pied de page -->

 4. Création de notre Vue Accueil `templates/default/index.html.twig`

**Et enfin notre page d'accueil :** 

    {% extends "base.html.twig" %}
    
    {% block title %}Accueil{% endblock %}
    
    {% block body %}
    <main>
	    <!-- Titre de la page -->
	    <div class="p-3 mx-auto text-center">
	        <h1 class="display-4">Actunews</h1>
	    </div>

	    <!-- Contenu de la page -->
	    <!-- .py-5.bg-light>.container>.row>.col-md-4*6>.card.shadow-sm -->
	    <div class="py-5 bg-light">
	        <div class="container">
	            <div class="row">
	                <div class="col">
	                    <h3>Page d'Exemple</h3>
	                </div>
	            </div>
	        </div>
	    </div>
    </main>
    {% endblock %}

Pour afficher les articles nous utiliserons les `cards` de bootstrap :
https://getbootstrap.com/docs/5.3/components/card/

    {# -- .py-5.bg-light>.container>.row>.col-md-4.mt-4 -- #}
        <div class="py-5 bg-light">
            <div class="container">
                <div class="row">
					<div class="card" style="width: 18rem;">
					  <img src="https://via.placeholder.com/500" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title">Card title</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn btn-primary">Lire la suite</a>
					  </div>
					</div>
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /.bg-light -->

Dupliquez la page accueil et créez le fichier `templates/default/category.html.twig` 

Mettons à jour ensuite notre fonction `category` dans `DefaultController`

    public function category() {
        return $this->render('default/category.html.twig');
    }

> EXERCICE : Now is your turn, utilisez boostrap pour mettre en place la page Article.

### Génération des URLs :

> Doc de Référence : https://symfony.com/doc/current/templating.html#linking-to-pages

Nous allons maintenant mettre en place la navigation inter-pages de notre site.
	
    <a href="{{ path('default_index') }}">Accueil</a>

Ici, la fonction **path()** va demander à Symfony de créer une URL pour la route `default_index`. Le résultat après compilation sera alors :

    <a href="/">Accueil</a>

Lorsqu'il y à des paramètres, nous procédons de la façon suivantes : 

    <a href="{{ path('default_category', { alias : 'politique' }) }}">Politique</a>

Ce qui donnera :

    <a href="/politique">Politique</a>

> EXERCICE : A vous maintenant avec les liens article sur la page catégorie !

---

Written with ❤️ by [Hugo LIEGEARD](https://github.com/hugoliegeard).
