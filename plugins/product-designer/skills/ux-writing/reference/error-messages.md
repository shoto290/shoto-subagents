# Error Messages

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

Pitfalls specific to failure states:

- **Humor in a failure state** — an error is the worst possible moment for a mascot. Be useful, not amusing.
- **"Something went wrong" with no next step** — an error with no recovery action strands the user and generates a support ticket.
