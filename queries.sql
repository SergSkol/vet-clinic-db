/*Queries that provide answers to the questions from all projects.*/

-- PROJECT 1

--Find all animals whose name ends in "mon".
select name from animals where name like '%mon';

--List the name of all animals born between 2016 and 2019.
select name from animals where date_of_birth between '01-01-2016' and '31-12-2019';

--List the name of all animals that are neutered and have less than 3 escape attempts.
select name from animals where neutered and escape_attempts < 3;

--List the date of birth of all animals named either "Agumon" or "Pikachu".
select date_of_birth from animals where name = 'Agumon' or name = 'Pikachu'

--List name and escape attempts of animals that weigh more than 10.5kg
select name, escape_attempts from animals where weight_kg > 10.5

--Find all animals that are neutered.
select name from animals where neutered

--Find all animals not named Gabumon.
select name from animals where name != 'Gabumon'

--Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
select name from animals where weight_kg >= 10.4 and weight_kg <= 17.3

--PROJECT 2

update animals set species='unspecified';
update animals set species='digimon' where name like '%mon';
update animals set species='pokemon' where species IS NULL;
delete from animals where date_of_birth > '01-01-2022';
update animals set weight_kg = weight_kg * -1;
update animals set weight_kg = weight_kg * -1 where weight_kg < 0;

--Questions
--How many animals are there?
select count(*) from animals;

--How many animals have never tried to escape?
select count(*) from animals where escape_attempts = 0;

--What is the average weight of animals?
select AVG(weight_kg) from animals;

--Who escapes the most, neutered or not neutered animals?
select neutered, sum(escape_attempts) from animals group by neutered;

--What is the minimum and maximum weight of each type of animal?
select species, min(weight_kg), max(weight_kg) from animals group by species;

--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
select species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '01-01-1990' AND '31-12-2000' GROUP BY species;

--PROJECT 3

--What animals belong to Melody Pond?
SELECT animals.name FROM owners JOIN animals ON owners.id = animals.owner_id WHERE full_name = 'Melody Pond';

--List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM species JOIN animals ON species.id = animals.species_id WHERE species.name = 'Pokemon';

--List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

--How many animals are there per species?
SELECT species.name, count(*) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

--List all Digimon owned by Jennifer Orwell.
SELECT animals.name FROM animals LEFT JOIN owners ON animals.owner_id = owners.id LEFT JOIN species ON animals.species_id = species.id WHERE owners.full_name='Jennifer Orwell' AND species.name = 'Digimon';

--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name='Dean Winchester' AND animals.escape_attempts = 0;

--Who owns the most animals?
SELECT Owner, Cnt FROM (SELECT owners.full_name as Owner, count(*) AS Cnt FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY Owner ORDER BY Cnt DESC) AS Counter LIMIT 1;

--PROJECT 4

--Who was the last animal seen by William Tatcher?
select animals.name 
  from visits 
    join vets on visits.vets_id = vets.id 
    join animals on visits.animals_id = animals.id 
  where vets.name = 'William Tatcher' 
  order by date_of_visit DESC 
  limit 1;

--How many different animals did Stephanie Mendez see?
select count(animals.name)
  from visits 
    join vets on visits.vets_id = vets.id 
    join animals on visits.animals_id = animals.id 
  where vets.name = 'Stephanie Mendez';

--List all vets and their specialties, including vets with no specialties.
select vets.name, species.name
  from specializations 
    full join vets on specializations.vets_id = vets.id
    full join species on specializations.species_id = species.id;

--List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
select animals.name
  from visits 
    join vets on visits.vets_id = vets.id 
    join animals on visits.animals_id = animals.id 
  where vets.name = 'Stephanie Mendez' and
  	visits.date_of_visit between 'Apr 1, 2020' and 'Aug 30, 2020';

--What animal has the most visits to vets?
select animals.name as Pet, count(*) as Cnt
  from visits 
    join vets on visits.vets_id = vets.id 
    join animals on visits.animals_id = animals.id
group by Pet
order by Cnt desc
limit 1;

--Who was Maisy Smith's first visit?
select animals.name
  from visits
    join vets on visits.vets_id = vets.id 
    join animals on visits.animals_id = animals.id
  where vets.name = 'Maisy Smith'
  order by visits.date_of_visit asc
  limit 1;

--Details for most recent visit: animal information, vet information, and date of visit.
select *
  from visits
    join vets on visits.vets_id = vets.id 
    join animals on visits.animals_id = animals.id
  order by visits.date_of_visit desc
  limit 1;

--How many visits were with a vet that did not specialize in that animal's species?
select count(*)
  from visits
    join vets on visits.vets_id = vets.id 
    full join specializations on specializations.vets_id = vets.id
  where specializations.species_id is null;

--What specialty should Maisy Smith consider getting? Look for the species she gets the most.
select species.name as S, count(*) as Cnt
  from visits
    join vets on visits.vets_id = vets.id
	join animals on visits.animals_id = animals.id
	join species on animals.species_id = species.id
	full join specializations on specializations.vets_id = vets.id
  where vets.name = 'Maisy Smith'
  group by S
  order by Cnt desc
  limit 1;
  
-- PROJECT 5 PERFORMANCE AUDIT

explain analyze SELECT COUNT(*) FROM visits where animals_id = 4;
explain analyze SELECT * FROM visits where vets_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';
