# data/restricted/ — read-denied

This folder is where restricted or confidential inputs would live (e.g. firm-
level microdata, licensed datasets). **The agent is denied read access to it**
by `.claude/settings.json`:

```json
"deny": ["Read(data/restricted/**)"]
```

The pattern is: the agent edits code and reads *aggregated* outputs, while the
sensitive raw files it never sees. The whole `data/restricted/` tree is
git-ignored so nothing here is ever committed.

Nothing in this template actually uses restricted data — the analysis is built
entirely from public Eurostat aggregates.
