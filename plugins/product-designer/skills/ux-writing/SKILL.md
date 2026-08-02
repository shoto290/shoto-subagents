---
name: ux-writing
description: 'Interface copy: microcopy, voice, tone, and errors.'
---

# UX Writing

Copy is interface, not decoration — words are the part of the UI users actually read to decide what to do next. One rule governs everything below: **if a label needs a tooltip to be understood, the label is wrong.** Write the words alongside the flow, never after it (Podmajersky, *Strategic Writing for UX*; Yifrah, *Microcopy*), and encode the decisions as reusable rules the way the Shopify Polaris and Mailchimp content guidelines do — one documented voice, one term per concept, one pattern per state.

## Voice & Tone

Voice is constant: it is who the product is, and it does not change between screens. Tone is variable: it shifts with the user's emotional state at that moment. A product with a single flat tone is either glib in a failure or cold in a win.

| Context | Tone | Why |
| :-- | :-- | :-- |
| **Routine** | Plain, brief, invisible | The user is mid-task; copy must not ask for attention. |
| **First-time** | Guiding, concrete | The user lacks a model of the product; name the next action. |
| **Error** | Calm, direct, accountable | Frustration is already high; personality reads as mockery. |
| **Destructive** | Sober, explicit, unambiguous | The cost is irreversible; clarity outranks friendliness. |
| **Celebratory** | Warm, short, earned | Acknowledge, then get out of the way. |

Define the voice once — three or four adjectives plus an explicit "we are never" list — and hold it. Tone moves inside that boundary; it never replaces it.

## Microcopy Rules

- **Verb-first buttons that name the outcome.** The button says what will happen, not what the user is doing to the form.
- **Sentence case** for buttons, labels, headings, and menu items. Title Case slows scanning and reads as marketing.
- **Front-load the meaningful word.** Users scan the first two words of a label; put the distinguishing noun or verb there.
- **Second person, active voice.** "Your plan renews" — not "the user's plan will be renewed."
- **One term per concept, forever.** Pick `workspace` or `organization` or `team` and never mix them across UI, docs, emails, and support.

| Bad | Good | Rule |
| :-- | :-- | :-- |
| `Submit` | `Create account` | Name the outcome, not the mechanism. |
| `OK` | `Delete project` | The button states what happens when pressed. |
| `Click here to view your invoices` | `View invoices` | Front-load; drop the click instruction. |
| `Get Started Now!` | `Start free trial` | Sentence case; say what starts. |
| `The user must confirm their email` | `Confirm your email` | Second person, active. |
| `Team` / `Workspace` / `Org` mixed | `Workspace` everywhere | One term per concept. |

Screen-reader labels, alt text, and live-region announcements -> defer to `designer:accessibility-craft`.

## Error Messages

Every error answers three questions in order: **what happened, why, what to do next.** Missing the third turns an error into a dead end.

- Never blame the user. "Invalid input" is an accusation; "Enter a date after today" is an instruction.
- Never surface a raw code or stack trace alone. Keep a reference ID as secondary text for support, never as the whole message.
- Never ship "Something went wrong" with no recovery action — it is the canonical non-message.
- Put the error next to the field that caused it, in the user's words, not the validator's.

Rewrite example:

```text
Before:  Error 500: Something went wrong.

After:   We couldn't save your changes — the server didn't respond.
         Your draft is stored on this device. Try saving again in a moment.
         Reference: 8F2C-119
```

## Empty, Loading & Success States

- **Empty is an onboarding surface, not an apology.** Say what belongs here, why it is valuable, and give the action that fills it — "No projects yet. Create one to start tracking work." with a `Create project` button. Never "Nothing to see here."
- **Loading sets expectation.** Name the operation and its shape: "Importing 1,240 contacts — about 30 seconds." A bare spinner with "Loading…" tells the user nothing about whether to wait.
- **Success confirms the outcome, not the click.** "Invite sent to sam@acme.com" — not "Success!" State what changed and, where relevant, what happens next.
- Distinguish the three empty types: **first-use** (onboard), **user-cleared** (celebrate, e.g. inbox zero), and **no-results** (offer a way to broaden the search).

## Permissions & Destructive Confirmations

Ask for a permission only in context, right after the user does something that needs it, and state the benefit before the OS prompt fires: "Turn on notifications so you know when a teammate replies" beats the system default.

A destructive confirmation states the consequence, names the object, and labels the button with the action:

```text
Bad:   Are you sure?
       This action cannot be undone.
       [ Cancel ]  [ OK ]

Good:  Delete "Q3 Roadmap"?
       This deletes 42 pages and removes access for 8 members. This can't be undone.
       [ Cancel ]  [ Delete roadmap ]
```

Reserve type-to-confirm for the genuinely unrecoverable (delete an account, drop a production database). Applied to routine deletes, it trains users to type through every dialog without reading.

## Readability

- Plain language over precision theater: `use` not `utilize`, `send` not `initiate transmission`.
- One idea per sentence. Aim around 15 words; break anything past 25.
- No internal jargon in the UI — `tenant`, `entity`, `payload`, and `sync job` are your architecture's vocabulary, not the user's.
- Write the string, then read it aloud. If you stumble, so will the user.
- **Plan for localization expansion.** German and French run roughly 30% longer than English, and short English labels can nearly double; CJK contracts. Give labels room, never fix a button to its English width, and never build a sentence by concatenating translated fragments — grammar and word order will not survive.

Type scale, line length, and typographic treatment -> defer to `designer:design-foundations`.

## Pitfalls

- **Clever over clear** — a joke the user must decode is a cost, not a delight. Clarity first, personality second.
- **Two words for one concept** — `workspace` in the nav and `organization` in billing makes users wonder if they are different things.
- **Copy written after the UI is frozen** — the layout then dictates the message, and the real message gets truncated into the box that happens to exist.
- **Humor in a failure state** — an error is the worst possible moment for a mascot. Be useful, not amusing.
- **Placeholder text used as a label** — it disappears on focus, fails recall, and leaves the user staring at an unlabeled field.
- **"Something went wrong" with no next step** — an error with no recovery action strands the user and generates a support ticket.
