# Install all the packages you want to use in other scripts

$chocoPackages = @(
	"peazip",
	"aria2",
	"chocolateygui",
	"conemu",
	"cpu-z.install",
	"dejavufonts",
	"dotnet4.6.1",
	"gimp",
	"git-fork",
	"git.install",
	"gitkraken",
	"gpu-z",
	"jq",
	"jre8",
	"kitty",
	"python3",
	"screentogif",
	"shutup10",
	"skyfonts",
	"sysinternals",
	"treesizefree",
	"vcredist-all",
	"vscode",
	"winmerge",
	"winscp",
	"yarn",
    "chocolateygui",
    "1password",
    "Firefox",
    "googlechrome",
    "chezmoi",
    "alacritty",
    "github-desktop",
    "nvidia-geforce-now",
    "tailscale",
    "synctrayzor",
    "signal",
    "obs-studio",
    "obs-virtualcam",
    "winaero-tweaker",
    "mpvnet.install",
    "keybase",
    "autohotkey",
    "vlc",
    "sysinternals",
    "hwinfo",
    "nuget.commandline",
    "NugetPackageExplorer",
    "rocolatey",
    "filezilla",
    "paint.net",
    "mousewithoutborders",
    "pingplotter",
    "eartrumpet",
    "windirstat",
    "spotify",
    "joplin",
    "puretext",
    "quickview",
    "powertoys",
    "sudo",
    "irfanview"
)

$scoopPackages = @(
    "dos2unix"
)

scoop.cmd bucket add extras


# ----- LOGIC ----- #

# Check currently installed packages
$chocoInstalled = choco list --local-only -r | ForEach-Object {
    return $_.Split("|", 2)[0]
}

$scoopInstalled = scoop.cmd list | ForEach-Object {
    if ($_.StartsWith("  ")) {
        return $_.Trim().Split(" ", 2)[0]
    }
}

# Install packages
$chocoPackages | ForEach-Object {
    $pkg = $_
    if ($chocoInstalled -contains $pkg) {
        Write-Output "Already have $pkg installed."
    } else {
        choco.exe install -y $pkg
    }
}

$scoopPackages | ForEach-Object {
    $pkg = $_
    if ($scoopInstalled -contains $pkg) {
        Write-Output "Already have $pkg installed."
    } else {
        scoop.cmd install $pkg
    }
}


# TODO: kubeseal, kubernetic, kubebox
