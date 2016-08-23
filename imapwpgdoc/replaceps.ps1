$path=".\"
$files=get-childitem $path -include *.html -recurse

foreach ($i in $files){
(Get-Content  $i) |
Foreach-Object {$_ -replace "img alt=""""", "img width=""100%"" alt="""""} |
select-string -pattern "<span class=""rvts12"">" -notmatch |
Set-Content  $i}