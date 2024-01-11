<?php
namespace App\EventListener;

use App\Entity\Post;
use App\Entity\User;
use Doctrine\ORM\Events;
use Doctrine\ORM\Event\PrePersistEventArgs;
use Doctrine\Bundle\DoctrineBundle\Attribute\AsDoctrineListener;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;

#[AsDoctrineListener(event: Events::prePersist, priority: 500, connection: 'default')]
class UserHash1
{
    private UserPasswordHasherInterface $passwordHasher;
    //private $token;

    //public function __construct(UserPasswordHasherInterface $passwordHasher, TokenInterface $tokenInterface)
    public function __construct(UserPasswordHasherInterface $passwordHasher)
    {
        $this->passwordHasher = $passwordHasher;
        //$this->token = $tokenInterface;
    }
    
    // the listener methods receive an argument which gives you access to
    // both the entity object of the event and the entity manager itself
    public function prePersist(PrePersistEventArgs $args): void
    {
        $entity = $args->getObject();
        $user = $this->token->getUser();

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

        if ($entity instanceof Post) {
            // On procède à l'initialisation de l'auteur
            $entity->setUser($user);
        }
    }
}