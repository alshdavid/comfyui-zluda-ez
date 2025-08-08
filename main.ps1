$env:PATH = ";$PSScriptRoot\python;" + $env:PATH
$env:PATH = ";$PSScriptRoot\python\Scripts;" + $env:PATH
$env:PATH = ";$PSScriptRoot\zluda;" + $env:PATH

# Optional: Ignore onboard GPU
$env:HIP_VISIBLE_DEVICES=1

zluda -- python.exe .\main.py --disable-auto-launch --use-quad-cross-attention --reserve-vram 0.9 
