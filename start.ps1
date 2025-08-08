# Optional: Ignore onboard GPU
$env:HIP_VISIBLE_DEVICES=1

. "$PSScriptRoot\main.ps1" --use-quad-cross-attention --reserve-vram 0.9 @args
