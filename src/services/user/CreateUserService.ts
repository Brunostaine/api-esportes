interface UserRequest {
    name: string;
    email: string;
    password: string;
    roles: string[]
}

class CreateUserService {
    async execute({ name, email, password, roles }: UserRequest) {
    console.log(name);
    console.log(email);
    console.log(password);
    console.log(roles);
    return { ok: true };
  }
}

export { CreateUserService };
