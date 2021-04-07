<?php

namespace App\Tests\Controller;

use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

/**
 * Class CommentControllerTest.
 */
class CommentControllerTest extends WebTestCase
{
    /** all_user_blog method.
     *
     */
    public function testAllUserComments()
    {
        $client = static::createClient();

        $userRepository = static::$container->get(UserRepository::class);

        $testUser = $userRepository->findOneByEmail('panchalkeyur1@gmail.com');
        $client->loginUser($testUser);

        $crawler = $client->request('GET', '/comments/all_user_comments');

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertGreaterThan(0, $crawler->filter('.testdiv')->count());
    }

    /** new method.
     *
     */
    public function testAddComment()
    {
        $client = static::createClient();
        $userRepository = static::$container->get(UserRepository::class);

        $testUser = $userRepository->findOneByEmail('panchalkeyur1@gmail.com');
        $client->loginUser($testUser);

        $crawler = $client->request('POST', '/comments/comments_new/{1}');

//        $buttonCrawlerNode = $crawler->selectButton('comment');
//
//        var_dump($buttonCrawlerNode);
//
//
//        $form = $buttonCrawlerNode->form([
//            'message' => 'my comment',
//
//        ]);
//
//
//        $client->submit($form);

        $client->request('GET', '/blog/');
        $this->assertEquals(200, $client->getResponse()->getStatusCode());
    }
}
