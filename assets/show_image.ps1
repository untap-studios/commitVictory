Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$ImagePath = "$PSScriptRoot\GitCommitted.png"
$Image = [System.Drawing.Image]::FromFile($ImagePath)

$Screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
$ScreenWidth = $Screen.Width
$ScreenHeight = $Screen.Height
$BarHeight = 150

$Form = New-Object Windows.Forms.Form
$Form.FormBorderStyle = 'None'
$Form.BackColor = 'Black'
$Form.TopMost = $true
$Form.Opacity = 0
$Form.ShowInTaskbar = $false 

$Form.Width = $ScreenWidth
$Form.Height = $BarHeight

$Form.StartPosition = "Manual"
$Form.Left = 0
$Form.Top = [Math]::Round(($ScreenHeight / 2) - ($BarHeight / 2))

$PictureBox = New-Object Windows.Forms.PictureBox
$PictureBox.Image = $Image
$PictureBox.SizeMode = 'CenterImage'
$PictureBox.Width = $Image.Width
$PictureBox.Height = $Image.Height

$VisualNudge = -25

$ChildX = [Math]::Round(($Form.Width / 2) - ($PictureBox.Width / 2))
$ChildY = [Math]::Round(($Form.Height / 2) - ($PictureBox.Height / 2)) + $VisualNudge

$PictureBox.Location = New-Object System.Drawing.Point($ChildX, $ChildY)
$Form.Controls.Add($PictureBox)

$Form.Show()

$Random = New-Object System.Random
$OriginalTop = $Form.Top
for ($i = 0; $i -le 0.85; $i += 0.05) {
    $Form.Opacity = $i
    $Form.Top = $OriginalTop + $Random.Next(-4, 4)
    Start-Sleep -Milliseconds 20
}
$Form.Top = $OriginalTop

Start-Sleep -Seconds 3

for ($i = 0.85; $i -ge 0; $i -= 0.05) {
    $Form.Opacity = $i
    Start-Sleep -Milliseconds 20
}
$Form.Close()