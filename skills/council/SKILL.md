---
name: council
description: "Run a structured, evidence-based multi-agent debate (orchestrator + sub-agents with distinct lenses, Scout via /last30days, Fact Checker via /deep-research) to make a high-stakes, hard-to-reverse, or genuinely contested decision, then deliver a ranked recommendation with #1 clearly marked and dissent preserved. Use ONLY when the user explicitly asks for a council/debate/multi-perspective decision, or for an expensive purchase/architecture/strategy call worth the tokens. Token-aware by design. Do NOT use for cheap or easily reversible decisions."
disable-model-invocation: true
---

# The Council

A disciplined, adversarial decision procedure inspired by [Karpathy's LLM Council](https://github.com/karpathy/llm-council) and community Claude skills — simplified so you don't wire up multi-model APIs yourself. One **orchestrator** (you, the main session) frames the question, spawns **sub-agents** with distinct lenses, uses **`/last30days`** and **`/deep-research`** only where they earn their tokens, seats a **Fact Checker**, surfaces real disagreement, and synthesizes a **ranked list with a clearly-marked #1** plus the condition that would change the answer.

Works in **Claude Code** (`/council`) and **Cursor** (invoke this skill when the user says "council this", "/council", "run the council", etc.).

**Companion skills (install together):** [`last30days`](https://github.com/mvanhorn/last30days-skill) for recent social/web signal; [`deep-research`](https://github.com/199-biotechnologies/claude-deep-research-skill) for claim verification. The bundled installer pulls both.

## When to use / when NOT to

- **USE** for: expensive purchase, architecture or vendor lock-in, strategy fork, "which of these options" — anything **costly to get wrong or hard to reverse**.
- **DO NOT** use for: reversible, cheap, or low-stakes choices. The council is deliberately heavyweight.

## The research model

Each lens should argue from **its own evidence**, not vibes. Token discipline:

1. **Scout** (one sub-agent) runs **`/last30days`** on the topic when recency/social signal matters, plus a lean baseline: option list, current/street prices or equivalents, headline specs, single deciding metric. Output ≤ ~600 words, URL per number. No opinion.
2. **Advocate + Skeptic** (parallel sub-agents) each get the frame + Scout baseline. They do **≤5 lens-specific web searches** for NEW evidence the baseline lacks — not re-confirming prices/specs already in the brief.
3. **Fact Checker** (one sub-agent) runs **`/deep-research`** in **Quick** mode on the contested claims both personas listed. Neutral verification: VERIFIED / PARTLY / FALSE / UNVERIFIABLE + cited source.
4. **Orchestrator** synthesizes inline as Neutral + Pragmatist + chairman — no extra agent.

**Do not** load `/last30days` or `/deep-research` inside Advocate/Skeptic — those personas stay capped and search-light. Skills belong on Scout and Fact Checker only.

## Token discipline (mandatory)

1. **Baseline once, angles many.** Scout establishes shared facts; personas research only their angle on top.
2. **Cap every sub-agent.** Scout ≤ ~600 words; each persona ≤ ~700 words; Fact Checker ≤ ~700 words. Cite URLs. No preamble.
3. **One round by default.** Personas must **pre-empt the opposing side's strongest point** in a single response. Rebuttal round ONLY for unresolved factual conflict — continue **1–2 agents max**, never the whole council.
4. **Orchestrator absorbs Neutral + Pragmatist + chairman** in lite mode — no extra cold agents.
5. **Parallelize.** Spawn each wave's sub-agents in **one message** (multiple Task/Agent calls). Don't re-read full transcripts after completion — use their summaries.
6. **Gather local context once.** Read PRD/repo/files yourself once; distil constraints into the Step-0 frame pasted into every prompt.

## Sub-agent spawning

| Host | Tool | Notes |
|------|------|-------|
| Claude Code | `Agent` | Sonnet for Scout/personas/Fact Checker; orchestrator stays Opus if available |
| Cursor | `Task` | `subagent_type: generalPurpose` or `explore`; `run_in_background: false` for council waves |

Give each sub-agent: Step-0 frame, prior wave output (not full chat history), role instructions, output cap, and "return ranked top-N + list of factual claims for Fact Checker."

## Modes

- **`/council` (default = LITE):** Scout (`/last30days` + baseline) → Advocate + Skeptic (parallel) → Fact Checker (`/deep-research` Quick) → orchestrator synthesizes. ~4 sub-agents, one round.
- **`/council full`:** Scout baseline → 5 personas (Optimist, Pessimist, Neutral Analyst, Pragmatist, plus parallel Fact Checker pass) → rebuttal on contested points only → synthesis. ~2–3× lite tokens. Use only for genuinely high-stakes contested decisions.

---

## Procedure — LITE (default)

**Step 0 — Frame (orchestrator, inline).** Read local context once. State in ≤6 bullets: decision, candidate options, hard constraints, single deciding metric. Paste this block into every sub-agent prompt.

**Step 1 — Scout (1 sub-agent).** Invoke **`/last30days <topic>`** when the decision depends on what people are saying *right now* (products, vendors, trends, reputations). Distil into baseline: per-option price/spec/status, one-line note each, conflicts as ranges. ≤ ~600 words, URL per number, no opinion.

**Step 2 — Advocate + Skeptic (2 sub-agents, parallel, one message).** Each gets Step-0 + Scout baseline; **≤5 lens-specific searches** for NEW evidence:
- **Advocate:** strongest case for top 1–2 contenders — upside, trajectory. Name what would make its pick wrong; pre-empt Skeptic.
- **Skeptic:** adversarial downside — risks, hidden costs, reliability traps. Name least-bad option; pre-empt Advocate.

Both: ≤ ~700 words, cite URLs, end with ranked top-N + **specific factual claims** for Fact Checker.

**Step 3 — Fact Checker (1 sub-agent).** Invoke **`/deep-research`** Quick on the claim list. Verify each (VERIFIED / PARTLY / FALSE / UNVERIFIABLE), flag hallucinations, correct overstatements. ≤ ~700 words.

**Step 4 — Synthesize (orchestrator, inline).** Fold in Fact Checker corrections. At most one targeted follow-up if a decisive number is still contested. Deliver:
- **ranked list, #1 clearly marked**, one deciding trade-off per option
- **strongest preserved dissent**
- **"the condition that would change the answer"**
- plain recommendation; if constraints are unsatisfiable, say so

## Procedure — FULL (explicit request only)

Same Step 0 + Scout baseline. Then:
- **Round 1 (5 agents, parallel):** Optimist, Pessimist, Neutral Analyst, Pragmatist — each capped lens-specific research on baseline; Fact Checker verifies strongest claims across all.
- **Orchestrator surfaces real tensions** (factual disagreements only).
- **Round 2 (rebuttal, contested agents only):** opposing claims answered; Fact Checker resolves decisive numbers.
- **Synthesis:** final ranked list, #1 marked, dissent preserved, condition-that-would-change-it.

## Output contract (both modes)

Ranked list with **#1 unambiguous**; each entry one deciding line; main dissent visible; condition that would flip the verdict; honest "no option satisfies all constraints" when true. Chairman tone: decisive, evidence-bound, no hype, no doom.

## Triggers

`council this`, `/council`, `run the council`, `pressure-test this`, `stress-test this`, `war room this`, `debate this`

## Credits

- Methodology: [Andrej Karpathy — LLM Council](https://github.com/karpathy/llm-council)
- Research companions: [last30days](https://github.com/mvanhorn/last30days-skill), [deep-research](https://github.com/199-biotechnologies/claude-deep-research-skill)
- Token-efficient sub-agent pattern: Endokelp / CodingBrain (JARVIS brain-selection council, 2026-06)
