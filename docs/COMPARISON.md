# How DecisionCouncil differs from every other council

This is not a dunk post. Each project solves a different job. Pick the one that matches yours.

---

## affaan-m / everything-claude-code / council

**skills.sh:** [affaan-m/everything-claude-code/council](https://skills.sh/affaan-m/everything-claude-code/council) (~3.7K installs)

**What it does well:**
- Ships inside a massive skill pack (222K+ GitHub stars on the parent repo). Distribution is the product.
- Four voices: in-session Architect, plus Skeptic, Pragmatist, and Critic as fresh sub-agents.
- Strict anti-anchoring: sub-agents get the question and compact context, not the full chat.
- Clear **when to use / when not** routing (council vs planner vs architect vs code-reviewer).
- Scannable verdict format. One round by default.

**What it does not optimize for:**
- External research (no last30days, no deep-research, no Fact Checker pass).
- Ranked shortlists with a marked #1 and explicit falsifier.
- Token-capped Scout baseline (personas may re-derive the same facts).
- Standalone repo focused only on high-stakes evidence decisions.

**Choose affaan-m when:** you already use ECC, you want fast tradeoff surfacing on ambiguous product/engineering calls, and you trust your own context.

**Choose DecisionCouncil when:** the decision has money attached, you need recent web/social signal, and you want claims verified before you commit.

---

## karpathy / llm-council

**GitHub:** ~21K stars. Local web app. Multiple models via OpenRouter.

**Choose Karpathy when:** you want to compare how different models debate the same question.

**Choose DecisionCouncil when:** you want one agent session, sub-agents, and a skill install. No OpenRouter setup.

---

## aiwithremy / claude-skills-llm-council

**GitHub:** ~800+ stars. Five advisors, peer review, chairman synthesis.

**Choose aiwithremy when:** you want a polished business-oriented council inside Claude only.

**Choose DecisionCouncil when:** you use Cursor too, you want Lite mode by default, and you want Scout + Fact Checker research passes.

---

## Side-by-side

| Dimension | affaan-m | Karpathy | aiwithremy | DecisionCouncil |
|-----------|----------|----------|------------|-----------------|
| Install | `npx skills add affaan-m/everything-claude-code --skill council` | Clone + OpenRouter | Copy SKILL.md | `npx skills add Endokelp/DecisionCouncil --skill council` |
| Sub-agents | 3 external | N/A (multi-model) | 5 | 3 to 5 (Lite vs Full) |
| Research layer | None | None | None | last30days + deep-research |
| Verification | None | None | Peer review | Fact Checker (VERIFIED / FALSE / etc.) |
| Output | Verdict + dissent | Chairman | Chairman | Ranked #1 + dissent + falsifier |
| Cursor | Via ECC | No | No | Yes |

---

## Positioning line (use in posts)

**affaan-m** surfaces tradeoffs quickly inside a skill ecosystem you may already run.

**DecisionCouncil** is the standalone council for decisions where wrong numbers cost real money.
