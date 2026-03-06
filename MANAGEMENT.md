# Council Management

## Adding a New Council Agent

1. Create directory: `councils/agents/{agent-name}/`
2. Create `AGENT.md` — persona, expertise, voice, response instructions
3. Create `config.json` — model, topicAffinity, expertise tags
4. Create `MEMORY.md` — initialized with creation date, empty sections
5. Add the agent to relevant council(s): edit `councils/{council}/COUNCIL.md` member table
6. Push template files to GitHub: `agents/{agent-name}/AGENT.md` + `config.json`

## Removing a Council Agent

1. Remove from council member table(s) in `COUNCIL.md`
2. Optionally archive the agent directory (don't delete — memory has value)
3. Update GitHub repo

## Creating a New Council

1. Create a Discord forum channel in the Councils category
2. Add the channel to OpenClaw Discord config:
   ```
   gateway config.patch → channels.discord.guilds.{guildId}.channels.{channelId} = { allow: true, requireMention: false, systemPrompt: "..." }
   ```
3. Create `councils/{council-name}/COUNCIL.md` with channel info, member roster, rules
4. Create `councils/{council-name}/state.json` (empty: `{ "councilId": "...", "channelId": "...", "threads": {} }`)
5. Create `councils/{council-name}/topics/` directory
6. Add the channel to the registry in `councils/ROUTING.md`

## Modifying an Agent's Persona

Agent AGENT.md changes require review:
- Jorge approves changes, OR
- Abel reviews proposed changes

Agent MEMORY.md updates are free — agents update their own memory during discussions.

## Model Changes

Update `config.json` for the agent. The orchestrator reads the model from config when spawning.
Currently all agents use `claude-opus-4-6`. Can be changed per-agent.
