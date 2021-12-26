<?php

namespace App\Controller;

use App\Repository\PizzaRepository;
use http\Exception\RuntimeException;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
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
    public function show(int $id, PizzaRepository $pizzaRepository): Response
    {
        $pizza = $pizzaRepository->find($id);

        if ($pizza === null) {
            throw new RuntimeException("Pizza with id: {$id} was not found");
        }

        $ingredients = $pizza->getIngredients()->toArray();

        return $this->render('index/detail.html.twig', [
            'pizza' => $pizza,
            'ingredients' => $ingredients
        ]);
    }
}
