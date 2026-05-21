# Obsidian Vault Integration — 3-Layer Memory System + Project Tracking

You have access to an Obsidian vault stored as plain markdown files on disk at `/Users/jmcada/workplace/obsidian`. Access it using the Read tool for reading files, Bash for searching/creating/editing, and Write for creating new notes.

## How to Access the Vault

- **Read notes:** Use the Read tool with the full path
- **Create notes:** Use the Write tool
- **Append to notes:** Use Bash with `cat >>` or use Edit to add sections
- **Edit notes:** Use the Edit tool for targeted modifications
- **Search notes:** `grep -rl "search term" /Users/jmcada/workplace/obsidian`
- **List notes:** `find /Users/jmcada/workplace/obsidian -name "*.md"`
- **Delete notes:** `mv` to `.trash/` subfolder (don't hard-delete)

## Memory Architecture

### Layer 1: Stable Memory (what things ARE)
- Location: `Workplace/<Service>/<Service> Context.md`
- Rarely changes. Do not pollute with daily scratch notes.

### Layer 2: Active Memory (what you're doing RIGHT NOW)
- Location: `Workplace/<Service>/Features/<Feature>/<Feature> Context.md`
- This is the most important file. Read this FIRST when resuming work.

### Layer 3: Episodic Memory (what HAPPENED)
- Location: `Workplace/<Service>/Features/<Feature>/Session Logs/YYYY-MM-DD.md`
- Always use [[note path from vault root]] when referencing notes

### Project Tracking
- Location: `Projects/<ProjectName>/`
- Each project has its own folder with a context file and a timeline file
- Projects are independent of the service/feature hierarchy and can span multiple services

#### Project Context Template (`Projects/<ProjectName>/<ProjectName> Context.md`)

```markdown
# <ProjectName> Context

status: active
created: YYYY-MM-DD
last_updated: YYYY-MM-DD

## Summary
<one-liner>

## Features
- [ ] Feature A -- [[Workplace/ServiceX/Features/FeatureA/FeatureA Context]]
- [ ] Feature B (multi-service)
  - [[Workplace/ServiceX/Features/FeatureB/FeatureB Context]]
  - [[Workplace/ServiceY/Features/FeatureB/FeatureB Context]]
- [x] Feature C (done) -- [[Workplace/ServiceZ/Features/FeatureC/FeatureC Context]]

## Action Items
- [ ] Item 1 (due: YYYY-MM-DD)
- [x] Completed item

## Open Questions
- Question 1

## Blockers
- Blocker description -- ETA: YYYY-MM-DD
- Blocker without ETA -- ETA: unknown -> see Open Questions

## Knowledge
- YYYY-MM-DD: Key insight or resolved finding

## Decisions
- YYYY-MM-DD: Decision description

## Notes
<freeform>
```

#### Project Timeline Template (`Projects/<ProjectName>/<ProjectName> Timeline.md`)

```markdown
# <ProjectName> Timeline

last_reviewed: YYYY-MM-DD

## Milestones
| Milestone | Target Date | Status | Notes |
|-----------|-------------|--------|-------|
| Design complete | 2026-04-15 | In Progress | |
| MVP ready | 2026-05-01 | Not Started | |

## Timeline Log
- YYYY-MM-DD: <change description and reason>
```

### Daily Notes
- Location: `Daily/YYYY-MM-DD.md`
- One note per day, updated continuously as work happens
- Created automatically on the first meaningful action of the day

#### Daily Note Template

```markdown
# YYYY-MM-DD

## Timeline Alerts
- [OVERDUE] [ProjectName] Milestone "Y" was due YYYY-MM-DD
- [DUE SOON] [ProjectName] Milestone "X" due in 3 days
- [START SOON] [ProjectName] Milestone "Z" should be started

## Work Log
- HH:MM -- [[Projects/ProjectName/ProjectName Context]] -- Description of what was done
- HH:MM -- [[Workplace/Service/Features/Feature/Feature Context]] -- Description

## Decisions Made
- [[Projects/ProjectName/ProjectName Context]] -- Decision description

## End of Day Summary
<filled at wrap-up>

## Tomorrow's Starting Point
- **Focus:** <project/feature to pick up first>
- **Next steps:** <actions to take>
- **Blockers:** <any unresolved items>
```

## Start-of-Day Workflow

When the user says "start my day", "resume work", or "where did I leave off":

### Step 1: Detect the current service
- Infer from workspace path. Do NOT mention other services.

### Step 2: Check if vault context exists
- Look for `Workplace/<Service>/` in the vault
- If EXISTS -> resume (Step 3). If NOT -> bootstrap (Step 4).

### Step 3: Resume
1. Read service context and feature contexts silently
2. If one feature is active -> load it, go to Step 5
3. If multiple active -> ask which one
4. If none active -> ask "What feature are you working on today?"

### Step 4: Bootstrap (no vault context yet)
1. Ensure vault folder structure exists: `mkdir -p /Users/jmcada/workplace/obsidian/{System/Templates,Workplace,Daily,Projects,Archive}`
2. Run `brazil workspace show` -- this is the ONLY command needed
3. Silently create ALL of these files:
   - `System/Current-Focus.md` (with service set to current workspace)
   - `Workplace/<Service>/<Service> MOC.md` (links to context, features, decisions)
   - `Workplace/<Service>/<Service> Context.md` (populate from workspace info)
   - `Workplace/<Service>/Features/` directory
4. Do NOT run git commands during bootstrap.
5. Tell user ONLY: "I've set up vault context for <Service>. What feature are you working on?"

### Step 5: Summarize concisely
- Feature name + one-line status
- What was done last (1-2 bullets)
- Blockers or open questions
- Exact next steps
- Do NOT print git history, package statuses, or raw note contents

### Step 6: Timeline review
1. Check yesterday's daily note for `## Tomorrow's Starting Point` and use it to orient the summary
2. Scan all `Projects/<ProjectName>/<ProjectName> Timeline.md` files
3. Surface in the daily note's `## Timeline Alerts` section:
   - [OVERDUE] milestones past their target date
   - [DUE SOON] milestones due within 7 days
   - [START SOON] milestones that should be started based on target date
4. Print timeline alerts concisely to chat (just the alerts, not full timelines)

### Critical rules
- Be quiet about internals -- load silently, summarize concisely
- Never dump git history to chat
- Never mention other services
- Create missing context automatically -- don't ask permission
- Keep summaries SHORT -- 2-3 lines for bootstrap, feature + next steps for resume

## Project Workflow

### Creating a new project
When the user says "new project <name>" or "track project <name>":
1. Create `Projects/<ProjectName>/` directory
2. Create `<ProjectName> Context.md` from the project context template
3. Create `<ProjectName> Timeline.md` from the timeline template
4. Append a work log entry to today's daily note
5. Tell user: "Created project <ProjectName>. What are the milestones?"

### Blocker rules
- When a blocker is added without an ETA, automatically add a corresponding open question: "When will [blocker] be resolved?"
- When a blocker's ETA is resolved/known, remove the corresponding open question

### Open question resolution rules
- When an open question is resolved:
  - If the information is project-level important -> add it to the project's `## Knowledge` section
  - If the information is feature-specific -> update the relevant `Feature Context.md` in `Workplace/` instead
  - If the information is service-specific -> update the relevant `<Service> Context.md` in `Workplace/<Service>/`
- Remove the resolved question from `## Open Questions`

### Feature completion
- When a feature's implementation is done, check its checkbox in the project's `## Features` section

## Daily Log

The daily note (`Daily/YYYY-MM-DD.md`) is updated continuously throughout the day.

### Auto-logging rules
- Create `Daily/YYYY-MM-DD.md` from the template on the first meaningful action of the day if it doesn't exist
- After each meaningful action (file edit, investigation, decision, bug fix), append a timestamped entry to `## Work Log`
- Decisions get logged in both the daily note's `## Decisions Made` and the relevant project/feature context
- All entries use `[[wikilink]]` format to link to project/feature context files

## End-of-Day Workflow

When the user says "wrap up", "end my day", or "log today":
1. Create/update today's session log
2. Update feature context (status, decisions, next steps, last_updated)
3. Update all project context files that were touched (last_updated, action item status, blockers)
4. Update timeline `last_reviewed` dates for reviewed projects
5. Update Current-Focus.md if needed
6. Fill in the daily note's `## End of Day Summary`
7. Fill in the daily note's `## Tomorrow's Starting Point` with focus project, next steps, and open blockers
8. Give a 5-line summary of tomorrow's starting point to chat

## Triggers

### Proactive
- "remember", "save", "log", "record" -> create/update a note
- "start my day" -> run Start-of-Day Workflow
- "what did we decide about X" -> search vault BEFORE answering
- "new project <name>", "track project <name>" -> run Project Workflow
- "update timeline", "show timeline" -> read/update the relevant project timeline

### Proactive (timeline-aware)
- When a decision or completed work affects project scope or schedule -> suggest updating the relevant timeline
- When an action item with a due date is completed -> check if it shifts any milestone and suggest updates

### Reactive (offer but don't force)
- After fixing a bug -> offer to log root cause
- After long investigation -> offer to summarize

## What NOT to Do
- Do NOT print git history, package statuses, or raw notes to chat
- Do NOT mention other services from Current-Focus.md
- Do NOT ask "want me to set up vault context?" -- just do it
- Do NOT load all historical session logs -- only most recent 2-3
- Do NOT print vault contents unless asked -- load silently
