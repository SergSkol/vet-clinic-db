/* Populate database with sample data. */

-- PROJECT 1

INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', 'Feb 03, 2020', 0, TRUE, 10.23);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', 'Nov 15, 2018', 2, TRUE, 8.00);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', 'Jan 07, 2021', 1, FALSE, 15.04);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', 'May 12, 2017', 5, TRUE, 11.00);

--PROJECT 2

INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', 'Feb 08, 2020', 0, FALSE, 11.00);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', 'Nov 15, 2021', 2, TRUE, 5.70);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', 'Apr 02, 1993', 3, FALSE, 12.13);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', 'Jun 12, 2005', 1, TRUE, 45.00);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', 'Jun 07, 2005', 7, TRUE, 20.40);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', 'Oct 13, 1998', 3, TRUE, 17.00);
INSERT INTO public.animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', 'May 14, 2022', 4, TRUE, 22.00);

--PROJECT 3

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

--PROJECT 4

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, 'Apr 23, 2000');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, 'Jan 17, 2019');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, 'May 04, 1981');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, 'Jun 08, 2008');

INSERT INTO specializations (species_id, vets_id) VALUES (1, 1);
INSERT INTO specializations (species_id, vets_id) VALUES (1, 3);
INSERT INTO specializations (species_id, vets_id) VALUES (2, 3);
INSERT INTO specializations (species_id, vets_id) VALUES (2, 4);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (3, 1, 'May 24, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (3, 3, 'Jul 22, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (4, 4, 'Feb 02, 2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (5, 2, 'Jan 05, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (5, 2, 'Mar 08, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (5, 2, 'May 14, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (6, 3, 'May 04, 2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (7, 4, 'Feb 24, 2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (8, 2, 'Dec 21, 2019');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (8, 1, 'Aug 10, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (8, 2, 'Apr 07, 2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 3, 'Sep 29, 2019');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (10, 4, 'Oct 03, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (10, 4, 'Nov 04, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (11, 2, 'Jan 24, 2019');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (11, 2, 'May 15, 2019');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (11, 2, 'Feb 27, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (11, 2, 'Aug 03, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (12, 3, 'May 24, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (12, 1, 'Jan 11, 2021');

-- PROJECT 5 PERFORMANCE AUDIT

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
