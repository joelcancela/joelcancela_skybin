$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process -FilePath 'powershell' -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    exit
}

$scriptFolder = Split-Path -Parent $MyInvocation.MyCommand.Path
$parentFolder = Split-Path -Parent $scriptFolder
$binFolder = Join-Path $parentFolder '.bin'

$currentPath = [Environment]::GetEnvironmentVariable('Path', 'Machine')
$pathEntries = @()
if ($currentPath) { $pathEntries = $currentPath -split ';' | Where-Object { $_ -ne '' } }

$foldersToAdd = @($parentFolder, $binFolder) | Where-Object { $pathEntries -notcontains $_ }

if ($foldersToAdd.Count -eq 0) {
    Write-Host "'$parentFolder' and '$binFolder' are already in PATH."
} else {
    $newPath = if ($currentPath) { ($pathEntries + $foldersToAdd) -join ';' } else { $foldersToAdd -join ';' }
    [Environment]::SetEnvironmentVariable('Path', $newPath, 'Machine')
    Write-Host "Added $($foldersToAdd -join ', ') to PATH. Restart your terminal for changes to take effect."
}
