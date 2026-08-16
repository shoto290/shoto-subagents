# SOLID

- **SRP — Single Responsibility.** A unit changes for one reason. If a class both formats a report and emails it, two unrelated requirements can break it.

```ts
class Invoice { calculateTotal() {} }
class InvoiceMailer { send(invoice: Invoice) {} }
```

- **OCP — Open/Closed.** Extend behavior without editing the dispatcher. Replace a growing `switch` with a strategy map.

```ts
const handlers: Record<Kind, (o: Order) => number> = { standard: std, express: exp };
const fee = handlers[order.kind](order);
```

- **LSP — Liskov Substitution.** A subtype must honor the base contract. A `ReadOnlyList` that throws on `add()` is not substitutable for `List` — model it as a separate type, not a subclass.

- **ISP — Interface Segregation.** Depend on the narrow interface you use. A consumer that only reads should take `{ get(id): T }`, not the full repository with writes and migrations.

- **DIP — Dependency Inversion.** Depend on abstractions, not concretions. Take the interface as a constructor argument so the concrete client is injected, not imported.

```ts
class Notifier { constructor(private channel: Channel) {} }
```
