# docker-rdp-calibre

Calibre GUI & server docker for unRaid

RDP-Calibre is a combo docker for calibre web server and gui (through RDP) [br][br]
[b][u][span style='color: #E80000;']Configuration[/span][/u][/b][br]
[b]/config[/b] This is where the rdp configuration and library files will reside[br][br]
Don't forget to enter in the host port and app folder. [br][br]
[span style='color: #E80000;']8080[/span] is the port for the calibre server web gui[br]
[span style='color: #E80000;']3389[/span] is the RDP port[br]
To access the calibre GUI, connect to the unraid IP via RDP client ([span style='color: #E80000;']user: root | password: calibre[/span])and click on the the desktop icon for calibre. Both the server and the GUI use the same database in the /config folder.
