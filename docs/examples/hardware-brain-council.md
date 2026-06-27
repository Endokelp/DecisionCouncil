# Example: Local AI brain under $5k (anonymized)

Real council output shape from a JARVIS hardware selection run (2026-06). Numbers verified by Fact Checker where noted.

---

## Council: Best local "AI brain" box for tiered Ollama stack

**Constraints:** fast 3 to 8B / normal ~30B / deep 70B+; quiet 24/7 desk box; budget under $5,000.

### Ranked

1. **Mac Studio M4 Max 128GB (~$3,699)** — WINNER  
   546 GB/s bandwidth; verified dense-70B Q4 ~20 to 25 tok/s; holds two 30B models; silent; under budget with margin.  
   Trade-off: deep tier is swap-on-demand, not resident parallel 70B.

2. **DGX Spark 128GB ($3,999 to 4,699)**  
   CUDA ecosystem + fine-tuning edge.  
   Trade-off: dense 70B ~5.39 tok/s (Fact Checker: VERIFIED from public benchmark); thermal shutdown reports unresolved.

3. **Dual used RTX 3090 (48GB, ~$3k built)**  
   Best raw tok/s per dollar.  
   Trade-off: loud, hot, ~1000W, DIY. Wrong for quiet 24/7 room box.

4. **Strix Halo / Framework Desktop 128GB**  
   Cheaper on paper.  
   Trade-off: real 128GB SKU ~$3,149+ and often out of stock; ROCm immaturity for 24/7 brain.

5. **RTX 5090 (32GB, ~$4,300)** — eliminated  
   Cannot hold a 70B at all.

### Strongest dissent

Skeptic: if frontier fine-tuning and CUDA-first experimentation become primary (not 20% side work), DGX Spark re-enters as #1 despite decode speed.

### Condition that would change the answer

Verified firmware lifts Spark dense-70B decode materially above ~15 tok/s **and** fixes sustained thermal shutdowns under load.
