# Self-Improvement

This repository now has the first working self-improvement loop for the Ollama fast router.

## Current behavior

When the Ollama fast router automatically chooses the `bash` path, Claw appends a JSONL record to:

```text
.claw/self-improvement/router-traces.jsonl
```

Each record captures:

- prompt
- chosen route
- synthesized command
- duration
- success
- output preview
- model

Promoted learned rules are stored in:

```text
.claw/self-improvement/router-rules.json
```

The latest offline training report is stored in:

```text
.claw/self-improvement/router-training-report.json
```

Run the trainer with:

```bash
./target/release/claw self-improve router
```

## Why this is the right starting point

Research-backed self-improvement systems usually do not start by changing model weights online. They start with:

1. Trace collection
2. Automated evaluation
3. Reflection or optimization over traces
4. Gated rollout of changes

That pattern fits this codebase much better than direct recursive self-editing.

## Recommended roadmap

1. Expand the replay/eval set beyond router traces
2. Add automatic graders for:
   - latency
   - correctness
   - unnecessary tool count
   - route choice quality
3. Improve offline optimization:
   - prompt optimization for ambiguous cases
   - optional learned classifier for route selection
   - route-family confidence scoring
4. Expand beyond routing:
   - tool selection policy
   - response formatting policy
   - retry strategy
   - prompt compression policy

## Practical target

The best near-term self-improving system for this repo is:

- deterministic telemetry
- offline evaluators
- automatic rule/prompt proposals
- human-reviewed promotion

That gives most of the benefit of self-improvement without the instability of unrestricted self-editing.
