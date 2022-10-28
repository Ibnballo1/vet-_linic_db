/* Populate database with sample data. */

INSERT INTO animals
VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23),
(2, 'Gabumon', '2018-11-15', 2, true, 8),
(3, 'Pikachu', '2021-01-07', 1, false, 15.04),
(4, 'Devimon', '2017-05-12', 5, true, 11),
(5, 'Charmander', '2020-02-08', 0, true, -11),
(6, 'Plantmon', '2021-11-15', 2, true, -5.7),
(7, 'Squirtle', '1993-04-02', 3, false, -12.13),
(8, 'Angemon', '2005-06-12', 1, true, -45),
(9, 'Boarmon', '2005-06-07', 7, true, -20.4),
(10, 'Blossom', '1998-10-13', 3, true, 17),
(11, 'Ditto', '2022-05-14', 4, true, 22);

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
commit;

begin;
update animals
set species = 'pokemon'
where name not like '%mon';
commit;

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

--- For more tables
INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species(name)
VALUES
('Pokemon'),
('dIGIMON');

UPDATE animals
SET species_id = '2'
WHERE name LIKE '%mon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name LIKE 'Sam Smith') 
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name LIKE 'Jennifer Orwell')
WHERE name IN ('Gabumon',  'Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name LIKE 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name LIKE 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name LIKE 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');
