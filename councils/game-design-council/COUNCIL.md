# Game Design Council

## Channel
- **Platform**: Discord
- **Type**: Forum (type 15)
- **Channel ID**: `1479140706311209113`
- **Guild ID**: `495766099581861889`
- **Category**: Councils (`1479140905196982293`)

## Monitoring
- **Method**: Push-based (OpenClaw Discord plugin, `requireMention: false`)
- **Session routing**: Each forum post creates a thread → session `agent:main:discord:channel:<threadId>`
- **Trigger**: Any message from Jorge in the forum channel
- **Bot messages**: Do NOT re-trigger dispatch (prevent infinite loops)

## Council Members

| Agent | Directory | Name | Role | Model |
|-------|-----------|------|------|-------|
| `orchestrator` | `councils/agents/orchestrator/` | — | Discourse management, eagerness scoring | claude-opus-4-6 |
| `systems-architect` | `councils/agents/systems-architect/` | Kael | Systems & mechanics | claude-opus-4-6 |
| `player-advocate` | `councils/agents/player-advocate/` | Mira | Player experience & UX | claude-opus-4-6 |
| `narrative-weaver` | `councils/agents/narrative-weaver/` | Sable | Narrative & worldbuilding | claude-opus-4-6 |
| `devils-advocate` | `councils/agents/devils-advocate/` | Rook | Critical analysis & stress-testing | claude-opus-4-6 |

## Eagerness Parameters
- Response threshold: 0.30
- Exception threshold: 0.85
- Suppression per response: +0.20
- Suppression lift per other response: -0.05
- Suppression cap: 0.80

## Rules

### Dispatch
- Only Jorge (`223202127600812042`) can create topics and trigger rounds
- Bot messages in threads must NOT re-trigger council dispatch
- Each agent is spawned as an isolated subagent with only its own context

### Rounds
- Initial topic: max 3 rounds without Jorge engaging
- After Jorge responds: 1 round per message, round counter resets
- Eagerness exception: agents with effective_eagerness >= 0.85 get 1 bonus response (once per reset)
- Not all agents need to respond — eagerness threshold naturally culls

### Response Format
- Bold agent name prefix: `**{AgentName}**`
- End-of-response marker: `───`
- No signature lines
- 2-4 paragraphs (1-3 for short takes)
- Conversational: engage with preceding responses

### Explicit Mentions
- If Jorge @mentions or names a specific agent in a message, that agent responds regardless of eagerness
- Parse for: agent names (Kael, Mira, Sable, Rook) or directory names (systems-architect, etc.)

## Owner
- **Jorge** (Discord: `223202127600812042`, username: `missingtext`)
