<?php

namespace App\Factory;

use App\Entity\Order;
use App\Entity\OrderItem;
use App\Entity\Pizza;

class OrderFactory
{
    public function create() : Order
    {
        $order = new Order();
        $order
            ->setStatus(Order::STATUS_CART)
            ->setCreatedAt(new \DateTime())
            ->setUpdatedAt(new \DateTime());

        return $order;
    }

    public function createItem(Pizza $pizza): OrderItem
    {
        $item = new OrderItem();
        $item->setProduct($pizza);
        $item->setQuantity(1);

        return $item;
    }
}