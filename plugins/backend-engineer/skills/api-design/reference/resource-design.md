# Resource-Centric Design

Model endpoints around **resources (nouns)** addressed by the **HTTP verb**, not around actions.

- `GET /users/42` — fetch a user. `DELETE /orders/99` — delete an order. `POST /orders` — create.
- Never `POST /getUser`, `POST /deleteOrder`, `GET /createOrder`. The verb lives in the method, never in the path.
- Collections are plural nouns: `/users`, `/orders`. Sub-resources nest: `/users/42/orders`.
- A true action that is not CRUD (`/orders/99/refund`) is the rare exception — reach for it only when no resource models the state change.

The HTTP method already encodes intent. Verb endpoints duplicate that, break caching and proxies, and make the surface unpredictable.
