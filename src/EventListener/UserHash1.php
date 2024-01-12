<?php
namespace App\EventListener;

use App\Entity\Post;
use App\Entity\User;
use Doctrine\ORM\Events;
use Doctrine\ORM\Event\PrePersistEventArgs;
use Symfony\Bundle\SecurityBundle\Security;
use Doctrine\Bundle\DoctrineBundle\Attribute\AsDoctrineListener;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

#[AsDoctrineListener(event: Events::prePersist, priority: 500, connection: 'default')]
class UserHash1
{
    private UserPasswordHasherInterface $passwordHasher;
    private $security;

    public function __construct(UserPasswordHasherInterface $passwordHasher, Security $security)
    {
        $this->passwordHasher = $passwordHasher;
        $this->security = $security;
    }
    
    // the listener methods receive an argument which gives you access to
    // both the entity object of the event and the entity manager itself
    public function prePersist(PrePersistEventArgs $args): void
    {
        $entity = $args->getObject();

        // if this listener only applies to certain entity types,
        // add some code to check the entity type as early as possible

        // Si l'intance concernée est de type User
        if ($entity instanceof User) {
            // On procède au hashage du password envoyé en clair
            $entity->setPassword(
                $this->passwordHasher->hashPassword(
                    $entity,
                    $entity->getPassword()
                )
            );
        }

        // Si l'instance est de type Post
        if ($entity instanceof Post) {
            // On procède à l'initialisation de l'auteur
            $user = $this->security->getUser();
            $entity->setUser($user);
        }
    }
}