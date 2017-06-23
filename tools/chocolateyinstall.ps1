$ErrorActionPreference = 'Stop';
$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/flexpaper/pdf2json/releases/download/v0.68/pdf2json-0.68-win32-installer.msi'
$sha256     = '5DB32FE8C3FC8C335F06E958DE254B1B36A7328CFF05F20D7B0F9AFDF2C5F1D8'
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64
  softwareName  = 'pdf2json*'
  checksum      = $sha256
  checksumType  = 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
$programFilesDir = (${env:ProgramFiles(x86)}, ${env:ProgramFiles} -ne $null)[0]
Install-ChocolateyPath "$programFilesDir\PDF2JSON"
