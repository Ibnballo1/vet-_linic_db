/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
  id INT,
  name varchar(100),
  date_of_birth date,
  escape_attempts INT,
  neutered BOOL,
  weight_kg DECIMAL
);

ALTER TABLE animals
ADD species varchar(100);

 CREATE TABLE OWNERS (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  full_name varchar(250),
  age int
);

create table species (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  name varchar(250)
);

ALTER TABLE animals
ADD primary key(id);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD species_id INT REFERENCES species(id);

ALTER TABLE animals
ADD owner_id INT REFERENCES owners(id);

CREATE TABLE vets (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  name varchar(250),
  age int,
  date_of_graduation date
);

CREATE TABLE specialization(
    vets_id INT REFERENCES vets(id),
    species_id INT REFERENCES species(id)
);

CREATE TABLE visits (
    animals_id INT REFERENCES animals(id),
    vets_id INT REFERENCES vets(id),
    date_of_visit DATE
);