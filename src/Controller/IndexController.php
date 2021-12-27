<?php

namespace App\Controller;

use App\Form\AddToCartType;
use App\Manager\CartManager;
use App\Repository\PizzaRepository;
use http\Exception\RuntimeException;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Vich\UploaderBundle\Templating\Helper\UploaderHelper;

class IndexController extends AbstractController
{
    #[Route('/', name: 'index')]
    public function index(PizzaRepository $pizzaRepository, UploaderHelper $helper): Response
    {
        $pizzas = $pizzaRepository->findAll();

        return $this->render('index/index.html.twig', [
            'pizzas' => $pizzas
        ]);
    }

    #[Route('detail/{id}', name: 'index_detail')]
    public function show(int $id, PizzaRepository $pizzaRepository, Request $request, CartManager $cartManager): Response
    {
        $pizza = $pizzaRepository->find($id);

        if ($pizza === null) {
            throw new RuntimeException("Pizza with id: {$id} was not found");
        }

        $ingredients = $pizza->getIngredients()->toArray();

        $form = $this->createForm(AddToCartType::class);

        if ($form->isSubmitted() && $form->isValid()) {
            $item = $form->getData();
            $item->setProduct($pizza);

            $cart = $cartManager->getCurrentCart();
            $cart
                ->addItem($item)
                ->setUpdatedAt(new \DateTime());

            $cartManager->save($cart);

            return $this->redirectToRoute('index_detail', ['id' => $pizza->getId()]);
        }


        return $this->render('index/detail.html.twig', [
            'pizza' => $pizza,
            'ingredients' => $ingredients,
            'form' => $form->createView()
        ]);
    }
}
