# Council System Changelog

## v4.1 (2026-03-06)
- Stronger debug message prevention (⛔ ABSOLUTE RULE prefix in dispatch + orchestrator)
- Persistent typing indicator (`typing-loop.sh` fires every 8s for up to 5min)
- All agents switched to Claude Sonnet 4.6
- Added Sonnet 4.6 to OpenClaw allowed models
- Error handling: orchestrator logs failures and continues with next agent

## v4 (2026-03-06)
- No debug messages in thread (dispatch + orchestrator instructed not to post)
- 1900 character limit per agent response (Discord limit)
- Single-fire typing indicator (`typing-indicator.sh`)
- Tighter agent response length guidance

## v3.2 (2026-03-05)
- Model config pass-through (orchestrator reads agent's config.json for model)
- Wait-for-completion instruction (orchestrator waits for agent announce before next spawn)
- AGENTS.md guard for council agent subagents (skip Abel's instructions)

## v3.1 (2026-03-05)
- Forced agents support (bypasses eagerness threshold when Jorge mentions by name)
- Follow-up state handling (suppression reset, round counter reset)
- Agent name registry with aliases for mention detection

## v3 (2026-03-05)
- **Major architecture change**: Proper context isolation
- Each agent spawned as isolated depth-2 subagent (maxSpawnDepth: 2)
- Orchestrator reads agent files for eagerness scoring only, never composes responses
- Bot message loop prevention (guild users = Jorge only, allowBots = false)
- Management documentation (MANAGEMENT.md)

## v2 (2026-03-05)
- Conversational flow: agents read and engage with preceding responses
- Bold agent name prefix + ─── end markers (replaces signature)
- Agent memory updates after each response
- Council summary as temporary dev feature

## v1 (2026-03-05)
- Initial implementation: orchestrator composes all agent responses
- Eagerness scoring system with suppression mechanic
- Push-based Discord routing (no cron)
- First successful end-to-end run: "water bottle game" topic

## v0 (2026-03-05)
- Project conceived
- Directory structure, 4 agent personas (Kael, Mira, Sable, Rook)
- Orchestrator agent
- GitHub repo: lde0/council-agents
- Discord forum channel configuration
