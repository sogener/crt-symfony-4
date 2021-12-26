<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Добавление отношения many-to-many между Pizza и Ingredients
 */
final class Version20211226102125 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE pizza_ingredients (pizza_id INT NOT NULL, ingredients_id INT NOT NULL, PRIMARY KEY(pizza_id, ingredients_id))');
        $this->addSql('CREATE INDEX IDX_AD0714F6D41D1D42 ON pizza_ingredients (pizza_id)');
        $this->addSql('CREATE INDEX IDX_AD0714F63EC4DCE ON pizza_ingredients (ingredients_id)');
        $this->addSql('ALTER TABLE pizza_ingredients ADD CONSTRAINT FK_AD0714F6D41D1D42 FOREIGN KEY (pizza_id) REFERENCES pizza (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE pizza_ingredients ADD CONSTRAINT FK_AD0714F63EC4DCE FOREIGN KEY (ingredients_id) REFERENCES ingredients (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('DROP TABLE pizza_ingredients');
    }
}
