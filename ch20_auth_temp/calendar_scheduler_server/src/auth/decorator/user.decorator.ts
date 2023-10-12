import { ExecutionContext, InternalServerErrorException, createParamDecorator } from "@nestjs/common";
import { UserModel } from "../auth.service";

export const User = createParamDecorator((data: keyof UserModel | undefined, context: ExecutionContext) => {
  const req = context.switchToHttp().getRequest();

  const user = req.user as UserModel;

  if (!user) {
    throw new InternalServerErrorException("User 데코레이터는 AccessTokenGuard와 함께 사용해야합니다. Request에 user 프로퍼티가 존재하지 않습니다!");
  }

  if (data) {
    return user[data];
  }

  return user;
});