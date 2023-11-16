
$path = (Split-Path $MyInvocation.MyCommand.Path -Parent)

$path = Join-Path $path "csharp_dll"

$PSversion = $PSversiontable.PSVersion

$src = ""

# windows only
if ($PSVersion.Major -eq 5 -and $PSVersion.Minor -ge 1) {
    $path = Join-Path $path "net48"
} elseif ($PSVersion.Major -eq 7 -and $PSVersion.Minor -ge 3) {
    $path = Join-Path $path "net7.0"
} elseif ($PSVersion.Major -eq 7 -and $PSVersion.Minor -eq 2) {
    $path = Join-Path $path "net6.0"
} else {
    # not supported powershell
    # throw Error
}
$src = Join-Path $path "lib.dll"
# load csharp library.
Add-Type -Path $src

# 
[lib.Math]::add_x86_64_pc_windows_msvc(2, 3)
