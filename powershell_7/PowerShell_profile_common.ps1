
function serve {
    Write-Output "Running Node.js module 'serve'.  Use -l to specify port."
    npx serve
}


function Run-WindowsSpotlightImages {
    $destDir = Join-Path ${Env:CLOUDHOME} "data\wallpaper\Windows_Spotlight"
    windowsSpotlightImages.cmd $destDir
}


# Allow PlantUML to create *really* large images.
$env:PLANTUML_LIMIT_SIZE = 8192
