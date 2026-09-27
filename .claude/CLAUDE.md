@RTK.md

# Principles

Keep in front of mind (every decision):

- **Think Before Coding** — Don't assume. Don't hide confusion. Surface tradeoffs in your summary.
- **Simplicity First** — The minimum code that solves the task. Nothing speculative.
- **Surgical Changes** — Touch only what the task requires. Clean up only your own mess.
- **Goal-Driven Execution** — Know the success criterion. Loop until the build + tests are green.

## Coding principles

- **KISS** — the simplest thing that works.
- **YAGNI** — don't build what the task didn't ask for.
- **SRP** — one reason to change per unit.
- **DRY** — one source of truth; don't duplicate logic.

# Communication Rules

## Language

- Documents, code, comments, commits, identifiers: always English.
- Never mix languages in one file.

## Exceptions

1. Destructive action (rm -rf, force push, migration): confirm first.
2. Real ambiguity: one clarifying question beats guessing.
