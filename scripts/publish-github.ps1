param(
  [string]$Owner = "KERWINLAW",
  [string]$Repo = "voron24-z-brake-stepper-mod",
  [string]$Description = "Voron 2.4 four-Z brake stepper relay mod with Chinese and English documentation.",
  [switch]$Private,
  [string]$Token = $env:GITHUB_TOKEN
)

$ErrorActionPreference = "Stop"

if (-not $Token) {
  $Token = $env:GH_TOKEN
}

if (-not $Token) {
  throw "Set GITHUB_TOKEN or GH_TOKEN before running this script."
}

$repoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $repoRoot

$headers = @{
  Authorization = "Bearer $Token"
  Accept = "application/vnd.github+json"
  "X-GitHub-Api-Version" = "2022-11-28"
}

$body = @{
  name = $Repo
  description = $Description
  private = [bool]$Private
  auto_init = $false
} | ConvertTo-Json

try {
  Invoke-RestMethod -Method Post -Uri "https://api.github.com/user/repos" -Headers $headers -Body $body -ContentType "application/json" | Out-Null
  Write-Host "Created GitHub repository: $Owner/$Repo"
}
catch {
  if ($_.Exception.Response.StatusCode.value__ -eq 422) {
    Write-Host "Repository may already exist: $Owner/$Repo"
  }
  else {
    throw
  }
}

git remote remove origin 2>$null
git remote add origin "https://github.com/$Owner/$Repo.git"
git branch -M main
git push -u origin main

Write-Host "Published: https://github.com/$Owner/$Repo"
