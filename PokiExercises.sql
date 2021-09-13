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

--12. # of poems per grade
select GradeId, count(poem.Id) PoemCount
from Poem
join Author on Author.Id = Poem.Id
group by GradeId

--13. # authors per grade
select GradeId, count(*) NumOfAuthors
from Author A
join Grade on A.GradeId = GradeId
group by GradeId
order by GradeId asc

--14. Poem title w/ most words
select top 1 Title, count(WordCount) [Count]
from Poem
group by Title
order by [Count] desc

--.15 author(s) with the most poems?
select top 5 Name, count (*) [Count]
from Poem P
	left join Author A on P.AuthorId = A.Id
group by Name
order by [Count] desc

--16. poems w emotion of sadness
select E.Name, count(*) NumOfPoems
from Poem P
	join PoemEmotion PE on P.Id = PE.PoemId
	join Emotion E on PE.EmotionId = E.Id
where E.Id = 3
group by E.Name

--17. # of poems w/o assc'd emotion?
select count(*) NumWithoutEmotion
from Poem P
	left join PoemEmotion PE on P.Id = PE.PoemId
	where PE.EmotionId is null

--18. emotion w/ least # of Poems?
select max(PoemCount), min(PoemCount) [Count]
from (select E.Name, count(*) as PoemCount
		from Poem P
			join PoemEmotion PE on P.Id = PE.PoemId
			join Emotion E on PE.EmotionId = E.Id
		group by E.Name
		) P

--19. Which grade has the largest number of poems with an emotion of joy?

select *
from Grade G
	join Author A on  G.Id = A.GradeId
	join Poem P on A.Id = P.AuthorId




