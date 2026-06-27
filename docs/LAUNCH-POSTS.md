# Launch posts (copy-paste ready)

Repo: https://github.com/Endokelp/DecisionCouncil  
skills.sh: https://skills.sh/Endokelp/DecisionCouncil/council

Install:
```bash
npx skills add Endokelp/DecisionCouncil --skill council -g -y
```

---

## Show HN (Tuesday or Wednesday, 8 to 10 AM US Eastern)

**Title:**
```
Show HN: DecisionCouncil – evidence-bound multi-agent council for Cursor/Claude Code
```

**URL:** https://github.com/Endokelp/DecisionCouncil

**First comment (post within 15 minutes):**

I kept making expensive one-shot Claude calls on vendor lock-in and hardware purchases. One confident answer, no structured dissent, no verified numbers.

DecisionCouncil is a skill (not a separate app) that runs a Lite pipeline by default:

1. Scout pulls recent signal via last30days
2. Advocate and Skeptic argue in parallel on top of a shared baseline (no re-googling the same specs)
3. Fact Checker verifies contested claims via deep-research Quick mode
4. Chairman synthesis: ranked options, #1 marked, dissent preserved, plus the condition that would flip the verdict

Different from affaan-m's ECC council (fast tradeoffs inside a mega skill pack) and Karpathy's llm-council (multi-model web app). This one is standalone, Cursor-native, and built for decisions where wrong numbers cost real money.

Install: `npx skills add Endokelp/DecisionCouncil --skill council -g -y`

Limitations: needs last30days + deep-research companions for full value; Full mode is ~2 to 3x tokens; not for trivia or code review.

What decision would you run through a council if you had this installed last month?

---

## Reddit r/ClaudeCode (disclose: I built this)

**Title:** I packaged a token-efficient Karpathy-style council as a skill with last30days Scout + Fact Checker

**Body:**

Most council skills give you opinions. I wanted ranked output with verified claims for expensive decisions (hardware, vendor lock-in, architecture forks).

**DecisionCouncil** runs ~4 sub-agents in Lite mode:
- Scout (last30days for recent signal)
- Advocate + Skeptic in parallel
- Fact Checker (deep-research Quick on contested numbers)
- Chairman synthesis inline with #1 marked + dissent

Works in Claude Code (`/council`) and Cursor (`council this:`).

```bash
npx skills add Endokelp/DecisionCouncil --skill council -g -y
```

Example output shape in the repo: `docs/examples/hardware-brain-council.md`

Compared to affaan-m's council inside everything-claude-code: theirs is great for fast ambiguous tradeoffs inside ECC. Mine adds research companions and claim verification for high-stakes forks.

GitHub: https://github.com/Endokelp/DecisionCouncil

Happy to answer install questions.

---

## Reddit r/Cursor (48h after r/ClaudeCode)

**Title:** Council skill for Cursor Task sub-agents: pressure-test big decisions before you commit

**Body:**

If you use Cursor for architecture or vendor calls, this skill spawns parallel `Task` sub-agents (Scout → Advocate/Skeptic → Fact Checker) and returns a ranked verdict with dissent.

Install globally:
```bash
npx skills add Endokelp/DecisionCouncil --skill council -g -y
```

Invoke: `council this: <your question>`

Repo: https://github.com/Endokelp/DecisionCouncil

(I'm the author. Built it after a real hardware council run that saved me from a bad $4k box.)

---

## X / LinkedIn thread

**Post 1:** I got tired of trusting the first Claude answer on $5k decisions. So I packaged a council as a skill.

**Post 2:** Lite mode by default (~4 sub-agents). Scout uses last30days. Fact Checker verifies claims. You get #1 marked, dissent preserved, and the one condition that would flip the call.

**Post 3:** Different from affaan-m's ECC council (fast tradeoffs) and Karpathy's multi-model app. Standalone, Cursor + Claude Code.

**Post 4:** `npx skills add Endokelp/DecisionCouncil --skill council -g -y`

**Post 5:** GitHub: https://github.com/Endokelp/DecisionCouncil — what would you council first?
