#What are all the types of pokemon that a pokemon can have?

select name from types;

#What is the name of the pokemon with id 45?

select name from pokemons where id = 45;

#How many pokemon are there?

select COUNT(*) from pokemons;

# How many types are there?

select COUNT(*) from types;

# How many pokemon have a secondary type?

select COUNT(*)from pokemons where secondary_type is NOT NULL;

#JOINS and Groups
# What is each pokemon's primary type?

Select p.name pokemon_name,t.name  primary_type from pokemons p JOIN TYPES t where t.id = p.primary_type;

#What is Rufflet's secondary type?

select p.name, t.name seondry_type from pokemons p JOIN types t  where t.id = p.secondary_type and p.name = 'Rufflet';

# What are the names of the pokemon that belong to the trainer with trainerID 303?

select p.name from pokemons p JOIN pokemon_trainer pt where p.id = pt.pokemon_id and pt.trainerID=303;

# How many pokemon have a secondary type Poison

select COUNT(*) from pokemons p JOIN types t where p.secondary_type = t.id and t.name ='Poison';

#What are all the primary types and how many pokemon have that type?

select t.name,  COUNT(*)as primary_type_number from pokemons p JOIN types t where p.primary_type = t.id group by p.primary_type;

#How many pokemon at level 100 does each trainer with at least one level 100 pokemone have? (Hint: your query should not display a trainer

  select COUNT(*) as pokemons from pokemons p LEFT JOIN pokemon_trainer pt on p.id = pt.pokemon_id group by pt.pokelevel having  pokelevel =100;

#How many pokemon only belong to one trainer and no other?

select COUNT(*) as pokemon_as_one_trainer  from (select pokemon_id from pokemon_trainer pt group by pt.pokemon_id having COUNT(*) = 1) as t;


/*Part 4: Final Report
Directions: Write a query that returns the following collumns:

Pokemon Name	Trainer Name	Level	Primary Type	Secondary Type
Pokemon's name	Trainer's name	Current Level	Primary Type Name	Secondary Type Name
USING pokemon level as strongest criteria for Trainer as my sorting order

*/


select distinct * from (
  select p.name  as Pokemon_Name, t.trainername as Trainer_Name, pt.pokelevel as Level,
         p.primary_type as Primary_Type, p.secondary_type as Secondary_Type

from pokemons p
  JOIN pokemon_trainer pt  on p.id = pt.pokemon_id
  JOIN trainers t on pt.trainerID = t.trainerID) as t
order by t.Level desc;




