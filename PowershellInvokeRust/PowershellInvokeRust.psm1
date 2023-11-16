
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

# specified architecture
[SystemArch] $global:os_type = [SystemArch]::Unknown
if ($PSVersion.Major -eq 5 -and $PSVersion.Minor -ge 1) {
    $global:os_type = [SystemArch]::X64
} else {
    if ($PSversiontable.OS -match "Darwin" -or $PSversiontable.OS -match "Linux") {
        $unamem = (uname -m)

        if ($unamem -match "x86_64") {
            $global:os_type = [SystemArch]::X64
        } elseif ($unamem -match "aarch64") {
            $global:os_type = [SystemArch]::Aarch64
        }
        # x86_64
    } elseif ($PSversiontable.OS -match "Windows") {
        $unamem = systeminfo.exe | Where-Object {$_ -match "System Type:"}

        if ($unamem -match "x64") {
            $global:os_type = [SystemArch]::X64
        } elseif ($unamem -match "ARM") {
            $global:os_type = [SystemArch]::Aarch64
        }
    }
}

function Measure-Add {

    param (
        [Parameter(Mandatory=$true)]
        [Int32] $x,
        [Parameter(Mandatory=$true)]
        [Int32] $y
    )

    if ($PSversiontable.PSVersion.Major -eq 5 -and $PSversiontable.PSVersion.Major -ge 1) {
        [lib.Math]::add_x86_64_pc_windows_msvc($x, $y)
    } elseif ( $PSversiontable.OS -match "Windows" -and $global:os_type -eq [SystemArch]::X64) {
        [lib.Math]::add_x86_64_pc_windows_msvc($x, $y)
    } elseif ( $PSversiontable.OS -match "Windows" -and $global:os_type -eq [SystemArch]::Aarch64) {
        [lib.Math]::add_aarch64_pc_windows_msvc($x, $y)
    } elseif ( $PSversiontable.OS -match "Darwin" -and $global:os_type -eq [SystemArch]::X64) {
        [lib.Math]::add_x86_64_pc_apple_darwin($x, $y)
    } elseif ( $PSversiontable.OS -match "Darwin" -and $global:os_type -eq [SystemArch]::Aarch64) {
        [lib.Math]::add_aarch64_pc_apple_darwin($x, $y)
    } elseif ( $PSversiontable.OS -match "Linux" -and $global:os_type -eq [SystemArch]::X64) {
        [lib.Math]::add_x86_64_unknown_linux_gnu($x, $y)
    } elseif ( $PSversiontable.OS -match "Linux" -and $global:os_type -eq [SystemArch]::Aarch64) {
        [lib.Math]::add_aarch64_unknown_linux_gnu($x, $y)
    }
}
