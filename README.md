# docker-rdp-calibre

Calibre GUI & server docker for unRaid

RDP-Calibre is a combo docker for calibre web server and gui (through webRDP)

Configuration:

/config - This is where the rdp configuration and library files will reside

Don't forget to enter in the host port and app folder.

8081 is the port for the calibre server web gui

8080 is the WebUI (webRDP) for the Calibre desktop GUI port

To access the calibre full GUI, open the WebUI in unRaid. Both the server and the GUI use the same database in the /config folder.
