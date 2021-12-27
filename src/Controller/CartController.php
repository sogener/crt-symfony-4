<?php

namespace App\Controller;

use App\Form\CartType;
use App\Manager\CartManager;
use App\Message\CartMessage;
use App\Repository\OrderRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Messenger\MessageBusInterface;
use Symfony\Component\Routing\Annotation\Route;

class CartController extends AbstractController
{
    #[Route('/cart', name: 'cart')]
    public function index(CartManager $cartManager, Request $request): Response
    {
        $cart = $cartManager->getCurrentCart();

        $form = $this->createForm(CartType::class, $cart);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $cart->setUpdatedAt(new \DateTime());
            $cartManager->save($cart);

            return $this->redirectToRoute('cart');
        }

        return $this->render('cart/index.html.twig', [
            'cart' => $cart,
            'form' => $form->createView()
        ]);
    }

    #[Route('/cart/checkout/', name: 'cart_checkout')]
    public function order(CartManager $cartManager, Request $request): Response
    {
        $cart = $cartManager->getCurrentCart();

        $form = $this->createForm(CartType::class, $cart);
        $form->handleRequest($request);

        return $this->render('cart/checkout.html.twig', [
            'cart' => $cart,
            'form' => $form->createView()
        ]);
    }

    #[Route('/cart/checkout/check/{id}', name: 'cart_checkout_check')]
    public function check(int $id, OrderRepository $orderRepository, MessageBusInterface $bus): Response
    {
        $cart = $orderRepository->find($id);

        $bus->dispatch(new CartMessage($cart->getId(), []));

        return $this->redirectToRoute('cart_checkout');
    }
}
