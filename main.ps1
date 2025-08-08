$env:PATH = ";$PSScriptRoot\python;" + $env:PATH
$env:PATH = ";$PSScriptRoot\python\Scripts;" + $env:PATH
$env:PATH = ";$PSScriptRoot\zluda;" + $env:PATH

zluda -- python.exe .\main.py @args
