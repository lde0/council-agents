# Council Routing Protocol

## ⚠️ CRITICAL — Read this FIRST on every inbound message

Check the inbound context `chat_id` against the council channel registry below. If the message is from a council channel, **DO NOT respond normally**. Follow the council dispatch protocol instead.

## Council Channel Registry

| Council | Forum Channel ID | Chat ID Pattern |
|---------|-----------------|-----------------|
| game-design-council | `1479140706311209113` | Thread `parentId` is `1479140706311209113` |

## Agent Name Registry (for mention detection)

| Directory | Display Name | Aliases |
|-----------|-------------|---------|
| `systems-architect` | Kael | kael, systems architect, systems-architect |
| `player-advocate` | Mira | mira, player advocate, player-advocate |
| `narrative-weaver` | Sable | sable, narrative weaver, narrative-weaver |
| `devils-advocate` | Rook | rook, devil's advocate, devils-advocate, contrarian |

## Detection

1. Extract the channel/thread ID from the inbound `chat_id` (format: `channel:<id>`)
2. Use `message channel-info` on it — check `parentId`
3. If `parentId` matches a registered forum channel ID → council thread detected
4. If no `parentId` or doesn't match → not a council channel, proceed normally

If council channel detected → **STOP**. Do not compose a conversational reply.

## Dispatch Protocol

**⛔ CRITICAL — YOUR TEXT OUTPUT = DISCORD MESSAGES**

Every word you write as text output in this session becomes a visible message in the forum thread. There is no "thinking out loud" — it all gets posted. This means:

- **NO narration** ("Now I'll format...", "Let me spawn...", "Reading the thread...")
- **NO status updates** ("Orchestrator started", "Processing...")  
- **NO debugging** ("Found 3 messages", "State file exists")
- **ANY text you output before NO_REPLY is a bug**

Your entire output for this session must be: tool calls, then `NO_REPLY`. Nothing else.

**Additionally:** Every message you accidentally post **resets the Discord typing indicator**, causing visible gaps in the "Abel is typing..." state. So debug messages don't just look bad — they break the UX.

### Steps (tools only, zero text):

1. `exec` — Start typing indicator: `nohup bash councils/typing-loop.sh {threadId} 600 > /dev/null 2>&1 &`
2. `message read` — Read the thread (limit 50)
3. **Filter** (in your head, not as text):
   - If last message is from bot → NO_REPLY
   - If last human message is not Jorge (`223202127600812042`) → NO_REPLY
4. **Determine** message type (silently): state file exists → follow-up, else → initial
5. **Check for agent mentions** (silently): scan Jorge's message for agent names/aliases
6. `read` — Load topic state if it exists
7. `sessions_spawn` — Spawn the orchestrator with the template below
8. Output ONLY: `NO_REPLY`

## Orchestrator Spawn Template

```
You are the Council Orchestrator. Execute the council orchestration protocol.

Council: {council-name}
Council Config: councils/{council-name}/COUNCIL.md
Thread ID: {threadId}
Target for replies: message(action=thread-reply, threadId={threadId}, target={threadId}, channel=discord)
Message Type: {initial|follow-up}
{if forcedAgents: "Forced Agents (respond regardless of eagerness): {forcedAgents}"}
Existing Topic State: {contents of topics/{threadId}.json, or "none — initialize new state"}

Thread Content:
{formatted thread content}

Execute the protocol in your AGENT.md. Read councils/agents/orchestrator/AGENT.md first.
```

## Important Notes

- The orchestrator spawns each council agent as a SEPARATE isolated subagent
- Each agent subagent receives ONLY its own persona, memory, and the thread content
- The orchestrator NEVER composes agent responses — agents think and write independently
- Agent subagents are spawned sequentially (wait for each to complete before the next)
- Bot messages MUST NOT re-trigger dispatch — check `author.bot` first
- Forced agents bypass eagerness threshold but still participate in suppression tracking
