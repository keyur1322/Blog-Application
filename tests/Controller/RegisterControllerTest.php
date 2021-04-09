<?php

namespace App\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

/**
 * Class RegisterControllerTest.
 */
class RegisterControllerTest extends WebTestCase
{
    /** index method.
     *
     */
    public function testRegister(): void
    {
        $client = static::createClient();
        $crawler = $client->request('POST', '/registration');

        $buttonCrawlerNode = $crawler->selectButton('register');
        $form = $buttonCrawlerNode->form([
            'user[email]' => 'panchalkeyur2@gmail.com',
            'user[name]' => 'keyur panchal2',
        ]);

        $form['user[password][first]'] = 'keyur2';
        $form['user[password][second]'] = 'keyur2';

        $client->submit($form);

        $client->request('GET', '/login');

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertSelectorTextContains('#testdiv', 'Please sign in');
    }
}
