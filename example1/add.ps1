
$src = Get-Content math.cs -Raw

Add-Type -TypeDefinition $src

[lib.Math]::add2(12, 22)
