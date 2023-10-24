import { compare } from "bcryptjs";
import { sign } from "jsonwebtoken";
import prismaClient from "../../prisma";

interface AuthUserRequest {
  email: string;
  password: string;
}

class AuthUserService {
  async execute({ email, password }: AuthUserRequest) {
    const user = await prismaClient.user.findFirst({
      where: {
        email: email,
      },
    });

    if (!user) {
      throw new Error("Email/Password incorreto");
    }

    const passwordMatch = await compare(password, user?.password);
    if (!passwordMatch) {
      throw new Error("Email/Password incorreto");
    }

    const token = sign(
      { name: user.name, email: user.email },
      process.env.JWT_SECRET,
      {
        subject: user.id,
        expiresIn: "30d",
      }
    );

    return {
      id: user?.id,
      name: user?.name,
      email: user?.email,
      roles: user?.roles,
      token: token,
    };
  }
}

export { AuthUserService };
