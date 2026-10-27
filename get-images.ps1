# Downloads the 27 portfolio images from hafizanni.vercel.app into an img folder next to this script.
# Run: powershell -ExecutionPolicy Bypass -File .\get-images.ps1
$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$dir = Join-Path $PSScriptRoot "img"
New-Item -ItemType Directory -Force -Path $dir | Out-Null
$images = @("me.jpg") + (0..9 | % { "makmal-{0:D2}.jpg" -f $_ }) +
  @("sofia-01-home.jpg","sofia-02-homestay.jpg","sofia-03-gallery.jpg","sofia-04-mybookings.jpg","sofia-05-host.jpg","sofia-06-mobile.jpg") +
  (1..10 | % { "yumme-{0:D2}.jpg" -f $_ })
foreach ($i in $images) { Write-Host "img/$i"; Invoke-WebRequest "https://hafizanni.vercel.app/img/$i" -OutFile (Join-Path $dir $i) -UseBasicParsing }
Write-Host "Done: $($images.Count) images saved to $dir" -ForegroundColor Green
