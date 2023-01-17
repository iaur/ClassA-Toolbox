#--init
$CreateCSV = Import-CSV -Path "C:\Users\be.fernandez\Desktop\PowerShellBootcamp\ClassA-Toolbox\script\create.csv"
#--transform
$PurposeItem = $CreateCSV | select-object  -ExpandProperty Purpose
$ArrayMembersItem = ($CreateCSV | select -ExpandProperty Members) -split (',')

$item = $CreateCSV | select -ExpandProperty Name
#--subtransform
$TrimedItem = ($item.TrimEnd()).TrimStart() #removed whitespaces
$NoCharsItem = $TrimedItem  -replace '[\W]', '' #removed special char
$LowerCasedItem = $NoCharsItem.ToLower() #convert to lowercasing
$AppendedItem = "GRS_" + $LowerCasedItem #append prefix
#--assembly

$AssembledObj = [PSCustomObject]@{
    Name = $NoCharsItem
    DisplayName  = "GRS " + $NoCharsItem
    PrimarySmtpAddress  = $AppendedItem + "@solutionautdev.onmicrosoft.com"
    Description = "`n Created at: G07PHXNWES00293" + `
    "`n Created by: be.fernandez" + `
    "`n Created on: 10/18/2022 14:06:41" + `
    "`n`n=========`n" + $PurposeItem

}

#--output
Write-Host "`n`n Name:" -foregroundcolor Cyan
$AssembledObj.Name
Write-Host "`n`n DisplayName:" -foregroundcolor Cyan
$AssembledObj.DisplayName
Write-Host "`n`n PrimarySmtpAddress:" -foregroundcolor Cyan
$AssembledObj.PrimarySmtpAddress
Write-Host "`n`n Description:" -foregroundcolor Cyan
$AssembledObj.Description

Write-Host "`n`n Members:" -foregroundcolor Cyan
$ArrayMembersItem