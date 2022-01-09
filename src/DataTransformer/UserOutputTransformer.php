<?php

namespace App\DataTransformer;

use ApiPlatform\Core\DataTransformer\DataTransformerInterface;
use App\Dto\UsersOutput;
use App\Entity\Users;

class UserOutputTransformer implements DataTransformerInterface
{
    /**
     * @param Users|object $object
     * @param string $to
     * @param array $context
     * @return UsersOutput
     */
    public function transform($object, string $to, array $context = []): UsersOutput
    {
        $output = new UsersOutput();

        $output->setId($object->getId());
        $output->setUsername($object->getUserIdentifier());
        $output->setPassword($object->getPassword());
        $output->setRoles($object->getRoles());

        return $output;
    }

    public function supportsTransformation($data, string $to, array $context = []): bool
    {
        return $to === UsersOutput::class && $data instanceof Users;
    }
}