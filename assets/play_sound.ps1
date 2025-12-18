Add-Type -AssemblyName presentationcore

$MediaPlayer = New-Object System.Windows.Media.MediaPlayer
$SoundPath = "$PSScriptRoot\victory.wav"
$MediaPlayer.Open((New-Object System.Uri($SoundPath)))
$MediaPlayer.Volume = 1.0
$MediaPlayer.Play()

$Timer = [System.Diagnostics.Stopwatch]::StartNew()
while ($Timer.Elapsed.TotalSeconds -lt 3) {
    Start-Sleep -Milliseconds 100
}

$Steps = 20
$FadeDuration = 2000
$SleepTime = $FadeDuration / $Steps

for ($i = $Steps; $i -ge 0; $i--) {
    $MediaPlayer.Volume = $i / $Steps
    Start-Sleep -Milliseconds $SleepTime
}

$MediaPlayer.Stop()
$MediaPlayer.Close()