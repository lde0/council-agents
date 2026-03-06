# Council Agents

Agent directory for AI council systems. Each agent has a persona, expertise, and model configuration that persists across councils.

## Structure

```
agents/
  {agent-name}/
    AGENT.md       # Persona, expertise, voice, instructions
    config.json    # Model, affinity, metadata
councils/
  {council-name}/
    COUNCIL.md     # Roster, channel mapping, rules
```

## Agents

| Agent | Name | Role |
|-------|------|------|
| `orchestrator` | — | Manages discourse flow, eagerness scoring, sequencing |
| `systems-architect` | Kael | Systems design, mechanics, emergence |
| `player-advocate` | Mira | Player experience, UX, accessibility |
| `narrative-weaver` | Sable | Narrative design, worldbuilding, theme |
| `devils-advocate` | Rook | Critical analysis, stress-testing, failure modes |

## How It Works

1. A topic is posted in a council's forum channel
2. The orchestrator calculates **eagerness scores** for each agent based on persona fit and topic content
3. Agents respond in eagerness order, with suppression to prevent domination
4. Agents below an eagerness threshold stay silent unless explicitly called upon
5. Termination conditions prevent infinite loops

## Memory

Agent memory (`MEMORY.md`) lives in the workspace, not this repo. Memory evolves through participation and is maintained per-agent across all councils they belong to.

## License

Private — for use with OpenClaw council systems.
