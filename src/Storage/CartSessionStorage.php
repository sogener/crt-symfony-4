<?php

namespace App\Storage;

use App\Entity\Order;
use App\Repository\OrderRepository;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class CartSessionStorage
{
    /**
     * Хранилище сессии
     * @var SessionInterface
     */
    private SessionInterface $session;

    /**
     *  Корзина товаров
     * @var OrderRepository
     */
    private OrderRepository $cartRepository;

    /**
     * @var string
     */
    const CART_KEY_NAME = 'cart_id';

    /**
     * @param $session
     * @param $cartRepository
     */
    public function __construct($session, $cartRepository)
    {
        $this->session = $session;
        $this->cartRepository = $cartRepository;
    }

    /**
     * Получает значение корзины из сессии
     *
     * @return Order|null
     */
    public function getCart(): ?Order
    {
        return $this->cartRepository->findOneBy([
            'id' => $this->getCartId(),
            'status' => Order::STATUS_CART
        ]);
    }

    /**
     *  Устанавливает значение корзины в сессии
     *
     * @param Order $cart
     * @return void
     */
    public function setCart(Order $cart): void
    {
        $this->session->set(self::CART_KEY_NAME, $cart->getId());
    }

    /**
     * Возвращает id корзины
     *
     * @return int|null
     */
    public function getCartId(): ?int
    {
        return $this->session->get(self::CART_KEY_NAME);
    }


}