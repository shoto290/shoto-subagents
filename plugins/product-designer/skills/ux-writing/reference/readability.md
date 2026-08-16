# Readability

- Plain language over precision theater: `use` not `utilize`, `send` not `initiate transmission`.
- One idea per sentence. Aim around 15 words; break anything past 25.
- No internal jargon in the UI — `tenant`, `entity`, `payload`, and `sync job` are your architecture's vocabulary, not the user's.
- Write the string, then read it aloud. If you stumble, so will the user.
- **Plan for localization expansion.** German and French run roughly 30% longer than English, and short English labels can nearly double; CJK contracts. Give labels room, never fix a button to its English width, and never build a sentence by concatenating translated fragments — grammar and word order will not survive.

Type scale, line length, and typographic treatment -> defer to `designer:design-foundations`.
