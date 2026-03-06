# Game Design Council

## Channel
- **Platform**: Discord
- **Type**: Forum (type 15)
- **Channel ID**: `1479140706311209113`
- **Guild ID**: `495766099581861889`
- **Category**: Councils (`1479140905196982293`)

## Monitoring
- **Method**: Push-based (OpenClaw Discord plugin configured with `requireMention: false`)
- **Session routing**: Each forum post creates a thread with session `agent:main:discord:channel:<threadId>`
- **Trigger**: Any message from Jorge (user ID `223202127600812042`) in the forum channel

## Council Members

| Agent | Name | Role | Model |
|-------|------|------|-------|
| `orchestrator` | — | Discourse management | claude-opus-4-6 |
| `systems-architect` | Kael | Systems & mechanics | claude-opus-4-6 |
| `player-advocate` | Mira | Player experience & UX | claude-opus-4-6 |
| `narrative-weaver` | Sable | Narrative & worldbuilding | claude-opus-4-6 |
| `devils-advocate` | Rook | Critical analysis & stress-testing | claude-opus-4-6 |

## Rules

- Only Jorge (223202127600812042) can create topics and reset round counters
- Council agents respond in eagerness order (managed by orchestrator)
- Max 3 rounds initial, 1 round per follow-up, eagerness exception at 0.85
- Agents sign their posts with their name (e.g., "— Kael")
- No agent responds to itself
- If Jorge @mentions a specific agent by name, that agent responds regardless of eagerness

## Owner
- **Jorge** (Discord: `223202127600812042`, username: `missingtext`)
