# Council Skill

Stop trusting the first answer. Run high-stakes decisions through a **token-efficient multi-agent council** — Scout, Advocate, Skeptic, Fact Checker — and get a ranked verdict with dissent preserved.

Inspired by [Karpathy's LLM Council](https://github.com/karpathy/llm-council) and community Claude skills like [aiwithremy/claude-skills-llm-council](https://github.com/aiwithremy/claude-skills-llm-council). Simplified: no multi-model API wiring. Uses **sub-agents** plus two companion skills you install once:

- **[last30days](https://github.com/mvanhorn/last30days-skill)** — Scout baseline from recent social/web signal
- **[deep-research](https://github.com/199-biotechnologies/claude-deep-research-skill)** — Fact Checker claim verification (Quick mode)

Works globally in **Claude Code** (`/council`) and **Cursor** (say `council this: …`).

---

## Install

### One-liner (recommended)

**Windows (PowerShell):**
```powershell
git clone https://github.com/Endokelp/council-skill.git $env:TEMP\council-skill
& "$env:TEMP\council-skill\install.ps1"
```

**macOS / Linux:**
```bash
git clone https://github.com/Endokelp/council-skill.git /tmp/council-skill
/tmp/council-skill/install.sh
```

The installer copies `council` into `~/.claude/skills/` and `~/.cursor/skills/`, then runs `npx skills add` for **last30days** and **deep-research** globally.

### Manual

```bash
git clone https://github.com/Endokelp/council-skill.git ~/.claude/skills/council-src
cp -R ~/.claude/skills/council-src/skills/council ~/.claude/skills/council
cp -R ~/.claude/skills/council-src/skills/council ~/.cursor/skills/council

npx skills add mvanhorn/last30days-skill -g -y
npx skills add 199-biotechnologies/claude-deep-research-skill --skill deep-research -g -y
```

Restart Claude Code or Cursor after install.

---

## Use

Triggers:

- `/council <question>`
- `council this: <question>`
- `run the council`, `pressure-test this`, `war room this`, `debate this`

**Lite (default):** Scout → Advocate + Skeptic (parallel) → Fact Checker → chairman synthesis.

**Full:** `/council full` — five personas + rebuttal round. Reserve for genuinely contested, expensive decisions (~2–3× tokens).

**Good questions:**
- "Which of these three vendors for a 3-year lock-in?"
- "Mac Studio vs DGX Spark for a local 70B brain box under $5k?"
- "Should I pivot from a $297 course to a $97 workshop?"

**Skip for:** factual one-liners, cheap reversible choices, pure writing tasks.

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
├── install.ps1               # Windows installer
├── install.sh                # macOS/Linux installer
└── README.md
```

---

## Credits

- Methodology: [Andrej Karpathy — LLM Council](https://github.com/karpathy/llm-council)
- Companion skills: [mvanhorn/last30days-skill](https://github.com/mvanhorn/last30days-skill), [199-biotechnologies/claude-deep-research-skill](https://github.com/199-biotechnologies/claude-deep-research-skill)
- Pattern + token discipline: [Endokelp](https://github.com/Endokelp) / CodingBrain (JARVIS hardware council, 2026-06)

## License

MIT — see [LICENSE](LICENSE).
