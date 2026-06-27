# Council Skill

Stop trusting the first answer. Run high-stakes decisions through a **token-efficient multi-agent council** — Scout, Advocate, Skeptic, Fact Checker — and get a ranked verdict with dissent preserved.

Inspired by [Karpathy's LLM Council](https://github.com/karpathy/llm-council) and community Claude skills like [aiwithremy/claude-skills-llm-council](https://github.com/aiwithremy/claude-skills-llm-council). Simplified: no multi-model API wiring. Uses **sub-agents** plus two companion skills you install once:

- **[last30days](https://github.com/mvanhorn/last30days-skill)** — Scout baseline from recent social/web signal
- **[deep-research](https://github.com/199-biotechnologies/claude-deep-research-skill)** — Fact Checker claim verification (Quick mode)

---

## Cursor (recommended)

### Install

**One-liner — Windows (PowerShell):**
```powershell
git clone https://github.com/Endokelp/council-skill.git $env:TEMP\council-skill
& "$env:TEMP\council-skill\install.ps1"
```

**One-liner — macOS / Linux:**
```bash
git clone https://github.com/Endokelp/council-skill.git /tmp/council-skill
/tmp/council-skill/install.sh
```

Installs to **`~/.cursor/skills/council/`** (global — available in every project). Also installs companion skills via `npx skills add`.

**Via skills.sh (after repo is public):**
```bash
npx skills add Endokelp/council-skill --skill council -g -y
```

**Manual:**
```bash
git clone https://github.com/Endokelp/council-skill.git
cp -R council-skill/skills/council ~/.cursor/skills/council   # macOS/Linux
# Windows: Copy-Item -Recurse council-skill\skills\council $env:USERPROFILE\.cursor\skills\council

npx skills add mvanhorn/last30days-skill -g -y
npx skills add 199-biotechnologies/claude-deep-research-skill --skill deep-research -g -y
```

Restart Cursor after install.

### Use in Cursor

The skill has `disable-model-invocation: true` — it loads **only when you name it**. Say one of:

| What you type | What happens |
|---------------|--------------|
| `council this: Mac Studio vs DGX Spark under $5k` | Lite council (default) |
| `/council Which vendor for 3-year lock-in?` | Lite council |
| `/council full Should we pivot pricing model?` | Full council (~2–3× tokens) |
| `run the council`, `pressure-test this`, `war room this`, `debate this` | Lite council |
| `@council` or "use the council skill" | Lite council |

The agent spawns parallel **`Task`** sub-agents for each wave:

| Wave | Tasks | `subagent_type` | `run_in_background` |
|------|-------|-----------------|---------------------|
| Scout | 1 | `generalPurpose` | `false` |
| Advocate + Skeptic | 2 (same message) | `generalPurpose` | `false` |
| Fact Checker | 1 | `generalPurpose` | `false` |
| Repo discovery (Step 0 only) | 1 | `explore` | `false` |

Chairman synthesis stays **inline** in the main session — no `Task` for the final verdict. Full Task template: [skills/council/SKILL.md](skills/council/SKILL.md).

**Good questions:** vendor lock-in, architecture forks, expensive purchases, strategy pivots.

**Skip for:** factual one-liners, cheap reversible choices, pure writing tasks.

---

## Claude Code

Also installs to `~/.claude/skills/council/`. Restart Claude Code, then:

```
/council <question>
/council full <question>
```

---

## What you get

- Ranked list with **#1 clearly marked**
- Strongest **dissent** kept visible (not smoothed over)
- **"The condition that would change the answer"**
- Evidence-bound tone — URLs on hard numbers, Fact Checker catches overstatements

---

## Repo layout

```
council-skill/
├── skills/council/SKILL.md   # the skill
├── docs/GITHUB-GROWTH.md     # launch & distribution playbook
├── install.ps1               # Windows installer (Claude + Cursor)
├── install.sh                # macOS/Linux installer (Claude + Cursor)
└── README.md
```

---

## Credits

- Methodology: [Andrej Karpathy — LLM Council](https://github.com/karpathy/llm-council)
- Companion skills: [mvanhorn/last30days-skill](https://github.com/mvanhorn/last30days-skill), [199-biotechnologies/claude-deep-research-skill](https://github.com/199-biotechnologies/claude-deep-research-skill)
- Pattern + token discipline: [Endokelp](https://github.com/Endokelp) / CodingBrain (JARVIS hardware council, 2026-06)

## License

MIT — see [LICENSE](LICENSE).
