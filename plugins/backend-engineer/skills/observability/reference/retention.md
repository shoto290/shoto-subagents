# Retention

Retain by **risk and cost, not "just in case"**. High-volume DEBUG/INFO logs get short windows; audit and security-relevant events get long ones. Aggregate metrics (cheap, small) retain far longer than raw logs (expensive, large). Set retention per signal class deliberately.
