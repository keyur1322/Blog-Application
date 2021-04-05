<?php

namespace App\Tests\Controller;

use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class BlogControllerTest extends WebTestCase
{
    public function testShowAll()
    {
        $client = static::createClient();

        $client->request('GET', '/blog/');
        $this->assertEquals(200, $client->getResponse()->getStatusCode());
    }

    public function testShowCategory()
    {
        $client = static::createClient();

        $client->request('GET', '/blog/blog_category/{variable}');
        $this->assertEquals(200, $client->getResponse()->getStatusCode());
    }

    public function testShowBlogDetails()
    {
        $client = static::createClient();

        $client->request('GET', '/blog/blog_details/{blogid}');
        $this->assertEquals(200, $client->getResponse()->getStatusCode());
    }

    public function provideUrls(): array
    {
        return [
          ['GET', '/blog/blog_filter_date'],
          ['POST', '/blog/blog_filter_date'],
        ];
    }

    /**
     * @dataProvider provideUrls
     *
     * @param $method
     * @param $url
     */
    public function testBlogFilterDate($method, $url)
    {
        $client = static::createClient();

        $client->request($method, $url);
        $this->assertTrue($client->getResponse()->isSuccessful());
    }

    public function testAllUserBlog()
    {
        $client = static::createClient();

        $client->request('GET', '/blog/all_user_blog');
        $this->assertEquals(200, $client->getResponse()->getStatusCode());
    }

    public function testAddBlog()
    {
        $client = static::createClient();

        $crawler = $client->request('POST', '/blog/new');

        $buttonCrawlerNode = $crawler->selectButton('blog');
        $userRepository = static::$container->get(UserRepository::class);

        // retrieve the test user
        $testUser = $userRepository->findOneByEmail('john.doe@example.com');

        // simulate $testUser being logged in
        $client->loginUser($testUser);


        // you can also pass an array of field values that overrides the default ones
        $form = $buttonCrawlerNode->form([
            'blog[title]' => 'Fabien',
            'blog[category]' => 'technology',
            'blog[ShortDescription]' => 'Symfony rocks!',
            'blog[LongDescription]' => 'Symfony rocks!',
            'blog[image]' => 'D:\Symfony\Blog-application\public\img\91c9c0ddd91bf6ed2f3c07da295a00e3.jpg',
        ]);

        //  $form['blog[image]']->upload('D:\Symfony\Blog-application\public\img\91c9c0ddd91bf6ed2f3c07da295a00e3.jpg');

        $client->submit($form);

        $crawler = $client->request('GET', '/blog/all_user_blog/');
//        $this->assertEquals(1, $crawler->filter('div.header > h2')->count());
        $this->assertCount(6, $crawler->filter('h2'));
    }
}
