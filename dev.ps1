# SCP/dev.ps1

Write-Host "⚙️ 正在初始化 4060 GPU 环境并加载智慧校园后端..." -ForegroundColor Cyan

# 1. 临时设置 Python 全局搜索路径，防止 ModuleNotFoundError
$env:PYTHONPATH = "backed_python"

# 2. 直接用根目录的虚拟环境拉起服务
& .venv\Scripts\uvicorn app.main:app --reload --app-dir backed_python


