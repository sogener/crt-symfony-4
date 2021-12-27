<?php

namespace App\DataFixtures;

use App\Entity\Order;
use App\Entity\OrderItem;
use App\Entity\Pizza;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class CartFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $order = new Order();
        $orderItem = new OrderItem();
        $pizza = new Pizza();

        $pizza->setDescription('pizza1');
        $pizza->setTitle('pizza1');
        $pizza->setPrice(100);

        $item = $orderItem->setProduct($pizza);
        $item->setQuantity(1);

        $order->addItem($item);

        $manager->flush();
    }
}
