<?php

namespace App\Controller;


use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController
{
    public function home(): Response
    {
        return new Response("<h1>PAGE ACCUEIL</h1>");
    }

    /**
     * Afficher les articles d'une catégorie
     * ex. http://localhost:8000/politique
     * @param string $slug
     * @return Response
     */
    #[Route('/{slug<\w+>}', name: 'default_category', methods: ['GET'])]
    public function category(string $slug): Response
    {
        return new Response("<h1>PAGE CATEGORY : $slug</h1>");
    }

    /**
     * Afficher un article
     * ex. http://localhost:8000/politique/slug-de-mon-article_86545.html
     * @param string $categorySlug
     * @param string $slug
     * @param int $id
     * @return Response
     */
    #[Route('/{categorySlug<\w+>}/{slug}_{id<\d+>}.html', name: 'default_post', methods: ['GET'])]
    public function post(string $categorySlug, string $slug, int $id): Response
    {
        return new Response("<h1>PAGE ARTICLE : $categorySlug \ $slug - $id</h1>");
    }
}