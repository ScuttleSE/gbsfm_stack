#!/srv/pydj/bin/python
import pymysql.cursors  
import telnetlib
import time

host = '192.168.0.154' 
cuefile='/remaining/ices2.cue' 

connection = pymysql.connect(host='192.168.0.111', user='gbsfm', password='gbsfm', db='gbsfm', charset='utf8', cursorclass=pymysql.cursors.DictCursor, autocommit=True)

while True:
    query = connection.cursor()
    query.execute ("SELECT playlist_song.length \
			    FROM playlist_playlistentry \
			    INNER JOIN playlist_song \
			    ON playlist_playlistentry.song_id = playlist_song.id \
			    WHERE playlist_playlistentry.playing = 1")
    queryresult = query.fetchone()
    tn = telnetlib.Telnet(host, 1234)
    tn.write(b'96.remaining\n')
    tn.write(b'quit\n')
    telnetresult = tn.read_all().decode('ascii')

    try:
        with open(cuefile, 'w') as f:
    	    f.write('dummyline1\ndummyline2\ndummyline3\ndummyline4\n')
    	    f.write(str(100 - (float(telnetresult.split()[0]) / int(queryresult['length']) * 100)))
    	    f.write('\n0\ndummyline7\ndummyline8')
    except ValueError, TypeError:
    	print 'Oopsie'
    time.sleep(1)
