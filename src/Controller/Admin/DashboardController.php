<?php

namespace App\Controller\Admin;

use App\Entity\Ingredients;
use App\Entity\Order;
use App\Entity\OrderItem;
use App\Entity\Pizza;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        return parent::index();
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('App');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToDashboard('Dashboard', 'fa fa-home');
        yield MenuItem::linkToCrud('Pizza time!', 'fas fa-list', Pizza::class);
        yield MenuItem::linkToCrud('Ingredients', 'fas fa-list', Ingredients::class);
        yield MenuItem::linkToCrud('orderItem', 'fas fa-list', OrderItem::class);
        yield MenuItem::linkToCrud('order', 'fas fa-list', Order::class);
    }
}
