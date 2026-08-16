# Worked Example

Controller → service → repository, wired by constructor injection. Language-agnostic / TypeScript-ish.

```ts
interface UserRepository {
  findByEmail(email: string): Promise<User | null>;
  save(user: User): Promise<void>;
}

class RegisterUserService {
  constructor(
    private readonly users: UserRepository,
    private readonly mailer: Mailer,
  ) {}

  async register(email: string, password: string): Promise<User> {
    if (await this.users.findByEmail(email)) {
      throw new EmailAlreadyTakenError(email);
    }
    const user = User.create(email, password);
    await this.users.save(user);
    await this.mailer.sendWelcome(user);
    return user;
  }
}

class UserController {
  constructor(private readonly registerUser: RegisterUserService) {}

  async post(req: Request, res: Response) {
    const { email, password } = parseRegisterBody(req);
    const user = await this.registerUser.register(email, password);
    return res.status(201).json(toUserResponse(user));
  }
}
```

The controller only parses, delegates, and maps. The service holds the rule (no duplicate email) and orchestration. The repository is an interface, so the service mocks cleanly and the ORM stays out of the business layer.
