/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from Animal22 WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Transactions
begin;
update animals
set species = 'unspecified';
select species from animals;
rollback;
select species from animals;

begin;
update animals
set species = 'digimon'
where name like '%mon';

begin;
update animals
set species = 'pokemon'
where name not like '%mon';

select * from animals;

begin;
delete from animals;
rollback;
select * from animals;

begin;
delete from animals where date_of_birth > '2022-01-01';
savepoint my_savepoint;
update animals
set weight_kg = weight_kg * -1;
rollback to my_savepoint;
update animals
set weight_kg = weight_kg * -1;
where weight_kg < 0;
commit;

-- AGGREGATE FUNCTIONS AND GROUP BY
-- How many animals are there?
select count(name)
from animals;

-- How many animals have never tried to escape?
SELECT COUNT(escape_attempts)
FROM animals
WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT
neutered, MAX(escape_attempts) AS most_escaped
FROM animals
GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT
MIN(weight_kg), MAX(weight_kg)
FROM animals;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT
AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01';