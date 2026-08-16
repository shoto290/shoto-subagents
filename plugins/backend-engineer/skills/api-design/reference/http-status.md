# HTTP Status Discipline

Use the status line to communicate outcome. **Never return `200` for a failure.**

| Code | Meaning |
| :-- | :-- |
| 200 | OK — successful `GET`/`PUT`/`PATCH` with a body |
| 201 | Created — resource created (return it / its `Location`) |
| 204 | No Content — success with no body (e.g. `DELETE`) |
| 400 | Bad Request — malformed syntax / unparseable |
| 401 | Unauthorized — missing or invalid authentication |
| 403 | Forbidden — authenticated but not allowed |
| 404 | Not Found — resource does not exist |
| 409 | Conflict — state conflict (duplicate, version clash) |
| 422 | Unprocessable Entity — well-formed but semantically invalid |
| 429 | Too Many Requests — rate limited |
| 500 | Internal Server Error — unexpected server fault |
