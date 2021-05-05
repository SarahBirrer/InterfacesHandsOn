#$containerName = "LogicoERP-Dev"
# Get ContainerName from launch.json => server setting
$server = (Get-Content -Raw -Path .vscode\launch.json | ConvertFrom-Json).configurations.server
$server -match "//(.*)"
$containerName = $Matches[1]
# Get AppName from app.json 
$appName = (Get-Content -Raw -Path app.json | ConvertFrom-Json).name

Write-Host "Perform CleanExtension for [$appName] on Container[$containerName]"
$session = Get-NavContainerSession $containerName
Invoke-Command -Session $session {
    param([string]$appName)
    $extension = Get-NAVAppInfo -ServerInstance NAV -Name $appName
    $extension
    Write-Host Uninstall $appName
    $extension | Uninstall-NAVApp 
    Write-Host Unpublish $appName
    $extension | Unpublish-NAVApp 
    
    # Clean App
    Write-Host Clean $appName
    Sync-NAVApp -ServerInstance NAV -Name $appName -Mode Clean -Force
} -ArgumentList $appName
Write-Host "finished"