function compact {
    param (
        [Parameter(Mandatory = $true)]
        [string]$file,     # File argument (without .vdi extension)

        [string]$dir       # Directory argument (optional, defaults to file's directory)
    )

    # Default the dir argument to the directory of the file if not provided
    if (-not $dir) {
        $dir = $file
    }
	
    # Resolve the file path and ensure it includes .vdi
    $filePath = Resolve-Path -Path "D:\VirtualBox\Linux\$dir\$file.vdi" -ErrorAction Stop

    # Change to the specified directory
    Push-Location -Path D:\VirtualBox\Linux\$dir

    try {
        # Run VBoxManage.exe with the compact command
        Write-Host "This command will only compactify a virtual machine if you have zerofree'd it. By running zerofree -v on the applicable file systems when they are not mounted, like from another booted VM."
        & "VBoxManage.exe" modifymedium disk --compact "$file.vdi"

        # Print success message
        Write-Host "Successfully compacted the disk: $file.vdi in $dir"
    }
    catch {
        # Print any errors encountered
        Write-Error "Failed to compact the disk: $_"
    }
    finally {
        # Return to the original directory
        Pop-Location
    }
}

function alml {
    compact("AlmaLinux 9.5")
}

New-Alias -Name alma -Value alml

New-Alias -Name almalinux -Value alml

function arch {
    VBoxManage.exe modifymedium disk --compact "C:\Users\User\VirtualBox VMs\Linux\Arch Linux\Arch Linux btrfs.vdi"
}

function calcl {
    compact("Calculate Linux")
}

New-Alias -Name calculate -Value calcl

function chiml {
    compact("Chimera Linux")
}

function chimera {
    VBoxManage.exe modifymedium disk --compact "C:\Users\User\VirtualBox VMs\Linux\Chimera Linux\Chimera Linux.vdi"
}
function deb12 {
    compact("Debian 12")
}

function debunst {
    compact("Debian Unstable")
}

function exherbo {
#    VBoxManage.exe modifymedium disk --compact "C:\Users\User\VirtualBox VMs\Linux\Exherbo\Exherbo Linux.vdi"
    compact -dir "Exherbo" -file "Exherbo Linux"
}

function fed41 {
    compact("Fedora 41")
}

function gentoo {
    compact("Gentoo Linux")
}

function guixsd {
    compact -dir "Guix System 1.4.0" -file "Guix System"
}

New-Alias -Name guix -Value guixsd

function mageia9 {
    compact("Mageia 9")
}

function nix2411 {
    compact -dir "NixOS 24.11" -file "NixOS 24.11_1"
}

function nixunst {
    compact("NixOS unstable (30GB root)")
}

function nutyx {
    compact("NuTyX 24.10")
}

function omandr {
    compact("OpenMandriva Lx Rolling")
}

New-Alias -Name openmandriva -Value omandr

function otumb {
    compact("openSUSE Tumbleweed")
}

New-Alias -Name tumbleweed -Value otumb

function rhino {
    compact("Rhino Linux")
}

New-Alias -Name rhinolinux -Value rhino

function slack15 {
    compact -dir "Slackware Linux 15.0" -file "Slackware Linux"
}

New-Alias -Name slackware -Value slack15

function solus {
    compact("Solus")
}

function void {
    compact("Void Linux")
}

function vboxkstat {
    sc.exe query vboxsup
}

function franklin {
    julia -e "using Franklin; serve()"
}