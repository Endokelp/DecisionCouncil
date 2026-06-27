# Install DecisionCouncil + companion skills globally (Claude Code + Cursor)
# Usage: irm https://raw.githubusercontent.com/Endokelp/DecisionCouncil/main/install.ps1 | iex
#    or: .\install.ps1

$ErrorActionPreference = "Stop"

$RepoRoot = $PSScriptRoot
$CouncilSrc = Join-Path $RepoRoot "skills\council"

$Targets = @(
    @{ Host = "Claude Code"; Dir = Join-Path $env:USERPROFILE ".claude\skills\council" },
    @{ Host = "Cursor";      Dir = Join-Path $env:USERPROFILE ".cursor\skills\council" }
)

if (-not (Test-Path (Join-Path $CouncilSrc "SKILL.md"))) {
    Write-Error "SKILL.md not found at $CouncilSrc. Run this script from the DecisionCouncil repo root."
}

Write-Host "`n=== DecisionCouncil installer ===" -ForegroundColor Cyan

foreach ($t in $Targets) {
    New-Item -ItemType Directory -Force -Path $t.Dir | Out-Null
    Copy-Item -Path (Join-Path $CouncilSrc "*") -Destination $t.Dir -Recurse -Force
    Write-Host "  Installed council -> $($t.Dir)  ($($t.Host))" -ForegroundColor Green
}

Write-Host "`n=== Companion skills (global) ===" -ForegroundColor Cyan

function Invoke-SkillsAdd {
    param([string]$Args)
    Write-Host "  npx skills add $Args" -ForegroundColor DarkGray
    npx --yes skills add $Args
    if ($LASTEXITCODE -ne 0) {
        Write-Warning "  npx skills add failed ($Args). Install manually. See README."
    }
}

Invoke-SkillsAdd "mvanhorn/last30days-skill -g -y"
Invoke-SkillsAdd "199-biotechnologies/claude-deep-research-skill --skill deep-research -g -y"

Write-Host "`nDone." -ForegroundColor Cyan
Write-Host "  skills.sh:   npx skills add Endokelp/DecisionCouncil --skill council -g -y"
Write-Host "  Cursor:      restart, then  council this: <your question>"
Write-Host "  Claude Code: restart, then  /council <your question>"
Write-Host ""
