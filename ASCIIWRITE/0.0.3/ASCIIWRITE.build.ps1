$Script:IsAppveyor = $env:APPVEYOR -ne $null
$Script:ModuleName = Get-Item -Path $BuildRoot | Select-Object -ExpandProperty Name
Get-Module -Name $ModuleName,'helpers' | Remove-Module -Force
Import-Module "$BuildRoot\buildhelpers\helpers.psm1"

task Clean {
    Remove-Item -Path ".\Bin" -Recurse -Force -ErrorAction SilentlyContinue
}

task TestCode {
    Write-Build Yellow "`n`n`nTesting dev code before build"
    $TestResult = Invoke-Pester -Script "$PSScriptRoot\test\Unit" -Tag Unit -PassThru
    if($TestResult.FailedCount -gt 0) {throw 'Tests failed'}
}

task CopyFiles {
    $null = New-Item -Path "$BuildRoot\bin\$ModuleName" -ItemType Directory
    Copy-Item -Path "$BuildRoot\*.psd1" -Destination "$BuildRoot\bin\$ModuleName"
    Get-ChildItem -Path "$BuildRoot\license*" | Copy-Item -Destination "$BuildRoot\bin\$ModuleName"
}

task CompilePSM {
    $PrivatePath = '{0}\Private\*.ps1' -f $BuildRoot
    $PublicPath = '{0}\Public\*.ps1'-f $BuildRoot
    $ScriptPath = '{0}\Script\*.ps1'-f $BuildRoot
    Merge-ModuleFiles -Path $ScriptPath,$PrivatePath,$PublicPath -OutputPath "$BuildRoot\bin\$ModuleName\$ModuleName.psm1"

    $PublicScriptBlock = Get-ScriptBlockFromFile -Path $PublicPath
    $PublicFunctions = Get-FunctionFromScriptblock -ScriptBlock $PublicScriptBlock
    $PublicAlias = Get-AliasFromScriptblock -ScriptBlock $PublicScriptBlock
    $PublicFunctionParam, $PublicAliasParam = ''
    $UpdateManifestParam = @{}
    if(-Not [String]::IsNullOrEmpty($PublicFunctions)) {
        $PublicFunctionParam = "-Function '{0}'" -f ($PublicFunctions -join "','")
        $UpdateManifestParam['FunctionsToExport'] = $PublicFunctions
    }
    if($PublicAlias) {
        $PublicAliasParam = "-Alias '{0}'" -f ($PublicAlias -join "','")
        $UpdateManifestParam['AliasesToExport'] = $PublicAlias
    }
    $ExportStrings = 'Export-ModuleMember',$PublicFunctionParam,$PublicAliasParam | Where-Object {-Not [string]::IsNullOrWhiteSpace($_)}
    $ExportStrings -join ' ' | Out-File -FilePath  "$BuildRoot\bin\$ModuleName\$ModuleName.psm1" -Append -Encoding UTF8

    # If we have git and gitversion installed, let's use it to get new module version and Release Notes
    if ($(try{Get-Command -Name gitversion -ErrorAction Stop}catch{})) {
        $gitversion = gitversion | ConvertFrom-Json
        if ($gitversion.CommitsSinceVersionSource -gt 0) {
            # Prerelease, raise minor-version by 1 and add prerelease string.
            $UpdateManifestParam['ModuleVersion'] = '{0}.{1}.{2}' -f $gitversion.Major, ($gitversion.Minor+1), $gitversion.Patch
            $UpdateManifestParam['Prerelease'] = '-beta{0}' -f $gitversion.CommitsSinceVersionSourcePadded
        }
        else {
            # This is a release version
            # If there is a tag pointing at HEAD, use that as release notes
            $UpdateManifestParam['ModuleVersion'] = $gitversion.MajorMinorPatch
            if ($(try{Get-Command -Name git -ErrorAction Stop}catch{})) {
                if($CurrentTag = git tag --points-at HEAD) {
                    $ReleaseNotes = git tag -l -n20 $CurrentTag | Select-Object -Skip 1
                    $UpdateManifestParam['ReleaseNotes'] = $ReleaseNotes
                }
            }
        }
    }
    if ($UpdateManifestParam.Count -gt 0) {
        Update-ModuleManifest -Path "$BuildRoot\bin\$ModuleName\$ModuleName.psd1" @UpdateManifestParam
    }
}

task MakeHelp -if (Test-Path -Path "$PSScriptRoot\Docs") {

}

task TestBuild {
    Write-Build Yellow "`n`n`nTesting compiled module"
    $Script =  @{Path="$PSScriptRoot\test\Unit"; Parameters=@{ModulePath="$BuildRoot\bin\$ModuleName"}}
    $CodeCoverage = Get-Module "$BuildRoot\bin\$ModuleName" -ListAvailable |
        Select-Object -ExpandProperty ExportedCommands |
        Select-Object -ExpandProperty Keys | Foreach-Object -Process {
            @{Path="$BuildRoot\bin\$ModuleName\$ModuleName.psm1";Function=$_}
        }
    $TestResult = Invoke-Pester -Script $Script -Tag Unit -CodeCoverage $CodeCoverage -PassThru
    if($TestResult.FailedCount -gt 0) {throw 'Tests failed'}
}

task . Clean, TestCode, Build

task Build CopyFiles, CompilePSM, MakeHelp, TestBuild

