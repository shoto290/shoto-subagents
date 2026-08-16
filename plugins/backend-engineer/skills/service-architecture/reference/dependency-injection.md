# Dependency Injection

Inject dependencies as **interfaces through the constructor**. A service declares what it needs; the wiring layer supplies it.

- Never `new` a dependency inside a service — that hardcodes the implementation and defeats both mocking and swapping.
- No global service locators or static singletons reached from inside business logic — they hide the dependency graph and make tests stateful.
- Constructor injection makes dependencies explicit, the object fully formed once built, and the test seam obvious.
