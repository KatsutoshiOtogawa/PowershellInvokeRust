
# 

@{
    ModuleVersion = '#tagVersion'
    Author = 'Otogawa Katsutoshi'
    Copyright = 'Otogawa Katsutoshi. All rights reserved.'
    # Supported PSEditions
    CompatiblePSEditions = 'Core', 'Desktop'
    PowerShellVersion = '5.1'
    Description = 'Powershell Invoke rust sample'
    GUID = 'f3192037-2de7-4995-bb20-83e4ea6fc3ff'
    ModuleToProcess = 'PowershellInvokeRust.psm1'
    FunctionsToExport = 'Measure-Add'

    PrivateData = @{
        PSData = @{
            Tags = 'rust'
            ProjectUri = 'https://github.com/KatsutoshiOtogawa/PowershellInvokeRust'
            LicenseUri = 'https://github.com/KatsutoshiOtogawa/PowershellInvokeRust/blob/v#tagVersion/PowershellInvokeRust/LICENSE'
            ReleaseNotes = 'Release notes for version 1.0'
        }
    }
    # RequiredModules = @{

    # }
}
