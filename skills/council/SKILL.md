---
name: council
description: >-
  Evidence-bound multi-agent council for high-stakes decisions. Scout uses last30days,
  Advocate and Skeptic debate, Fact Checker uses deep-research Quick mode. Delivers
  ranked options with #1 marked, dissent preserved, and the condition that would flip
  the verdict. Use when user says council this, /council, run the council,
  pressure-test this, stress-test this, war room this, debate this, or names this
  skill for vendor, architecture, purchase, or strategy forks. Lite by default.
  Not for code review, trivia, or cheap reversible choices. Cursor and Claude Code.
disable-model-invocation: true
homepage: https://github.com/Endokelp/DecisionCouncil
repository: https://github.com/Endokelp/DecisionCouncil
---

# DecisionCouncil

A disciplined, adversarial decision procedure inspired by [Karpathy's LLM Council](https://github.com/karpathy/llm-council) and the [ECC council pattern](https://skills.sh/affaan-m/everything-claude-code/council). One **orchestrator** (you, the main session) frames the question, spawns **sub-agents** with distinct lenses, uses **`last30days`** and **`deep-research`** only where they earn their tokens, seats a **Fact Checker**, surfaces real disagreement, and synthesizes a **ranked list with a clearly-marked #1** plus the condition that would change the answer.

**Different from opinion-only councils:** Scout establishes a shared baseline once. Fact Checker verifies contested claims (VERIFIED / PARTLY / FALSE / UNVERIFIABLE). Output is a ranked shortlist, not a single blended paragraph.

**Companion skills (install together):** [`last30days`](https://github.com/mvanhorn/last30days-skill) for recent social/web signal; [`deep-research`](https://github.com/199-biotechnologies/claude-deep-research-skill) for claim verification.

**Install:** `npx skills add Endokelp/DecisionCouncil --skill council -g -y`

## Cursor (primary)

**Install:** `~/.cursor/skills/council/SKILL.md` (run `install.ps1` or `install.sh` from this repo).

**Invoke:** user must name the skill or use a trigger phrase (this skill does not auto-load):

- `council this: <question>`
- `/council <question>` or `/council full <question>`
- `run the council`, `pressure-test this`, `stress-test this`, `war room this`, `debate this`
- `@council` or "use the council skill"

**Sub-agents:** use the **`Task`** tool. Spawn each wave in **one message** with multiple parallel `Task` calls.

| Role | `subagent_type` | `run_in_background` | Notes |
|------|-----------------|---------------------|-------|
| Scout, Advocate, Skeptic, Fact Checker | `generalPurpose` | `false` | Council waves must block until each agent returns |
| Repo/file discovery only | `explore` | `false` | Use when Step 0 needs codebase context, not for debate personas |

**Task prompt template.** Give each sub-agent:

1. Step-0 frame (decision, options, constraints, deciding metric)
2. Prior wave output only (not full chat history)
3. Role instructions + word cap
4. "Return ranked top-N + list of factual claims for Fact Checker"

**Example (Advocate + Skeptic in parallel):**

```
Task(description="Council Advocate", subagent_type="generalPurpose", run_in_background=false, prompt="...")
Task(description="Council Skeptic", subagent_type="generalPurpose", run_in_background=false, prompt="...")
```

Do **not** spawn subagents for orchestrator synthesis. That stays inline in the main session.

**Cursor anti-patterns (never):**

- `run_in_background: true` for council waves. Synthesis depends on completed persona output.
- `explore` for Advocate/Skeptic/Fact Checker. Debate personas need `generalPurpose` + web search.
- Multiple sequential messages per wave. Batch parallel `Task` calls in **one** orchestrator turn.
- Passing full chat history into sub-agent prompts. Step-0 frame + prior wave only.

**Wave checklist (Cursor):**

```
Lite council:
- [ ] Step 0 frame inline (or 1× explore Task if repo context needed)
- [ ] 1× Task Scout
- [ ] 2× Task Advocate + Skeptic (same message)
- [ ] 1× Task Fact Checker
- [ ] Chairman synthesis inline (no Task)
```

Install via repo: `npx skills add Endokelp/DecisionCouncil --skill council -g -y` or `install.ps1` / `install.sh`.

## Claude Code

Works with `/council`. Use the `Agent` tool instead of `Task`; same wave structure and token caps.

## When to use / when NOT to

- **USE** for: expensive purchase, architecture or vendor lock-in, strategy fork, "which of these options". Anything **costly to get wrong or hard to reverse**.
- **DO NOT** use for: reversible, cheap, or low-stakes choices. The council is deliberately heavyweight.

## The research model

Each lens argues from **its own evidence**, not vibes:

1. **Scout** (1 `Task`): run **`last30days`** when recency/social signal matters, plus lean baseline (option list, prices, headline specs, deciding metric). ≤ ~600 words, URL per number. No opinion.
2. **Advocate + Skeptic** (2 parallel `Task`s): each gets frame + Scout baseline; **≤5 lens-specific web searches** for NEW evidence only.
3. **Fact Checker** (1 `Task`): run **`deep-research`** in **Quick** mode on contested claims. VERIFIED / PARTLY / FALSE / UNVERIFIABLE + cited source. ≤ ~700 words.
4. **Orchestrator** synthesizes inline as Neutral + Pragmatist + chairman. No extra agent.

**Do not** invoke `last30days` or `deep-research` inside Advocate/Skeptic. Those personas stay search-light.

## Token discipline (mandatory)

1. **Baseline once, angles many.** Scout establishes shared facts; personas research only their angle.
2. **Cap every sub-agent.** Scout ≤ ~600 words; each persona ≤ ~700 words; Fact Checker ≤ ~700 words. Cite URLs. No preamble.
3. **One round by default.** Personas pre-empt the opposing side's strongest point. Rebuttal round ONLY for unresolved factual conflict. **1 to 2 agents max**.
4. **Orchestrator absorbs Neutral + Pragmatist + chairman** in lite mode.
5. **Parallelize.** Multiple `Task` calls in one message per wave. Use agent summaries, not full transcripts.
6. **Gather local context once.** Read PRD/repo/files once; distil into Step-0 frame for every prompt.

## Modes

- **LITE (default):** Scout → Advocate + Skeptic (parallel) → Fact Checker → orchestrator synthesis. ~4 sub-agents.
- **FULL** (`/council full` or user says "full council"): Scout → 5 personas + Fact Checker → rebuttal on contested points only → synthesis. ~2–3× lite tokens.

---

## Procedure: LITE (default)

**Step 0, Frame (orchestrator, inline).** Read local context once. ≤6 bullets: decision, candidate options, hard constraints, single deciding metric. Paste into every `Task` prompt.

**Step 1, Scout (1 `Task`).** Invoke **`last30days`** when the decision depends on current social/web signal. Baseline: per-option price/spec/status, conflicts as ranges. ≤ ~600 words, URL per number, no opinion.

**Step 2, Advocate + Skeptic (2 `Task`s, parallel, one message).** ≤5 lens-specific searches each:
- **Advocate:** strongest case for top 1–2 contenders; pre-empt Skeptic.
- **Skeptic:** adversarial downside; pre-empt Advocate.

Both: ≤ ~700 words, cite URLs, ranked top-N + **factual claims** for Fact Checker.

**Step 3, Fact Checker (1 `Task`).** **`deep-research`** Quick on claim list. ≤ ~700 words.

**Step 4, Synthesize (orchestrator, inline).** Fold in corrections. At most one targeted follow-up if a decisive number is still contested. Deliver:
- **ranked list, #1 clearly marked**, one deciding trade-off per option
- **strongest preserved dissent**
- **"the condition that would change the answer"**

## Procedure: FULL (explicit request only)

Same Step 0 + Scout. Then Round 1 (5 parallel `Task`s): Optimist, Pessimist, Neutral Analyst, Pragmatist + Fact Checker on strongest claims. Rebuttal on contested agents only. Synthesis with #1 marked, dissent preserved.

## Output contract

Ranked list with **#1 unambiguous**; each entry one deciding line; main dissent visible; condition that would flip the verdict; honest "no option satisfies all constraints" when true. Chairman tone: decisive, evidence-bound.

## Triggers (explicit invocation required)

| Phrase | Mode |
|--------|------|
| `council this: …` | LITE |
| `/council …` | LITE |
| `/council full …` | FULL |
| `run the council`, `pressure-test this`, `stress-test this`, `war room this`, `debate this` | LITE |
| "use council skill", `@council` | LITE unless user says "full" |

## Credits

- Methodology: [Andrej Karpathy, LLM Council](https://github.com/karpathy/llm-council)
- ECC council pattern: [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code)
- Research companions: [last30days](https://github.com/mvanhorn/last30days-skill), [deep-research](https://github.com/199-biotechnologies/claude-deep-research-skill)
- Token-efficient sub-agent pattern: Endokelp / CodingBrain (JARVIS brain-selection council, 2026-06)
