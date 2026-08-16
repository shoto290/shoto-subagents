---
name: ux-writing
description: 'Interface copy: microcopy, voice, tone, and errors.'
---

# UX Writing

Copy is interface, not decoration — words are the part of the UI users actually read to decide what to do next. One rule governs everything below: **if a label needs a tooltip to be understood, the label is wrong.** Write the words alongside the flow, never after it (Podmajersky, *Strategic Writing for UX*; Yifrah, *Microcopy*), and encode the decisions as reusable rules the way the Shopify Polaris and Mailchimp content guidelines do — one documented voice, one term per concept, one pattern per state.

## Non-Negotiables

- Voice is constant; tone shifts with the user's emotional state.
- Verb-first buttons in sentence case that name the outcome.
- One term per concept, forever — across UI, docs, emails, and support.
- Every error answers what happened, why, and what to do next.
- Empty onboards, loading sets expectation, success confirms the outcome.
- A destructive confirmation names the object and states the consequence.
- Plain language, one idea per sentence, room for localization expansion.

Screen-reader labels, alt text, and live-region announcements -> defer to `designer:accessibility-craft`. Type scale, line length, and typographic treatment -> defer to `designer:design-foundations`.

## Pitfalls

- **Clever over clear** — a joke the user must decode is a cost, not a delight. Clarity first, personality second.
- **Two words for one concept** — `workspace` in the nav and `organization` in billing makes users wonder if they are different things.
- **Copy written after the UI is frozen** — the layout then dictates the message, and the real message gets truncated into the box that happens to exist.
- **Placeholder text used as a label** — it disappears on focus, fails recall, and leaves the user staring at an unlabeled field.

## Reference

| File | Read when |
| :-- | :-- |
| [reference/voice-and-tone.md](./reference/voice-and-tone.md) | Defining the product voice, or choosing the tone for a routine, first-time, error, destructive, or celebratory context. |
| [reference/microcopy-rules.md](./reference/microcopy-rules.md) | Writing a button, label, heading, or menu item, or auditing bad-to-good copy pairs. |
| [reference/error-messages.md](./reference/error-messages.md) | Writing or rewriting an error, validation, or failure message. |
| [reference/state-copy.md](./reference/state-copy.md) | Writing empty, loading, or success state copy, or distinguishing the three empty types. |
| [reference/destructive-confirmations.md](./reference/destructive-confirmations.md) | Writing a permission request, a delete dialog, or deciding on type-to-confirm. |
| [reference/readability.md](./reference/readability.md) | Tightening sentence length or jargon, or preparing labels for localization expansion. |
