$subdir = $args[0]
if (!$subdir) {
  throw "Empty directory name."
}
$target = Join-Path -Path (Get-Item .).FullName -ChildPath $subdir
if (Test-Path -Path $target) {
  throw "Directory already exists."
}
Write-Output "Creating new letter in .\$subdir..."
git clone --depth=1 git@github.com:cs-uob/bristol-cs-letter.git $target 2> $null

$repoFiles = @(
  (Join-Path -Path $target -ChildPath ".git"),
  (Join-Path -Path $target -ChildPath ".gitmodules"),
  (Join-Path -Path $target -ChildPath "new-letter.ps1")
)
foreach ($f in $repoFiles) {
  if (Test-Path -Path $f) {
    Remove-Item -LiteralPath $f -Force -Recurse
  }
}

$gitignore = Join-Path -Path $target -ChildPath ".gitignore"
if (Test-Path -Path $gitignore) {
  Add-Content $gitignore "`n/helvetica-neue"
}