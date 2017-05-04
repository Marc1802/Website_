#!/bin/bash

# wechsel in skriptverzeichnis
cd "$( dirname "$( readlink -f "$0" )")"

# teste ob ziel url gesetzt ist
if [ -z "$1" ]; then
    echo "Kein username@servername angegeben."
    exit 1
fi

# alte zip datei löschen
rm -f app.zip
# in app verzeichnis wechseln
cd app/
# inhalte im app verzeichnis zippen
zip -r ../app.zip * .htaccess
# zurück nach hauptverzeichnis
cd ..
# auf webspace den inhalt von html/ löschen
ssh ${1} "rm -rf ~/html/* ~/html/.htaccess"
# zip datei auf webspace hochladen
scp app.zip ${1}:~/html
# zip datei auf webspace entpacken
ssh ${1} "cd html && unzip app.zip"
