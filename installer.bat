@echo off

SET NEWLINE=^& echo.

Rem Start of the codeblock that adds lines to the users hosts files.
FIND /C /I "cashew.ceisn" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^10.87.55.11 cashew.ceisn>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bluewater.ceisn" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^10.87.30.50 bluewater.ceisn>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "atlas.ceisn" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^192.168.86.237 atlas.ceisn>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "plesk.ceisn" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^10.87.100.3 plesk.ceisn>>%WINDIR%\System32\drivers\etc\hosts

Rem Downloads the VPN installer, gateway profile, and the readme
curl "https://swupdate.openvpn.org/community/releases/OpenVPN-2.5.7-I602-amd64.msi" --output OpenVPN-2.5.7-I602-amd64.msi
curl "https://CEISN.cloudexis.net/gateway.ovpn" --output gateway.ovpn
curl "https://CEISN.cloudexis.net/readme.txt" --output readme.txt

Rem Opens readme.txt & the vpn installer lol
SLEEP 3
start readme.txt
start OpenVPN-2.5.7-I602-amd64.msi
