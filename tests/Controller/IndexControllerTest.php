<?php

namespace App\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class IndexControllerTest extends WebTestCase
{
    public function testPizzasNotFound()
    {
        $client = static::createClient();

        $client->request('GET', '/0');
        $this->assertResponseStatusCodeSame(404);
    }

    public function testAdminPageRedirectForUnauthorized()
    {
        $client = static::createClient();

        $client->request('GET', '/admin');
        $this->assertResponseStatusCodeSame(302);
    }
}
