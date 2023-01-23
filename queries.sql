/*Queries that provide answers to the questions from all projects.*/

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
select name from animals where name not like 'Gabumon'

--Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
select name from animals where weight_kg >= 10.4 and weight_kg <= 17.3
