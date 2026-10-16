$subdir = $args[0]
if (!$subdir) {
  throw "Usage: new-letter.ps1 <directory>"
}
$target = Join-Path -Path (Get-Item .).FullName -ChildPath $subdir
if (Test-Path -Path $target) {
  throw "Directory already exists."
}
Write-Output "Creating new letter in .\$subdir..."
git clone --depth=1 https://github.com/cs-uob/bristol-cs-letter.git $target
if ($LASTEXITCODE -ne 0) {
  throw "git clone failed."
}

$repoFiles = @(
  (Join-Path -Path $target -ChildPath ".git"),
  (Join-Path -Path $target -ChildPath "scripts"),
  (Join-Path -Path $target -ChildPath ".github")
)
foreach ($f in $repoFiles) {
  if (Test-Path -Path $f) {
    Remove-Item -LiteralPath $f -Force -Recurse
  }
}
