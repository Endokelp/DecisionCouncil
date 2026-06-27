# DecisionCouncil

[![skills.sh](https://img.shields.io/badge/skills.sh-council-000?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiBzdHJva2U9IndoaXRlIiBzdHJva2Utd2lkdGg9IjIiPjxwYXRoIGQ9Ik0xMiAyTDIgN2wxMCA1IDEwLTUtMTAtNXoiLz48L3N2Zz4=)](https://skills.sh/Endokelp/DecisionCouncil/council)

Most council skills give you opinions. **DecisionCouncil** gives you a ranked verdict, checked claims, and the dissent you would have missed.

One install. Lite mode by default (~4 sub-agents). Scout pulls recent signal via [last30days](https://github.com/mvanhorn/last30days-skill). Fact Checker verifies numbers via [deep-research](https://github.com/199-biotechnologies/claude-deep-research-skill). You get **#1 marked**, strongest counterargument preserved, and the one condition that would flip the call.

Works in **Cursor** and **Claude Code**.

---

## Install

```bash
npx skills add Endokelp/DecisionCouncil --skill council -g -y
```

That installs the council skill globally. For companion research skills in one shot:

**Windows (PowerShell):**
```powershell
git clone https://github.com/Endokelp/DecisionCouncil.git $env:TEMP\DecisionCouncil
& "$env:TEMP\DecisionCouncil\install.ps1"
```

**macOS / Linux:**
```bash
git clone https://github.com/Endokelp/DecisionCouncil.git /tmp/DecisionCouncil
/tmp/DecisionCouncil/install.sh
```

Restart your editor after install.

---

## Use it

The skill only runs when you name it (`disable-model-invocation: true`). Say one of:

| You type | Mode |
|----------|------|
| `council this: Mac Studio vs DGX Spark under $5k` | Lite (default) |
| `/council Which vendor for a 3-year lock-in?` | Lite |
| `/council full Should we pivot pricing?` | Full (~2 to 3x tokens) |
| `pressure-test this`, `war room this`, `debate this` | Lite |

**Good questions:** vendor lock-in, hardware purchases, architecture forks, strategy pivots, anything expensive to get wrong.

**Skip it:** trivia, cheap reversible choices, pure writing tasks, code review (use a reviewer skill instead).

---

## Example output (shape)

```markdown
## Council: Local AI brain under $5k

1. **Mac Studio M4 Max 128GB** — WINNER
   Trade-off: swap-on-demand for 70B, not resident dual-30B parallel.

2. DGX Spark 128GB
   Trade-off: dense 70B decode ~5 tok/s; thermal reports still messy.

3. Dual used RTX 3090 build
   Trade-off: best tok/s per dollar, wrong for a quiet 24/7 desk box.

**Strongest dissent:** Skeptic argues Spark CUDA ecosystem wins if fine-tuning becomes primary, not 20% side work.

**Condition that would change the answer:** verified firmware lifts Spark dense-70B above ~15 tok/s AND fixes sustained thermal shutdowns.
```

Full anonymized examples: [docs/examples/](docs/examples/).

---

## Why not the other council skills?

The market already has councils. They solve different problems.

| | [affaan-m/council](https://skills.sh/affaan-m/everything-claude-code/council) | [karpathy/llm-council](https://github.com/karpathy/llm-council) | [aiwithremy/llm-council](https://github.com/aiwithremy/claude-skills-llm-council) | **DecisionCouncil** |
|---|:---:|:---:|:---:|:---:|
| **What it is** | Opinion council inside a 200K+ star skill pack | Multi-model web app | 5-advisor Claude skill | Standalone evidence council |
| **Research** | You bring context | None built-in | None built-in | **last30days** Scout + **deep-research** Fact Checker |
| **Output** | Compact verdict + dissent line | Chairman synthesis | Chairman + peer review | **Ranked list, #1 marked** + falsifier |
| **Token model** | 3 sub-agents, one round | Full pipeline always | 5 advisors + review | **Lite default**, Full optional |
| **Cursor** | Claude Code ecosystem | N/A (separate app) | Claude-focused | **Cursor Task + Claude Code** |
| **Best for** | Ambiguous tradeoffs, fast | Compare models side by side | Business/creator decisions | **High-stakes, evidence-bound forks** |

**affaan-m** ships council inside [everything-claude-code](https://github.com/affaan-m/everything-claude-code). That is smart distribution: one mega repo, 3.7K+ installs on skills.sh, four voices (Skeptic, Pragmatist, Critic) with clean anti-anchoring. It is built for **decision-making under ambiguity**, not for verifying whether a benchmark number is real.

**DecisionCouncil** is the council you run when the decision has a price tag. Scout establishes a shared baseline once (so five agents do not re-google the same spec sheet). Advocate and Skeptic argue from different angles. Fact Checker runs claims through deep-research Quick mode. You leave with a ranked shortlist, not just a vibes-based recommendation.

> Karpathy's council compares models. aiwithremy's council convenes five advisors. affaan-m's council surfaces tradeoffs fast inside ECC. **DecisionCouncil is the evidence-bound council for Cursor and Claude Code.**

---

## What affaan-m got right (and what we kept)

From [skills.sh/affaan-m/everything-claude-code/council](https://skills.sh/affaan-m/everything-claude-code/council):

1. **One-line install on skills.sh** (`npx skills add ... --skill council`)
2. **Explicit when to use / when not** table (we extend this with token discipline)
3. **Fresh sub-agents with compact context only** (anti-anchoring)
4. **Dissent visible in the final output** (not smoothed away)
5. **Single-purpose skill** in a discoverable directory

What we added: research companions, Fact Checker verification, ranked output, Lite vs Full modes, and first-class Cursor support.

---

## Cursor

Install lands at `~/.cursor/skills/council/`. Invoke with `council this:` or `/council`.

Sub-agents use the **Task** tool (`generalPurpose`, `run_in_background: false`). Spawn Scout, then Advocate + Skeptic in parallel, then Fact Checker. Chairman synthesis stays in the main session.

Details: [skills/council/SKILL.md](skills/council/SKILL.md)

---

## Claude Code

Also installs to `~/.claude/skills/council/`. Use `/council` or `/council full`.

---

## Repo layout

```
DecisionCouncil/
├── skills/council/SKILL.md
├── docs/
│   ├── GITHUB-GROWTH.md      # launch playbook
│   ├── COMPARISON.md         # full market comparison
│   └── examples/             # sample council outputs
├── install.ps1
├── install.sh
└── README.md
```

---

## Credits

- Methodology: [Andrej Karpathy, LLM Council](https://github.com/karpathy/llm-council)
- ECC council pattern: [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code)
- Community skill: [aiwithremy/claude-skills-llm-council](https://github.com/aiwithremy/claude-skills-llm-council)
- Research companions: [last30days](https://github.com/mvanhorn/last30days-skill), [deep-research](https://github.com/199-biotechnologies/claude-deep-research-skill)
- Built by [Endokelp](https://github.com/Endokelp). Dogfooded on a real hardware council (JARVIS brain selection, 2026-06).

## License

MIT. See [LICENSE](LICENSE).
