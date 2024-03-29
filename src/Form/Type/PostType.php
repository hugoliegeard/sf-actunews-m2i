<?php

namespace App\Form\Type;

use App\Entity\Category;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use function Sodium\add;

class PostType extends AbstractType
{
    /**
     * Je crée ici un modèle de formulaire.
     * Ce modèle pourra me servir plus tard.
     * @param FormBuilderInterface $builder
     * @param array $options
     * @return void
     */
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title', TextType::class, [
                'label' => 'Titre de mon article',
                'attr' => [
                    'placeholder' => 'Saisissez le titre de votre article.'
                ]
            ])
            ->add('slug')
            ->add('category', EntityType::class, [
                'class' => Category::class,
                'choice_label' => 'name'
            ])
            ->add('image', TextType::class)
            ->add('content', TextareaType::class)
            ->add('submit', SubmitType::class, [
                'label' => 'Publier mon article'
            ]);
    }

}