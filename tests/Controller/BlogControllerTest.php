<?php

namespace App\Tests\Controller;

use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

/**
 * Class BlogControllerTest.
 */
class BlogControllerTest extends WebTestCase
{
    /** index method.
     *
     */
    public function testShowAll(): void
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/blog/');

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertEquals(3, $crawler->filter('#testul > li')->count());
    }

    /** new method.
     *
     */
    public function testAddBlog(): void
    {
        $client = static::createClient();

        $userRepository = static::$container->get(UserRepository::class);

        $testUser = $userRepository->findOneByEmail('panchalkeyur1@gmail.com');
        $client->loginUser($testUser);

        $crawler = $client->request('POST', '/blog/new');

        $buttonCrawlerNode = $crawler->selectButton('blogbtn');

        $form = $buttonCrawlerNode->form([
            'blog[title]' => 'blog title',
            'blog[category]' => 'technology',
            'blog[shortdescription]' => 'blog short description',
            'blog[longdescription]' => 'blog long description',
            'blog[image]' => 'D:\Symfony\Blog-application\public\img\91c9c0ddd91bf6ed2f3c07da295a00e3.jpg', // PATH FOR OFFICE PC
        //  'blog[image]' => 'C:\Users\panch\Downloads\Github Repository\Blog-Application\public\img\91c9c0ddd91bf6ed2f3c07da295a00e3.jpg', // PATH FOR PERSONAL PC
        ]);

        $client->submit($form);

        $crawler = $client->request('GET', '/blog/all_user_blog');

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertEquals(1, $crawler->filter('h1')->count());
    }

    /** blog_details method.
     *
     */
    public function testShowBlogDetails(): void
    {
        $client = static::createClient();

        $client->request('GET', '/blog/blog_details/1');

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertSelectorTextContains('#testh1', 'blog title');
    }

    /** filter_date method.
     *
     */
    public function testBlogFilterDate(): void
    {
        $client = static::createClient();

        $client->request('GET', '/blog/blog_filter_date');

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertSelectorTextContains('#testnofound', 'No Blog Found.');
    }

    /** all_user_blog method.
     *
     */
    public function testAllUserBlog(): void
    {
        $client = static::createClient();

        $userRepository = static::$container->get(UserRepository::class);

        $testUser = $userRepository->findOneByEmail('panchalkeyur1@gmail.com');
        $client->loginUser($testUser);

        $crawler = $client->request('GET', '/blog/all_user_blog');

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertGreaterThan(0, $crawler->filter('.testpost')->count());
    }
}
