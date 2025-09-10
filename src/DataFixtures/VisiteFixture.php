<?php

namespace App\DataFixtures;

use App\Entity\Visite;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class VisiteFixture extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // Création du Faker pour la génération de valeurs aléatoires
        $faker = Factory::create('fr_FR');

        // Génération des enregistrements
        for($k=0 ; $k < 100 ; $k++)
        {
            $visite = new Visite;
            $visite->setVille;

        }
            
        $manager->flush();
    }
}
