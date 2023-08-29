# Useful commands

        * $() For variable values
        * !() For optional values


* ## mdstart:
       mdstart $(filename)
> Reads md files, and proccess the markdown languaje, finally renders the file in a web browser

* ## mopidy:
        mopidy !(> /dev/null 2>&1 &)
> Opens mopidy, wich is a proccess that connects to the Spotify api and fetchs information from there, when it's working can be managed from *ncmpcpp*
>
> The optional command makes the proccess run in the background, without showing any logs

* ## pg\_dump:
    pg_dump -Fc -h $(host_direction) -p $(host_port) -U $(db_user) $(db_name) -f $(output_filename.dump)
> Creates a database backup and saves it into the given .dump file
