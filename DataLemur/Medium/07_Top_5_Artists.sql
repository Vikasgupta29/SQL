SELECT artist_name, artist_rank
FROM(SELECT artist_name,
            DENSE_RANK() OVER(ORDER BY COUNT(s.song_id) DESC) "artist_rank"
      FROM artists a
      join songs s
      on a.artist_id=s.artist_id
      join global_song_rank r
      on s.song_id=r.song_id
      where rank<=10
      GROUP BY artist_name) T
WHERE artist_rank<=5
