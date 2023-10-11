<?php

namespace App\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends AbstractController
{
    public function home(): Response
    {
        return $this->render('default/home.html.twig');
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
        return $this->render('default/category.html.twig');
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
        return $this->render('default/post.html.twig');
    }
}