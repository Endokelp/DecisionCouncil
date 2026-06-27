# Install council + complementary skills globally (Claude Code + Cursor)
# Usage: irm https://raw.githubusercontent.com/Endokelp/council-skill/main/install.ps1 | iex
#    or: .\install.ps1

$ErrorActionPreference = "Stop"

$RepoRoot = $PSScriptRoot
$CouncilSrc = Join-Path $RepoRoot "skills\council"

$Targets = @(
    @{ Host = "Claude Code"; Dir = Join-Path $env:USERPROFILE ".claude\skills\council" },
    @{ Host = "Cursor";      Dir = Join-Path $env:USERPROFILE ".cursor\skills\council" }
)

if (-not (Test-Path (Join-Path $CouncilSrc "SKILL.md"))) {
    Write-Error "SKILL.md not found at $CouncilSrc. Run this script from the council-skill repo root."
}

Write-Host "`n=== Council skill installer ===" -ForegroundColor Cyan

foreach ($t in $Targets) {
    New-Item -ItemType Directory -Force -Path $t.Dir | Out-Null
    Copy-Item -Path (Join-Path $CouncilSrc "*") -Destination $t.Dir -Recurse -Force
    Write-Host "  Installed council -> $($t.Dir)  ($($t.Host))" -ForegroundColor Green
}

Write-Host "`n=== Complementary skills (global) ===" -ForegroundColor Cyan

function Invoke-SkillsAdd {
    param([string]$Args)
    Write-Host "  npx skills add $Args" -ForegroundColor DarkGray
    npx --yes skills add $Args
    if ($LASTEXITCODE -ne 0) {
        Write-Warning "  npx skills add failed ($Args). Install manually — see README."
    }
}

# last30days — recent social/web research
Invoke-SkillsAdd "mvanhorn/last30days-skill -g -y"

# deep-research — claim verification (Quick mode in Fact Checker)
Invoke-SkillsAdd "199-biotechnologies/claude-deep-research-skill --skill deep-research -g -y"

Write-Host "`nDone." -ForegroundColor Cyan
Write-Host "  Cursor:      ~/.cursor/skills/council  — restart Cursor, then:"
Write-Host "               council this: <your question>"
Write-Host "               or  /council <your question>  or  @council"
Write-Host "  Claude Code: ~/.claude/skills/council  — restart, then  /council <your question>"
Write-Host "  Companions:  last30days + deep-research skills should also be available.`n"
