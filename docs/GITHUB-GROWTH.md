# GitHub Growth Playbook for DecisionCouncil

Evidence-based tactics for growing **Endokelp/DecisionCouncil**, a token-efficient multi-agent decision skill for Claude Code and Cursor. Research synced **2026-06-27** via [last30days v3.8.1](https://github.com/mvanhorn/last30days-skill) (HN, GitHub, Reddit) plus targeted web research.

---

## Executive summary

Skill repos that spike in 2026 share a pattern: **one-command install**, **immediate demo value**, **distribution across skills.sh + Reddit + X**, and a **sharp hook** (token savings, research quality, or a famous upstream concept). DecisionCouncil already has the right ingredients (Karpathy lineage, companion skills, Cursor + Claude Code). The gap is **discoverability packaging** and a **coordinated 7-day launch**, not more features.

Realistic 30-day targets for a well-executed launch (no celebrity founder):

| Channel | Conservative | Strong launch |
|---------|-------------|---------------|
| GitHub stars | 150–400 | 500–1,500 |
| skills.sh installs | 50–200 | 500+ |
| HN Show HN (if front page) | +100–300 stars in 7d | +500–2,000 stars |

Sources: [arXiv 2511.04453 analysis via agent-airlock playbook](https://github.com/sattyamjjain/agent-airlock/blob/main/LAUNCH_PLAYBOOK_2026.md), [DEV Show HN guide](https://dev.to/iris1031/how-to-launch-on-hacker-news-the-show-hn-guide-real-data-461e), [Causo Show HN playbook](https://hub.causo.ai/guides/show-hn-launch-playbook-technical-founders-2026).

---

## What worked recently (with sources)

### 1. skills.sh + `npx skills add` is the default distribution rail

Vercel launched the open skills ecosystem in January 2026. **skills.sh** is a public directory and install leaderboard; the CLI tracks usage via install telemetry.

- No manual “submit” form — publish a public GitHub repo with valid `SKILL.md` frontmatter, then installs via `npx skills add owner/repo` populate the registry.
- Leaderboard ranking is driven by **install counts**, not stars alone.
- Best practice from active repos: add a **skills.sh badge** and copy-paste install block to every README ([Varnan-Tech/opendirectory PR #44](https://github.com/Varnan-Tech/opendirectory/pull/44)).

Sources:
- [Vercel changelog: Introducing skills](https://vercel.com/changelog/introducing-skills-the-open-agent-skills-ecosystem)
- [skills CLI quickstart](https://vercel-labs-skills.mintlify.app/quickstart)
- [Creating skills guide](https://vercel-labs-skills.mintlify.app/guides/creating-skills)
- [skills.sh overview (webvise)](https://webvise.io/blog/ai-agent-skills-directory)

### 2. Multi-surface install beats GitHub-only

**mvanhorn/last30days-skill** (~47K stars as of June 2026) grew by meeting users where they already are:

| Surface | Install path |
|---------|--------------|
| Claude Code marketplace | `/plugin marketplace add mvanhorn/last30days-skill` |
| Universal agents | `npx skills add mvanhorn/last30days-skill -g` |
| OpenClaw | `clawhub install last30days-official` |
| Claude Desktop | `.mcpb` bundle from releases |

Key tactics from their README:
- **Zero-config free tier** works on first run (Reddit/HN/GitHub without API keys).
- README opens with a **one-liner value prop** and install commands above the fold.
- GitHub **topics** tag the repo (`claude-code`, `ai-skill`, `deep-research`, etc.).
- Creator amplification on X (e.g. trending GitHub Claude tools lists).

Source: [last30days-skill README](https://github.com/mvanhorn/last30days-skill)

### 3. Token efficiency is a viral hook in r/claudeskills

A June 2026 r/claudeskills thread on **Headroom** (token usage cut 60–95%) hit **2,600+ upvotes**. Creator disclosed authorship; community rewarded a **concrete, measurable benefit** after months of modest traction, then sudden spike when timing aligned with broader Claude discourse.

Lesson for DecisionCouncil: lead with **“Lite council = Scout → Advocate + Skeptic → Fact Checker”** and explicit **when NOT to use** (saves tokens vs always-on multi-agent). Pair with a before/after token estimate.

Source: [r/claudeskills Headroom thread](https://www.reddit.com/r/claudeskills/comments/1u2fmb2/) (via last30days, June 2026)

### 4. Single-purpose skills win on economics

A June 2026 r/AIAgentsInAction ranking thread noted: skills only load when triggers fire, so **fat skill folders cost nothing per turn** — users prefer **focused skills** over monolithic “do everything” packs. OpenSpec (~55K stars) topped lists as a narrow, high-utility spec.

Lesson: DecisionCouncil should stay **decision-only**; do not bloat into general research or coding.

Source: [r/AIAgentsInAction top skill repos](https://www.reddit.com/r/AIAgentsInAction/comments/1u7fu10/) (via last30days, June 2026)

### 5. Show HN still moves OSS dev tools — if you show, don’t sell

2026 playbooks converge on:

- **When:** Tuesday–Thursday, **8–10 AM US Eastern** (12:00–17:00 UTC). Avoid Monday morning backlog and Friday afternoon.
- **Title:** `Show HN: [Name] – [what it does]` — no superlatives, no exclamation marks.
- **Link:** Live GitHub repo or a short demo post — not a waitlist.
- **First comment (within 15 min):** personal problem, technical trade-off, honest limitations, one specific question.
- **Engagement:** Reply to every comment for **2–4 hours**; this is the biggest front-page determinant.
- **Outcomes:** Front-page Show HN → roughly **500–2,000 GitHub stars** for OSS tools; arXiv study cites **+121 stars / 24h**, **+289 / 7d** median for front-page exposure.

Sources:
- [Causo Show HN playbook 2026](https://hub.causo.ai/guides/show-hn-launch-playbook-technical-founders-2026)
- [Okara Show HN front page guide](https://okara.ai/blog/show-hn-front-page)
- [DEV Show HN real data](https://dev.to/iris1031/how-to-launch-on-hacker-news-the-show-hn-guide-real-data-461e)
- [agent-airlock LAUNCH_PLAYBOOK_2026](https://github.com/sattyamjjain/agent-airlock/blob/main/LAUNCH_PLAYBOOK_2026.md)

### 6. Riding a famous upstream concept helps — if you differentiate clearly

**karpathy/llm-council** (~21K stars) exploded because:
- Karpathy’s audience + novel “multi-model debate” primitive.
- Positioned as a **weekend hack**, not a product — low friction to star.
- X/LinkedIn amplification framed it as “agentic AI in disguise.”

**aiwithremy/claude-skills-llm-council** (~814 stars) succeeded in the **skill** niche via:
- Beginner-friendly README (non-dev install paths).
- Creator distribution (Ole Lehmann / @itsolelehmann).
- Business-oriented example questions.

DecisionCouncil should **credit both** and win on **implementation differences** (see comparison below).

Sources:
- [karpathy/llm-council](https://github.com/karpathy/llm-council)
- [aiwithremy/claude-skills-llm-council](https://github.com/aiwithremy/claude-skills-llm-council)

### 7. Directory listings compound over weeks

Beyond skills.sh, list on:
- [awesomeclaude.ai/awesome-claude-skills](https://awesomeclaude.ai/awesome-claude-skills) (169+ skills, updated June 2026)
- [agentskills.io specification](https://agentskills.io/specification) — ensure frontmatter compliance
- Claude Code docs skill discovery paths ([code.claude.com/docs/en/skills](https://code.claude.com/docs/en/skills))

Plugin marketplaces bundle skills for distribution ([pleaseai/claude-code-plugins](https://github.com/pleaseai/claude-code-plugins) adds skills via `bunx skills add` pattern).

### 8. Meta-demo content outperforms feature lists

Show HN posts with **364+ points** in June 2026 (e.g. OpenKnowledge) succeeded by being **immediately tryable** with a clear “what changed in my workflow” story.

For DecisionCouncil: record **one real decision** (e.g. “Mac Studio vs cloud GPU for local 70B”) and publish the council output — ranked verdict, dissent, “condition that would change the answer.”

Source: [Show HN: OpenKnowledge](https://news.ycombinator.com/item?id=48692474) (via last30days, June 2026)

---

## Competitive positioning

Use this table in README and launch posts. Be factual, not dismissive.

| | [affaan-m/council](https://skills.sh/affaan-m/everything-claude-code/council) | [karpathy/llm-council](https://github.com/karpathy/llm-council) | [aiwithremy/claude-skills-llm-council](https://github.com/aiwithremy/claude-skills-llm-council) | **DecisionCouncil** |
|---|-----|-----|-----|-----|
| **Distribution** | Inside 222K star ECC pack; 3.7K+ skills.sh installs | Standalone app | Standalone skill | Standalone skill |
| **Research** | None built-in | None | None | **last30days** + **deep-research** |
| **Verification** | None | None | Peer review | **Fact Checker** |
| **Output** | Verdict + dissent | Chairman | Chairman | **Ranked #1** + falsifier |
| **Cursor** | ECC / Claude Code | N/A | Claude only | **Yes** |
| **Best for** | Fast ambiguous tradeoffs | Multi-model compare | Business decisions | **Evidence-bound, high-stakes** |

**What affaan-m teaches us:** bundle distribution works. ECC council got 3.7K installs because the parent repo is everywhere. DecisionCouncil wins as a focused standalone: research layer, ranked output, Cursor-native. Credit ECC in README; differentiate on evidence, not vibes.

**Positioning sentence (use everywhere):**

> Karpathy's council compares models. aiwithremy's council convenes five advisors. affaan-m's council surfaces tradeoffs inside ECC. DecisionCouncil is the evidence-bound council for Cursor and Claude Code: Scout pulls last30days signal, Fact Checker verifies claims, Skeptic keeps dissent visible.

---

## README hooks to add before launch

Current README is solid technically. Add these **above the fold**:

### 1. skills.sh install block (required)

```markdown
[![skills.sh](https://img.shields.io/badge/skills.sh-council-blue)](https://skills.sh)

## Install (one command)

```bash
npx skills add Endokelp/DecisionCouncil --skill council -g -y
```

Also installs companion skills via `install.sh` / `install.ps1`:
`last30days` + `deep-research`
```

### 2. 10-second demo

One fenced example: user prompt → council output skeleton (ranked options, dissent quote, “condition that would change the answer”). Real output from dogfooding beats marketing copy.

### 3. GIF or terminal recording

30–60s ascinema or GIF: `/council Which vendor for 3-year lock-in?` → parallel sub-agents → verdict. Host on GitHub README or link to YouTube/X.

### 4. “When NOT to use” (token hook)

Prominent callout — mirrors aiwithremy’s good/bad questions but adds **token discipline** as the differentiator.

### 5. Star CTA

After demo: `If this saved you from a bad $5k decision, star the repo so others find it.`

### 6. GitHub topics

Add: `claude-code`, `cursor`, `ai-skill`, `agent-skills`, `multi-agent`, `llm-council`, `decision-making`, `skills-sh`

---

## skills.sh listing checklist

1. **Validate skill spec** — `name` + `description` in frontmatter per [agentskills.io](https://agentskills.io/specification). DecisionCouncil already uses `skills/council/SKILL.md` (valid discovery path).
2. **Test install locally:**
   ```bash
   npx skills add Endokelp/DecisionCouncil --skill council --list
   npx skills add Endokelp/DecisionCouncil --skill council -g -y
   npx skills list -g
   ```
3. **Seed installs** — ask 10–20 real users to run the install command (telemetry drives leaderboard).
4. **Search discoverability** — description should include trigger phrases: `council this`, `/council`, `pressure-test`, `war room`, `high-stakes decision`.
5. **Cross-link** — link skills.sh listing from README once indexed (search `npx skills find council`).

---

## Launch content templates

### X / LinkedIn thread (5 posts)

1. **Hook:** “I got tired of trusting the first Claude answer on $5k decisions. So I packaged Karpathy’s council as a skill.”
2. **Problem:** Single-agent optimism bias; no dissent; no citations.
3. **Demo:** Screenshot of Lite council output on a real question (blur sensitive details).
4. **Differentiator:** last30days Scout + Fact Checker; Lite vs Full token table.
5. **CTA:** Install one-liner + GitHub link. Ask: “What decision would you council first?”

Tag: @karpathy (once, respectfully — don’t spam), Claude Code community accounts, skills ecosystem builders.

### Reddit posts (stagger 48h apart, disclose creator)

| Subreddit | Angle | Example title |
|-----------|-------|---------------|
| [r/ClaudeAI](https://reddit.com/r/ClaudeAI) | Decision quality | “I built a skill that runs Advocate vs Skeptic before big calls — here's a real output” |
| [r/claudeskills](https://reddit.com/r/claudeskills) | Token discipline | “Lite multi-agent council: when to use / when to skip (token-aware)” |
| [r/ClaudeCode](https://reddit.com/r/ClaudeCode) | Install path | “npx skills add DecisionCouncil — Karpathy-style council with last30days Scout” |
| [r/Cursor](https://reddit.com/r/Cursor) | Cursor-native | “Council skill for Cursor Task sub-agents — pressure-test vendor decisions” |
| [r/AIAgentsInAction](https://reddit.com/r/AIAgentsInAction) | Architecture | “Sub-agent council pattern: Scout → parallel debate → Fact Checker → chairman” |

**Rules:** One subreddit per day. Post **demo output**, not just repo link. Reply to every comment for 24h. Say you’re the author.

### Show HN submission

**Title (pick one):**

- `Show HN: Council – multi-agent decision skill for Claude Code and Cursor`
- `Show HN: Council – token-efficient Karpathy-style debate as an agent skill`

**URL:** `https://github.com/Endokelp/DecisionCouncil`

**First comment (draft):**

> I built this because I kept making expensive one-shot Claude calls on vendor lock-in and hardware purchases — one confident answer, no structured dissent.
>
> Council runs a Lite pipeline by default: Scout (pulls recent signal via last30days), Advocate + Skeptic in parallel, Fact Checker (deep-research Quick mode), then chairman synthesis with ranked options and explicit dissent.
>
> Technical choices: sub-agents via Task/Agent tool (not a separate app like karpathy/llm-council); `disable-model-invocation: true` so it only runs when you explicitly invoke it; companion skills installed once.
>
> Limitations: needs last30days + deep-research for full value; Full mode is ~2–3× tokens; not for trivia or cheap reversible choices.
>
> I'd love feedback: is Lite the right default, and what decisions do you wish you'd run through a council last month?

**Timing:** Tuesday or Wednesday, 8:30 AM ET. Block 4 hours for comments.

Optional: publish a short `docs/launch-post.md` on GitHub Pages or a gist as the HN link (agent-airlock pattern) — only if README feels too long for first-click evaluation.

### Demo video (60–90s script)

1. (0–10s) Problem: “One AI answer on a $5k decision.”
2. (10–25s) Install: `npx skills add Endokelp/DecisionCouncil --skill council -g -y`
3. (25–50s) Run: `council this: Mac Studio vs DGX Spark under $5k`
4. (50–70s) Highlight: ranked #1, Skeptic dissent, Fact Checker flag.
5. (70–90s) CTA: GitHub star + “Lite vs Full” when to use.

Publish to YouTube/X; embed thumbnail in README.

---

## 7-day launch checklist

### Day -2 to -1 (prep)

- [ ] Add skills.sh badge + `npx skills add` block to README
- [ ] Add comparison table (this doc → README “Credits” section)
- [ ] Record demo GIF/video; add to README
- [ ] Dogfood: run council on “How should we launch DecisionCouncil?” — save output as `docs/examples/launch-decision.md`
- [ ] Validate install on clean machine (Windows PowerShell + macOS bash)
- [ ] Add GitHub topics
- [ ] Write Show HN first comment; prep 5 Reddit post drafts
- [ ] PR to [awesome-claude-skills](https://awesomeclaude.ai/awesome-claude-skills) or open issue with skill entry

### Day 1 (soft launch)

- [ ] Merge README improvements; tag `v0.1.0` release
- [ ] Post X/LinkedIn thread with demo
- [ ] Ask 10 friends to run `npx skills add Endokelp/DecisionCouncil --skill council -g -y` (skills.sh telemetry)
- [ ] Post r/claudeskills (token angle) — disclose creator

### Day 2

- [ ] Post r/ClaudeAI or r/ClaudeCode (demo output post)
- [ ] Engage on any X replies; quote-tweet with dissent slide from demo

### Day 3 (Show HN)

- [ ] Submit Show HN (Tue/Wed 8–10 AM ET)
- [ ] Post first comment within 15 minutes
- [ ] Monitor + reply 4 hours
- [ ] Do **not** post Reddit same day as HN

### Day 4

- [ ] Post r/Cursor (Cursor Task sub-agent angle)
- [ ] Thank HN commenters; open GitHub Discussion “FAQ from launch”

### Day 5

- [ ] Post r/AIAgentsInAction (architecture angle)
- [ ] Short follow-up X post: “Best HN question was X — here's the answer”

### Day 6

- [ ] Publish `docs/examples/` with 2–3 anonymized council outputs
- [ ] Issue “good first issue” for docs/translations (lower barrier contributions)

### Day 7 (retrospective)

- [ ] Check skills.sh install rank (`npx skills find council`)
- [ ] Note star velocity; write `docs/LAUNCH-RETRO.md` (what worked, what didn’t)
- [ ] Plan week-2: plugin marketplace submission, guest post, or podcast pitch if >200 stars

---

## What NOT to do

| Don't | Why |
|-------|-----|
| **Upvote rings / “please upvote my HN post”** | HN ring detection flags posts; account penalties. Sources: [Okara](https://okara.ai/blog/show-hn-front-page), [Causo](https://hub.causo.ai/guides/show-hn-launch-playbook-technical-founders-2026) |
| **Astroturf Reddit** | Multiple accounts, copy-paste promo → bans; community spots it instantly |
| **Spam 5 subreddits same day** | Mod removal; looks desperate. Stagger 48h, tailor angle |
| **Buy GitHub stars** | Obvious velocity spikes; destroys trust; GitHub may flag |
| **Hype titles** (“revolutionary”, “game-changing”) | HN moderators rewrite; reflexive downvotes |
| **Launch without install test** | Broken `npx skills add` → permanent bad first impression on skills.sh |
| **Bloat the skill** | Community prefers single-purpose skills; loading cost is psychological even if triggers are gated |
| **Attack competitors** | Compare on facts (table above); never dunk on aiwithremy or Karpathy |
| **Fake “organic discovery” posts** | Disclose authorship; Reddit rewards honesty (Headroom creator disclosure got 154↑ on transparency comment) |
| **Resubmit Show HN within 6 months** | One shot per project narrative; fix README and try a different channel instead |

---

## Metrics to track

| Metric | Tool | Week-1 goal |
|--------|------|-------------|
| GitHub stars | GitHub Insights | 200+ |
| skills.sh installs | skills.sh listing | 100+ |
| Clone / fork count | GitHub | 20+ forks |
| HN points | news.ycombinator.com | 50+ (100+ = strong) |
| Reddit post score | Reddit | 50+ combined |
| Issues / “how do I install” | GitHub Issues | Triage <24h |

---

## Longer-term growth (weeks 2–12)

1. **Claude Code plugin marketplace** — follow last30days pattern: `.claude-plugin/marketplace.json` + `/plugin marketplace add Endokelp/DecisionCouncil`
2. **Bundle with last30days** — co-marketing with mvanhorn ecosystem (“research then council” workflow post)
3. **Case studies** — “Council saved $X on vendor Y” with permission
4. **Conference / newsletter** — pitch to Claude Code newsletters, AI agent YouTubers
5. **Integrate find-skills** — ensure `npx skills find decision` or `council` surfaces your skill (description SEO)

---

## Research methodology

Queries run via last30days v3.8.1 on 2026-06-27:

- `how to make github repo popular open source skill`
- `github repo marketing open source launch`
- `claude code skills viral skills.sh`
- `agent skills github stars last30days`

Supplemented with web research on Show HN playbooks, skills.sh docs, karpathy/llm-council, aiwithremy/claude-skills-llm-council, and last30days-skill distribution patterns.

**Gaps:** X/Twitter and YouTube signals were unavailable in last30days run (no browser cookies / yt-dlp). Re-run with X logged in for influencer thread discovery.

---

## Quick reference: install commands to promote

```bash
# Universal (skills.sh ecosystem)
npx skills add Endokelp/DecisionCouncil --skill council -g -y

# Companion skills (if not using install.sh)
npx skills add mvanhorn/last30days-skill -g -y
npx skills add 199-biotechnologies/claude-deep-research-skill --skill deep-research -g -y

# Windows one-liner
git clone https://github.com/Endokelp/DecisionCouncil.git $env:TEMP\DecisionCouncil; & "$env:TEMP\DecisionCouncil\install.ps1"

# macOS / Linux
git clone https://github.com/Endokelp/DecisionCouncil.git /tmp/DecisionCouncil && /tmp/DecisionCouncil/install.sh
```
