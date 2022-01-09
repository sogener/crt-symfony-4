<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\PizzaRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\Serializer\Annotation\Groups;
use Vich\UploaderBundle\Mapping\Annotation as Vich;

/**
 * @ORM\Entity(repositoryClass=PizzaRepository::class)
 * @Vich\Uploadable()
 */
#[ApiResource(
    collectionOperations: ['get', 'post' => ["security" => "is_granted('ROLE_ADMIN')"]],
    itemOperations: ['get', 'delete' => ["security" => "is_granted('ROLE_ADMIN')"]],
    denormalizationContext: ['groups' => ['write']],
    normalizationContext: ['groups' => ['read']],
)]
class Pizza
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private ?int $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    #[Groups(["read", "write"])]
    private ?string $title;

    /**
     * @ORM\Column(type="string", length=255)
     */
    #[Groups(["read", "write"])]
    private ?string $description;

    /**
     * @ORM\ManyToMany(targetEntity=Ingredients::class, inversedBy="pizzas")
     */
    private $ingredients;

    /**
     * @ORM\Column(type="string", length=255)
     */
    #[Groups(["read", "write"])]
    private $imageName;

    /**
     * @Vich\UploadableField(mapping="pizza_images", fileNameProperty="imageName")
     * @var File|null
     */
    private ?File $imageFile = null;

    /**
     * @ORM\Column(type="float")
     */
    #[Groups(["read", "write"])]
    private ?float $price;

    public function __construct()
    {
        $this->ingredients = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    /**
     * @return File|null
     */
    public function getImageFile(): ?File
    {
        return $this->imageFile;
    }

    /**
     * @param File|null $imageFile
     * @return Pizza
     */
    public function setImageFile(?File $imageFile): Pizza
    {
        $this->imageFile = $imageFile;
        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    /**
     * @return Collection
     */
    public function getIngredients(): Collection
    {
        return $this->ingredients;
    }

    public function addIngredient(Ingredients $ingredient): self
    {
        if (!$this->ingredients->contains($ingredient)) {
            $this->ingredients[] = $ingredient;
        }

        return $this;
    }

    public function removeIngredient(Ingredients $ingredient): self
    {
        $this->ingredients->removeElement($ingredient);

        return $this;
    }

    /**
     * @return string|null
     */
    public function getImageName(): ?string
    {
        return $this->imageName;
    }

    /**
     * @param mixed $imageName
     * @return string|null
     */
    public function setImageName(?string $imageName): ?string
    {
        return $this->imageName = $imageName;
    }

    public function getPrice(): ?float
    {
        return $this->price;
    }

    public function setPrice(float $price): self
    {
        $this->price = $price;

        return $this;
    }

}
