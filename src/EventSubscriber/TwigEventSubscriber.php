<?php

namespace App\EventSubscriber;

use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpKernel\Event\ControllerEvent;
use Twig\Environment;

class TwigEventSubscriber implements EventSubscriberInterface
{
    private Environment $twig;

    /**
     * @param Environment $twig
     */
    public function __construct(Environment $twig)
    {
        $this->twig = $twig;
    }


    public function onKernelController(ControllerEvent $event): void
    {
        $this->twig->addGlobal('header', [
            [
                'name' => 'Админ панель',
                'href' => 'admin'
            ],
            [
                'name' => 'Главная страница',
                'href' => 'index'
            ]
        ]);
    }


    public static function getSubscribedEvents(): array
    {
        return [
            'kernel.controller' => 'onKernelController',
        ];
    }
}
