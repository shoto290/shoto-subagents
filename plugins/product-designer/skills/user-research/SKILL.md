---
name: user-research
description: Planning, running, and synthesizing user research.
---

# User Research

Research earns its cost only when a decision is waiting on it. One rule governs everything below: **run the smallest study that answers the question you actually have, and attach it to a decision that will change based on the result.** Research with no decision attached is theater — it produces a deck, not a change. Hall's *Just Enough Research* sets the scoping discipline (enough to de-risk the decision, no more), Portigal's *Interviewing Users* sets the interview craft, and the Nielsen Norman Group method literature sets the axes used to choose between methods.

## Pick The Method

Two axes decide the method. **Generative vs. evaluative** — are you looking for the problem, or testing a solution? **Attitudinal vs. behavioral** — are you capturing what people *say*, or what they *do*? Mismatch an axis and you get a confident answer to a question you were not asking.

| Method | Question it answers | Typical sample | Wrong choice when |
| :-- | :-- | :-- | :-- |
| **User interviews** (generative, attitudinal) | What problem do they have, in what context, and why does it matter? | 5-8 per segment | You need to know whether a design works — people cannot report their own usability — or you need a proportion. |
| **Contextual inquiry** (generative, behavioral) | What do they actually do, with what tools and workarounds, in their real environment? | 4-6 sessions | The environment is irrelevant or inaccessible, or you need an answer this week. |
| **Diary study** (generative, behavioral, longitudinal) | How does the behavior unfold over days or weeks, across triggers you cannot stage? | 8-15 over 1-4 weeks | The behavior is one-off or in-session; you have no time to run it or budget to keep participants logging. |
| **Survey** (evaluative, attitudinal, quantitative) | How many, how often, which segment — for answers you can already enumerate. | 100+ for direction, 200-400 for segment comparisons | You do not yet know the answer space (you will write ambiguous options), you need "why", or N is too small for the confidence you plan to claim. |
| **Usability test** (evaluative, behavioral) | Can they complete the task with this design, and where do they fail? | 5 per round per segment | Nothing exists to test yet, or the question is desirability, demand, or pricing rather than operability. |
| **Analytics review** (evaluative, behavioral, quantitative) | Where do real users drop, stall, or loop, at full population scale? | Whole population | You need why, the instrumentation is untrusted or incomplete, or the flow does not exist yet. |
| **Competitive audit** (generative, indirect) | What conventions do users already know, and where is the category weak? | 3-5 direct + 1-2 analogues | It is standing in for talking to users; competitors' choices are evidence about competitors, not about your users. |

## Research Plan

Write this before recruiting anyone. One page.

- **Decision at stake** — the pending decision and who owns it. If no outcome changes anyone's course, cancel the study.
- **Question** — one primary research question in plain language, at most two secondary. More than three questions is two studies.
- **Hypothesis** — what you currently believe and why, stated so it can be wrong. Name the result that would falsify it.
- **Participant criteria and screener** — criteria written as screener questions plus explicit exclusions (employees, friends, existing power users when studying onboarding). Screen on past behavior, not self-described attitude; recruit the segment the decision is about, not the segment that answers fastest.
- **Method and logistics** — method per the table above, session length, incentive, recording consent, note-taker.
- **Success criteria** — the results that send the decision each way, agreed before session one so findings cannot be renegotiated at readout. For defining outcome metrics and what counts as a good number, defer to `product-designer:product-metrics`.

Circulate the plan before recruiting. Silence at plan time is consent; objections raised only at readout are not.

## User Interviews

- **Open questions only.** "Walk me through the last time you…". Never yes/no, never a question that contains its own answer.
- **Past behavior over stated future intent.** "Would you use this?" and "how much would you pay?" are worthless. Ask what they did last time, when, and what it cost them.
- **Ladder from what to why.** Follow an answer with "why does that matter to you?" three to five times to move from feature talk to underlying need. Stop when they begin inventing.
- **Use silence.** Wait three to five seconds after they stop; the second answer is usually the real one. Do not fill the pause.
- **Never lead.** No "so that was frustrating, right?", and no describing your solution before they have described their problem. Your reaction shapes their next answer.
- **Separate what they say from what they do.** Record claims as claims, then ask to be shown — the actual file, tool, spreadsheet, or workaround. Observation outranks self-report every time.
- One participant at a time. Groups produce consensus, not truth. Record with consent and keep verbatim wording; paraphrase loses the finding.

## Stakeholder Interviews

Run these before any user work, 30 minutes each, with whoever owns the decision, the budget, and the delivery.

- **Constraints** — what is already fixed: technical, legal, contractual, timeline, headcount. Far cheaper to learn now than to design around later.
- **Definition of success** — ask each stakeholder separately what a win looks like in six months. Divergent answers are themselves a finding; reconcile them before research starts, not at readout.
- **Prior attempts** — what has been tried, why it failed, and what research already exists. Most organizations are sitting on unread past studies.
- **Hidden agendas** — the outcome someone needs, the solution already promised to a customer, the team whose roadmap your answer threatens. Note it privately in the plan so the readout is not ambushed.
- Close each one with "what result would change your mind?". "Nothing" means the decision is already made — cancel the study or renegotiate its scope.

## Competitive Analysis

- **Audit the experience, not the feature list.** Feature grids compare marketing pages. Do the real task: sign up, complete the core flow, trigger an error, cancel. Record where it breaks.
- **Score every product against the same criteria** — onboarding, core task, empty states, error recovery, pricing clarity — so the comparison is evidence rather than taste.
- **What to steal** — the conventions users already arrive knowing. Diverging from an established pattern has to be paid for with a real advantage.
- **What to avoid** — complexity shipped as configurability, dark patterns, and every flow that serves their org chart rather than the user.
- **What the gap tells you** — something every competitor does badly is either your opening or a constraint they all discovered the hard way. Assume the second until users say otherwise.
- Judging whether an experience is good is design judgment, not a research result — defer to `designer:ux-principles` for the Laws of UX and the heuristics that back the verdict.

## Synthesis

- **Tag as you go.** One observation per note, tagged with participant ID and timestamp, within a day of the session. Synthesizing a week later from memory synthesizes your memory, not the sessions.
- **Affinity diagram bottom-up.** Every observation gets its own card; cluster by similarity with no predefined buckets and name the cluster only once it has formed. Predefined categories reproduce your assumptions.
- **Keep three layers distinct and labeled:**
  - **Observation** — what happened, literal: "4 of 6 abandoned at the payment step."
  - **Insight** — the evidenced explanation: "they abandon because the total changes only at the last step."
  - **Recommendation** — the action the team owns: "show the full total at cart entry."
  A recommendation presented without its observation is an opinion with a citation number.
- **Weight by evidence** — how many participants, across how many sessions, doing versus saying. One vivid quote is a hypothesis, not a finding.
- **Saturation is the stopping rule.** Stop when new sessions stop producing new clusters, typically 5-8 per segment. If new themes keep appearing, the segment mix is wrong or the question is too broad.
- Ship a one-page readout: decision, question, findings, recommendations, confidence, and what remains unknown.

## Pitfalls

- **Asking users to design** — "what would you want here?" buys you a faster horse. Users are the authority on their problem and never on the solution.
- **Generalizing from N of 1** — one articulate participant or one stakeholder anecdote becomes a roadmap item. Report frequency and segment alongside every finding.
- **Confirmation bias** — writing the conclusion before the sessions, then hearing only the confirming quotes. Have someone argue the opposite reading of the same notes.
- **Recruiting the wrong people** — friends, colleagues, internal staff, or whoever replied first. A convenience sample studying onboarding contains no new users.
- **Research that arrives after the decision** — a readout delivered post-commit is documentation, not research. Schedule backward from the decision date and cut scope to fit.
