$subdir = $args[0]
if (!$subdir) {
  throw "Empty directory name."
}
$target = Join-Path -Path (Get-Item .).FullName -ChildPath $subdir
if (Test-Path -Path $target) {
  throw "Directory already exists."
}
Write-Output "Creating new letter in $subdir..."
git clone --depth=1 git@github.com:cs-uob/bristol-cs-letter.git $target 2> $null
$gitDir=Join-Path -Path $target -ChildPath ".git"
if (Test-Path -Path $gitDir) {
  Remove-Item -LiteralPath $gitDir -Force -Recurse
}