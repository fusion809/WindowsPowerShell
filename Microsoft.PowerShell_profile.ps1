function compact {
    echo("This command will only compactify a virtual machine if you have \n
    zerofree'd it. By running zerofree -v on the applicable file systems when
    they are not mounted, like from another booted VM.")
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

function debunst {
    compact("Debian Unstable")
}

function nixunst {
    compact("NixOS unstable")
}

function nix2411 {
    compact -dir "NixOS 24.11" -file "NixOS 24.11_1"
}
function vboxkstat {
    sc.exe query vboxsup
}