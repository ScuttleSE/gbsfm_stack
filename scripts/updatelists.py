#!/srv/pydj/bin/python
import pymysql.cursors

connection = pymysql.connect(host='', user='', password='', db='gbsfm', charset='utf8', cursorclass=pymysql.cursors.DictCursor, autocommit=True)

query = connection.cursor()
query.execute ("SELECT \
                	COUNT(playlist_oldplaylistentry.song_id) AS count, \
                	playlist_oldplaylistentry.song_id, \
                	playlist_song.title as song, \
                	playlist_artist.`name` as artist, \
                	playlist_album.`name` as album, \
                	playlist_artist.id as artist_id, \
                	playlist_album.id as album_id \
                FROM \
                	playlist_oldplaylistentry \
                	INNER JOIN \
                	playlist_song \
                	ON \
                		playlist_oldplaylistentry.song_id = playlist_song.id \
                	INNER JOIN \
                	playlist_artist \
                	ON \
                		playlist_song.artist_id = playlist_artist.id \
                	INNER JOIN \
                	playlist_album \
                	ON \
                		playlist_song.album_id = playlist_album.id \
                GROUP BY \
                	playlist_oldplaylistentry.song_id \
                ORDER BY \
                	count DESC \
                LIMIT 10")
queryresult = query.fetchall()
print(queryresult)
#for i in len(queryresult):
#    print(queryresult[i])