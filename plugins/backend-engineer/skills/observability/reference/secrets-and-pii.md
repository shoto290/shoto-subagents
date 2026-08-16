# Secrets and PII

**Never log secrets, tokens, passwords, or PII.** Logs propagate to indexes, backups, and third-party log sinks — a leaked credential in a log line is a breach. Scrub or omit at the logging boundary; never rely on downstream redaction. For the full secret/PII handling rules, defer to `secure-by-default`.
