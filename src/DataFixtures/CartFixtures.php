<?php

namespace App\DataFixtures;

use App\Entity\Order;
use App\Entity\OrderItem;
use App\Entity\Pizza;
use App\Entity\Users;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class CartFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $admin = new Users();
        $admin->setRoles(['ROLE_ADMIN']);
        $admin->setUsername('admin');
        $admin->setPassword('$argon2id$v=19$m=65536,t=4,p=1$lxjYragycNczI2b49CrdkQ$q/dYkLHXJFDO1amMyEKkhfMv/6dWY9EqEax2+iFWFIA');
        $manager->persist($admin);

        $admin = new Users();
        $admin->setRoles(['ROLE_USER']);
        $admin->setUsername('user');
        $admin->setPassword('$argon2id$v=19$m=65536,t=4,p=1$ZvwOQOE/bzw1+iDQ4Z9faA$ZUfSXLOAN2ODxpTybqg3bFJ9gOeUiZGf/hjNFNUuwC4');
        $manager->persist($admin);

        $order = new Order();
        $orderItem = new OrderItem();
        $pizza = new Pizza();

        $pizza->setDescription('pizza4');
        $pizza->setTitle('pizza4');
        $pizza->setImageName('pizza4.jpg');
        $pizza->setPrice(400);

        $item = $orderItem->setProduct($pizza);
        $item->setQuantity(4);
        $order->addItem($item);

        $objDateTime = new \DateTime('NOW');
        $order->setCreatedAt($objDateTime);
        $order->setUpdatedAt($objDateTime);

        $manager->persist($pizza);
        $manager->persist($order);
        $manager->flush();


        $order = new Order();
        $orderItem = new OrderItem();
        $pizza = new Pizza();

        $pizza->setDescription('pizza2');
        $pizza->setTitle('pizza2');
        $pizza->setImageName('pizza2.jpg');
        $pizza->setPrice(200);

        $item = $orderItem->setProduct($pizza);
        $item->setQuantity(2);

        $order->addItem($item);
        $objDateTime = new \DateTime('NOW');
        $order->setCreatedAt($objDateTime);
        $order->setUpdatedAt($objDateTime);

        $manager->persist($pizza);
        $manager->persist($order);
        $manager->flush();

        $order = new Order();
        $orderItem = new OrderItem();
        $pizza = new Pizza();

        $pizza->setDescription('pizza5');
        $pizza->setTitle('pizza5');
        $pizza->setImageName('pizza5.jpg');
        $pizza->setPrice(500);

        $item = $orderItem->setProduct($pizza);
        $item->setQuantity(5);

        $order->addItem($item);
        $objDateTime = new \DateTime('NOW');
        $order->setCreatedAt($objDateTime);
        $order->setUpdatedAt($objDateTime);

        $manager->persist($pizza);
        $manager->persist($order);
        $manager->flush();

        $order = new Order();
        $orderItem = new OrderItem();
        $pizza = new Pizza();

        $pizza->setDescription('Гавайская');
        $pizza->setTitle('Гавайская');
        $pizza->setImageName('resize.png');
        $pizza->setPrice(1600);

        $item = $orderItem->setProduct($pizza);
        $item->setQuantity(61);

        $order->addItem($item);
        $objDateTime = new \DateTime('NOW');
        $order->setCreatedAt($objDateTime);
        $order->setUpdatedAt($objDateTime);

        $manager->persist($pizza);
        $manager->persist($order);
        $manager->flush();
    }
}
