$ComfyuiRoot = Split-Path -Path $PSScriptRoot -Parent
$PythonRoot = "$PSScriptRoot\python"
$ZludaRoot = "$PSScriptRoot\zluda"

$env:PATH = ";$PythonRoot;" + $env:PATH
$env:PATH = ";$PythonRoot\Scripts;" + $env:PATH
$env:PATH = ";$ZludaRoot;" + $env:PATH

Set-Location -Path $ComfyuiRoot

python -m pip install --upgrade pip
python -m pip install -r .\requirements.txt

python -m pip uninstall torch torchvision torchaudio -y
python -m pip install torch==2.3.0 torchvision==0.18.0 torchaudio==2.3.0 --index-url https://download.pytorch.org/whl/cu118
python -m pip install onnxruntime
python -m pip uninstall numpy -y
python -m pip install numpy==1.26.4

Copy-Item -Path $PSScriptRoot\zluda\cublas.dll -Destination $PSScriptRoot\python\Lib\site-packages\torch\lib\cublas64_11.dll -Force
Copy-Item -Path $PSScriptRoot\zluda\cusparse.dll -Destination $PSScriptRoot\python\Lib\site-packages\torch\lib\cusparse64_11.dll -Force
Copy-Item -Path $PSScriptRoot\python\Lib\site-packages\torch\lib\nvrtc64_112_0.dll -Destination $PSScriptRoot\python\Lib\site-packages\torch\lib\nvrtc_cuda.dll -Force
Copy-Item -Path $PSScriptRoot\zluda\nvrtc.dll -Destination $PSScriptRoot\python\Lib\site-packages\torch\lib\nvrtc64_112_0.dll -Force
