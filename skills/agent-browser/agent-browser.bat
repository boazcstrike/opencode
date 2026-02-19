@echo off
REM Cross-platform agent-browser launcher

if "%OS%"=="Windows_NT" (
    if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
        .\bin\agent-browser-win32-x64.exe %*
    ) else (
        echo Unsupported Windows architecture
        exit /b 1
    )
) else (
    echo This script is for Windows. For other platforms, use the direct binary.
    exit /b 1
)