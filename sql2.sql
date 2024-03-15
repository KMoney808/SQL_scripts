/* 
to check metadata of different movie info and film files  
*/

SELECT DISTINCT    [move_title]  --DISTINCT remove duplicates 
                , mt.[movie_id]  --need to specific which table and column
                , [metacritic rating]
                ,[domestic collections]
FROM movies_table AS mt
    INNER JOIN rating_list AS rl
        ON mt.movie_id = rl.movie_id  --join on primary key
WHERE [year] = 2012
    AND [metacritic rating]>60
    AND [domestic collections]>10