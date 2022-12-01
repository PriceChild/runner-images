# All these functions just use mocked data for now to simplify local testing

function Get-ToolcacheRubyVersions {
    # just mock ruby versions array for now
    $rubyVersions = @("2.7", "2.8.1", "3.1.2")
    return [ToolVersionsNode]::new("Ruby", $rubyVersions)
}

function Get-ToolcacheGoVersions {
    # just mock go versions array for now
    $goVersions = @("1.17.13", "1.18.7", "1.19.2")
    return [ToolVersionsNode]::new("Go", $goVersions)
}

function Get-JavaVersionsTable {
    $javaVersions = @("7.0.0", "8.0.346+1", "11.0.16+1", "17.0.6+1", "19.0.2")
    $table = $javaVersions | ForEach-Object {
        $javaVersion = $_
        $vendor = "Eclipse Temurin"
        $majorVersion = $javaVersion.Split(".")[0]
        $envVar = "JAVA_HOME_$($majorVersion)_X64"

        return [PSCustomObject] @{
            "Version" = $javaVersion
            "Vendor" = $vendor
            "Environment Variables" = $envVar
        }
    }

    return [TableNode]::new("Java", $table)
}

function Get-BashVersion {
    "5.1.16(1)-release"
}

function Get-NodeVersion {
    "16.18.0"
}

function Get-PerlVersion {
    "5.34.0"
}

function Get-SwiftVersion {
    "5.7"
}

function Get-MySQLVersion {
    "8.0.31-0ubuntu0.20.04.1"
}

function Get-MySQLServerVersion {
    "8.0.26"
}