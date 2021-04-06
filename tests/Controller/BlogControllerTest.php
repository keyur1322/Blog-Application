<?php

namespace App\Tests\Controller;

use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class BlogControllerTest extends WebTestCase
{
    /** index method.
     *
     */
    public function testShowAll()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/blog/');

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertEquals(3, $crawler->filter('#testul > li')->count());
    }

    /** new method.
     *
     */
    public function testAddBlog()
    {
        $client = static::createClient();

        $userRepository = static::$container->get(UserRepository::class);

        $testUser = $userRepository->findOneByEmail('john.doe@example.com');
        $client->loginUser($testUser);

        $crawler = $client->request('POST', '/blog/new');

        $buttonCrawlerNode = $crawler->selectButton('blog');

        $form = $buttonCrawlerNode->form([
            'blog[title]' => 'blog title',
            'blog[category]' => 'technology',
            'blog[ShortDescription]' => 'blog short description',
            'blog[LongDescription]' => 'blog long description',
            'blog[image]' => 'D:\Symfony\Blog-application\public\img\91c9c0ddd91bf6ed2f3c07da295a00e3.jpg',
        ]);

        $client->submit($form);

        $crawler = $client->request('GET', '/blog/all_user_blog');

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertEquals(1, $crawler->filter('h1')->count());
    }

    /** blog_details method.
     *
     */
    public function testShowBlogDetails()
    {
        $client = static::createClient();

        $client->request('GET', '/blog/blog_details/1');

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertSelectorTextContains('#testh1', 'blog title');
    }

//    /**
//     * @return string[][]
//     */
//    public function provideUrls(): array
//    {
//        return [
//          ['GET', '/blog/blog_filter_date'],
//          ['POST', '/blog/blog_filter_date'],
//        ];
//    }

    /** filter_date method.
     *
     */
    public function testBlogFilterDate()
    {
        $client = static::createClient();

        $client->request('GET', '/blog/blog_filter_date');

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertSelectorTextContains('#testnofound', 'No Blog Found.');
    }

    /** all_user_blog method.
     *
     */
    public function testAllUserBlog()
    {
        $client = static::createClient();

        $userRepository = static::$container->get(UserRepository::class);

        $testUser = $userRepository->findOneByEmail('john.doe@example.com');
        $client->loginUser($testUser);

        $crawler = $client->request('GET', '/blog/all_user_blog');

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertGreaterThan(0, $crawler->filter('.testpost')->count());
    }
}
