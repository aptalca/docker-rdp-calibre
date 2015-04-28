# docker-rdp-calibre

Calibre GUI & server docker for unRaid

RDP-Calibre is a combo docker for calibre web server and gui (through RDP)

Configuration:

/config - This is where the rdp configuration and library files will reside

Don't forget to enter in the host port and app folder.

8080 is the port for the calibre server web gui
3389 is the RDP port
To access the calibre GUI, connect to the unraid IP via RDP client (user: root | password: calibre)and click on the the desktop icon for calibre. Both the server and the GUI use the same database in the /config folder.
