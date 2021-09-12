--1. What Grades? 1st thru 5th
select distinct Grade.Name from Grade

--2. What emotions?
select distinct [Name] from Emotion

--3. # of poems?
select count(*) PoemCount from Poem 

--4,5, & 6. names, grade, gender of top 76 authors
select top 76 *
from Author
order by [Name] asc

--7. total # of words
select sum(WordCount) TotalNumOfWords
from Poem

--8. fewest chars
select top 1 Title, min(CharCount) FewestChars
from Poem
group by Title, CharCount

--9. # of authors in 3rd grade?
select count(*)
from Author
where GradeId = 3

--10. # Authors in 1st, 2nd, or 3rd grade
select distinct Author.GradeId, count(*)
from Author
group by GradeId
order by GradeId asc
--****need to add where clause

--11. total # poems by 4th graders
select GradeId, count(*) TotalNumOfPoems
from Poem
join Author on Author.Id = Poem.Id
where Author.GradeId = 4
group by GradeId
