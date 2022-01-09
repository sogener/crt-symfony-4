<?php

namespace App\Dto;


class UsersOutput
{
    private int $id;
    private string $username;
    private array $roles;
    private string $password;

    /**
     * @return string
     */
    public function getUsername(): string
    {
        return $this->username;
    }

    /**
     * @param string $username
     * @return UsersOutput
     */
    public function setUsername(string $username): UsersOutput
    {
        $this->username = $username;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getRoles()
    {
        return $this->roles;
    }

    /**
     * @param mixed $roles
     * @return UsersOutput
     */
    public function setRoles($roles)
    {
        $this->roles = $roles;
        return $this;
    }

    /**
     * @return string
     */
    public function getPassword(): string
    {
        return $this->password;
    }

    /**
     * @param string $password
     * @return UsersOutput
     */
    public function setPassword(string $password): UsersOutput
    {
        $this->password = $password;
        return $this;
    }

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @param int $id
     * @return UsersOutput
     */
    public function setId(int $id): UsersOutput
    {
        $this->id = $id;
        return $this;
    }

}