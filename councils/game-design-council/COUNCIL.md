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

## Verbosity

All values 0.0–1.0. The scale represents conversational register:

| Value | Register |
|-------|----------|
| 0.00 | One/two word responses |
| 0.15 | Twitch/YouTube chat |
| 0.30 | SMS / DMs |
| 0.45 | Discord / forums |
| 0.60 | Reddit |
| 0.75 | Academic / professional |
| 0.90 | Oxford-style debate |
| 1.00 | Lectures |

- **verbosityMin**: 0.25
- **verbosityMax**: 0.55

Agents choose where they land between min and max based on their `baseVerbosity` preference, nudged by eagerness (higher eagerness → nudge toward max). The council range keeps the overall tone consistent while allowing individual variation.

## Eagerness Parameters
- Response threshold: 0.30
- Exception threshold: 0.85
- Suppression per response: +0.25
- Suppression lift per other response: -0.03
- Suppression cap: 0.80
- Round decay: R1=1.0, R2=0.70, R3=0.45

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
- Length determined by computed verbosity — at this council's range (0.25–0.55), expect 2-6 sentences typically, not paragraphs
- Conversational: engage with preceding responses, be direct, skip preamble

### Explicit Mentions
- If Jorge @mentions or names a specific agent in a message, that agent responds regardless of eagerness
- Parse for: agent names (Kael, Mira, Sable, Rook) or directory names (systems-architect, etc.)

## Owner
- **Jorge** (Discord: `223202127600812042`, username: `missingtext`)
