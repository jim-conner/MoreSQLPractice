--PoKi
--1. What Grades? 1st thru 5th
select distinct Grade.Name from Grade

--2. What emotions?
select distinct [Name] from Emotion

--3. # of poems?
select count(*) PoemCount from Poem 

--4. names of top 76 authors
select top 76 *
from Author
order by [Name] asc