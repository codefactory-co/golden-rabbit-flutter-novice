import { PickType } from "@nestjs/mapped-types";
import {UserModel} from "../auth.service";

export class RegisterUserDto extends PickType(UserModel, ['email',  'password']){}