import { Request, Response } from "express";
import { CreateUserService } from "../../services/user/CreateUserService";



class CreateUserController {
    async handle(request: Request, response: Response) {
      const { name, email, password, roles } = request.body;
  
      console.log("Name:", name);
      console.log("Email:", email);
      console.log("Password:", password);
  
      const createUserService = new CreateUserService();
  
      const user = await createUserService.execute({
        name,
        email,
        password,
        roles
      });
  
      return response.json(user);
    }
  }

  export {CreateUserController}
  