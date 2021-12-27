<?php

namespace App\MessageHandler;

use App\Message\CartMessage;
use App\Repository\OrderRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Messenger\Handler\MessageHandlerInterface;

final class CartMessageHandler implements MessageHandlerInterface
{
    private EntityManagerInterface $em;
    private OrderRepository $OrderRepository;

    /**
     * @param EntityManagerInterface $em
     * @param OrderRepository $OrderRepository
     */
    public function __construct(EntityManagerInterface $em, OrderRepository $OrderRepository)
    {
        $this->em = $em;
        $this->OrderRepository = $OrderRepository;
    }


    public function __invoke(CartMessage $message)
    {
        $cart = $this->OrderRepository->find($message->getId());
        if (!$cart) {
            return;
        }

        $cart->setStatus('processed');

        $this->em->flush();
    }
}
