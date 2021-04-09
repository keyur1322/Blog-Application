<?php

namespace App\Tests\Controller;

use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

/**
 * Class LoginControllerTest.
 */
class LoginControllerTest extends WebTestCase
{
    /** login method.
     *
     */
    public function testLogin(): void
    {
        $client = static::createClient();
        $userRepository = static::$container->get(UserRepository::class);

        // retrieve the test user
        $testUser = $userRepository->findOneByEmail('panchalkeyur1@gmail.com');

        // simulate $testUser being logged in
        $client->loginUser($testUser);
        $client->request('GET', '/blog/');

        $this->assertResponseIsSuccessful();
        $this->assertSelectorTextContains('h1', 'Blog');
    }
}
