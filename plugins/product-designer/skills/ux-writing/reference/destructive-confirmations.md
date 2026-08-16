# Permissions and Destructive Confirmations

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
