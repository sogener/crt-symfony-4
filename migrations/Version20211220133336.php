<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211220133336 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE pizza ADD ingredients_id INT NOT NULL');
        $this->addSql('ALTER TABLE pizza ADD CONSTRAINT FK_CFDD826F3EC4DCE FOREIGN KEY (ingredients_id) REFERENCES ingredients (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_CFDD826F3EC4DCE ON pizza (ingredients_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE pizza DROP CONSTRAINT FK_CFDD826F3EC4DCE');
        $this->addSql('DROP INDEX IDX_CFDD826F3EC4DCE');
        $this->addSql('ALTER TABLE pizza DROP ingredients_id');
    }
}
