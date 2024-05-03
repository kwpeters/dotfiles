
function serve {
    Write-Output "Running Node.js module 'serve'.  Use -l to specify port."
    npx serve
}


function Run-WindowsSpotlightImages {
    $destDir = Join-Path ${Env:CLOUDHOME} "data\wallpaper\Windows_Spotlight"
    windowsSpotlightImages.cmd $destDir
}


################################################################################
# Common Environment Variables
################################################################################

# Allow PlantUML to create *really* large images.
$env:PLANTUML_LIMIT_SIZE = 8192

# Directory containing all development Git repositories.
$env:GIT_REPO_ROOT_DIR = "C:\Users\kwpeters\dev"
