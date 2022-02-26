#!/srv/pydj/bin/python
import pymysql.cursors
import telnetlib
import time
import schedule

telnethost = ''

connection = pymysql.connect(host='', user='', password='', db='gbsfm', charset='utf8', cursorclass=pymysql.cursors.DictCursor, autocommit=True)

def addjingle():
    query = connection.cursor()
    query.execute ("SELECT \
                    	concat( \
                    		p_dir.path, \
                    		'/', \
                    		mid( p_son.sha_hash, 1, p_dir.hash_letters ), \
                    		'/', \
                    		p_son.sha_hash, \
                    		'.', \
                    		p_son.format  \
                    	) AS filepath \
                    FROM \
                    	playlist_song AS p_son \
                    	INNER JOIN \
                    	playlist_artist AS p_art \
                    	ON  \
                    		p_son.artist_id = p_art.id \
                    	INNER JOIN \
                    	playlist_songdir AS p_dir \
                    	ON  \
                    		p_son.location_id = p_dir.id \
                    WHERE \
                    	p_art.name = 'Jingles' AND \
                    	p_son.length < 63 \
                    ORDER BY \
                    	RAND() ASC \
                    LIMIT 1")
    queryresult = query.fetchone()
    print(queryresult['filepath'])
    addstring = 'jingles.push ' + queryresult['filepath']

    tn = telnetlib.Telnet(telnethost, 1234)
    tn.write(addstring.encode('ascii') + b'\n')
    tn.write(b'quit\n')
    telnetresult = tn.read_all().decode('ascii')

schedule.every().hour.at(':55').do(addjingle)

while True:
    schedule.run_pending()
    time.sleep(1)
