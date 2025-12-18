# assets/play_sound.ps1
$SoundPath = "$PSScriptRoot\victory.wav"

# Create a Sound Player object
$SoundPlayer = New-Object System.Media.SoundPlayer
$SoundPlayer.SoundLocation = $SoundPath

# PlaySync ensures the script stays open until the sound finishes
$SoundPlayer.PlaySync()