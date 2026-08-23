# Repo: https://github.com/frgnca/AudioDeviceCmdlets
$deviceName="Haut-parleurs"
$micName="Mic in"

$devices = Get-AudioDevice -List
$index=1

while($index -le $devices.Count)
{
    $device = Get-AudioDevice -Index $index
    Write-Host $device.Name
    if($device.Name -like "*$deviceName*" -Or $device.Name -like "*$micName*"){
        Set-AudioDevice -Index $index
        Write-Host "OK"
    }
    $index++
}