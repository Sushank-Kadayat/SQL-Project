use project_movie_database ;
-- a) can you get all data about movies 
select * from movies;

-- b) how do you get all data about directors
select * from directors;

-- c) check how many movies are present in IMDB
select count(original_title) as total_movie from movies;

-- d) find these 3 directors: James cameron,Luc Bessson,John Woo
select name from directors where name in ("James Cameron", "Luc Besson","John Woo");

-- e) Find all directors with name starting with steven
select name from directors where name like 'Steven%';

-- f) count female directors
select count(gender) as female_directors from directors where gender="1";

--  g) Find the name of the 10th first women directors
select name from directors where gender="1" order by id asc limit 1 offset 10;

-- h) What are the 3 most popular movie 
select original_title as movie, popularity  from movies order by popularity desc limit 3 ;

-- i) What are the 3 most bankable movies
select original_title as movie, revenue as bankable from movies order by revenue desc limit 3;

-- j) What is the most awarded average vote since the january 1st,2000
select original_title as awarded from movies where release_date >"2000-01-01" order by vote_average desc limit 1;

-- k) which movie(s) were directed by Brenda Champman
 select original_title as movie from movies where director_id=( select id from directors where name= "Brenda Chapman");
 
-- l) Whose director made the most movies
select d.name,count(original_title) as movie from directors as d join movies as m on d.id=m.director_id group by director_id order by count(name) desc limit 1 ;

-- m) Whose directors is most bankable
select name,sum(revenue) as total_bankable from movies as m join directors as d on m.director_id=d.id group by director_id order by total_bankable desc limit 1 ;

 
