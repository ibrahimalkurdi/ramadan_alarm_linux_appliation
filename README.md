# Ramadan Alarm Ubuntu desktop script:

This is a small script to give an alarm for fasting/breakfast time.

It worked on Ubuntu 18.04 as a cronjob.

To run it for dawn time in crontab, add the line below with your desired time:
```
XX XX * * * <%directory%>/ramadan_alarmer.sh dawn
```

And this for the sunset time:
```
XX XX * * * <%directory%>/ramadan_alarmer.sh sunset
```

After running the script, the script fetch the current time on the local machine and compare it with the one which maches the same current date. And once it matches, it execute the command which will adjust the speakers volume and run ATHAN audio file. 

Note:
The Fasting/Breakfast times are picked for Berlin/Germany timezone.
This is the reference of the times' files:
http://izdb-berlin.de/gebetszeiten/
