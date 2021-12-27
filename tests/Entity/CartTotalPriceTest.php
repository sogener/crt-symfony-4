<?php

namespace App\Tests\Entity;


use App\Entity\Order;
use App\Entity\OrderItem;
use App\Entity\Pizza;
use App\Repository\OrderRepository;
use PHPUnit\Framework\TestCase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class CartTotalPriceTest extends TestCase
{
    /** @test */
    public function getTotal()
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

        $this->assertSame(100.0, $order->getTotal());

    }
}