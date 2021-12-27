<?php

namespace App\Manager;

use App\Entity\Order;
use App\Factory\OrderFactory;
use App\Storage\CartSessionStorage;
use Doctrine\ORM\EntityManagerInterface;

class CartManager
{
    /**
     * @var CartSessionStorage
     */
    private CartSessionStorage $cartSessionStorage;

    /**
     * @var OrderFactory
     */
    private OrderFactory $cartFactory;

    /**
     * @var EntityManagerInterface
     */
    private EntityManagerInterface $entityManager;

    /**
     * @param CartSessionStorage $cartSessionStorage
     * @param OrderFactory $cartFactory
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(CartSessionStorage $cartSessionStorage, OrderFactory $cartFactory, EntityManagerInterface $entityManager)
    {
        $this->cartSessionStorage = $cartSessionStorage;
        $this->cartFactory = $cartFactory;
        $this->entityManager = $entityManager;
    }


    public function getCurrentCart(): Order
    {
        $cart = $this->cartSessionStorage->getCart();

        if (!$cart) {
            $cart = $this->cartFactory->create();
        }

        return $cart;
    }

    public function save(Order $cart): void
    {
//        persist in database
        $this->entityManager->persist($cart);
        $this->entityManager->flush();
//        persist in session
        $this->cartSessionStorage->setCart($cart);

    }

}