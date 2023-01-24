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
