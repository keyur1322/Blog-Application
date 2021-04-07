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
    public function testRegister()
    {
        $client = static::createClient();
        $crawler = $client->request('POST', '/registration');

        $buttonCrawlerNode = $crawler->selectButton('register');
        $form = $buttonCrawlerNode->form([
            'user[email]' => 'panchalkeyur1@gmail.com',
            'user[name]' => 'keyur panchal1',
        ]);

        $form['user[password][first]'] = 'keyur1123';
        $form['user[password][second]'] = 'keyur1123';

        $client->submit($form);

        $client->request('GET', '/login');

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertSelectorTextContains('#testdiv', 'Please sign in');
    }
}
