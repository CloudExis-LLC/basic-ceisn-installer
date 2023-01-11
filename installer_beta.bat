@echo off
setlocal enabledelayedexpansion

rem Define the URL of the JSON file
set "jsonUrl=https://ceisn.cloudexis.net/installer/data/pairs.json"

rem Retrieve the JSON file
curl -s %jsonUrl% > hosts.json

rem Parse the JSON data
for /f "tokens=2 delims={}" %%a in ('type hosts.json ^| findstr /b "host"') do (
    set "jsonData=%%a"
    set "jsonData=!jsonData:,=!"
    set "jsonData=!jsonData:"host":"=!"
    set "jsonData=!jsonData:"ip":"=!"
    set "jsonData=!jsonData:"=!"

    rem Check if the entry already exists in the hosts file
    findstr /c:"!jsonData!" %windir%\System32\drivers\etc\hosts >nul
    if not errorlevel 1 (
        echo Entry already exists: !jsonData!
    ) else (
        rem Append the data to the hosts file
        echo !jsonData! >> %windir%\System32\drivers\etc\hosts
        echo Entry added: !jsonData!
    )
)

rem Cleanup
del hosts.json
