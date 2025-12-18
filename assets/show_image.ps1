Add-Type -AssemblyName System.Windows.Forms

# 1. Load the image
$ImagePath = "$PSScriptRoot\GitCommitted.png"
$Image = [System.Drawing.Image]::FromFile($ImagePath)

# 2. Create a borderless form
$Form = New-Object Windows.Forms.Form
$Form.Text = "Victory"
$Form.FormBorderStyle = 'None' # No title bar or borders
$Form.BackColor = 'black'
$Form.TransparencyKey = 'black' # Optional: makes black parts of the image transparent
$Form.Size = $Image.Size
$Form.StartPosition = 'CenterScreen'
$Form.TopMost = $true # Stay on top of all windows

# 3. Add a picture box
$PictureBox = New-Object Windows.Forms.PictureBox
$PictureBox.Image = $Image
$PictureBox.Dock = 'Fill'
$Form.Controls.Add($PictureBox)

# 4. Show it for 3 seconds and close
$Form.Show()
Start-Sleep -Seconds 13
$Form.Close()