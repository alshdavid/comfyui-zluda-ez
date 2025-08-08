$env:PATH = ";$PSScriptRoot\python;" + $env:PATH
$env:PATH = ";$PSScriptRoot\python\Scripts;" + $env:PATH
$env:PATH = ";$PSScriptRoot\zluda;" + $env:PATH

# Optional: Uncomment this if you have an onboard GPU
# $env:HIP_VISIBLE_DEVICES=1

zluda -- python.exe .\main.py @args
