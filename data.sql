/* Populate database with sample data. */
-- Project 1
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', 'Feb 03, 2020', 0, TRUE, 10.23);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', 'Nov 15, 2018', 2, TRUE, 8.00);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', 'Jan 07, 2021', 1, FALSE, 15.04);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', 'May 12, 2017', 5, TRUE, 11.00);

--Project 2
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', 'Feb 08, 2020', 0, FALSE, 11.00);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', 'Nov 15, 2021', 2, TRUE, 5.70);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', 'Apr 02, 1993', 3, FALSE, 12.13);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', 'Jun 12, 2005', 1, TRUE, 45.00);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', 'Jun 07, 2005', 7, TRUE, 20.40);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', 'Oct 13, 1998', 3, TRUE, 17.00);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', 'May 14, 2022', 4, TRUE, 22.00);

--Project 3
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

update animals set species_id=2 where name like '%mon';
update animals set species_id=1 where species_id IS NULL;

update animals set owner_id=1 where name = 'Agumon';
update animals set owner_id=2 where name = 'Gabumon';
update animals set owner_id=2 where name = 'Pikachu';
update animals set owner_id=3 where name = 'Devimon';
update animals set owner_id=3 where name = 'Plantmon';
update animals set owner_id=4 where name = 'Charmander';
update animals set owner_id=4 where name = 'Squirtle';
update animals set owner_id=4 where name = 'Blossom';
update animals set owner_id=5 where name = 'Angemon';
update animals set owner_id=5 where name = 'Boarmon';
