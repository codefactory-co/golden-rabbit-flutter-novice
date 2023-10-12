import { BadRequestException, Injectable, UnauthorizedException } from "@nestjs/common";
import { JwtService } from "@nestjs/jwt";
import { v4 as uuid } from "uuid";

const JWT_SECRET = "codefactory";

export class UserModel {
  id: string;
  email: string;
  password: string;
  createdAt: Date;
}

@Injectable()
export class AuthService {
  users: UserModel[] = [];

  constructor(
    private readonly jwtService: JwtService
  ) {
  }

  extractTokenFromHeader(header: string, isBearer: boolean) {
    // 'Basic {token}'
    // [Basic, {token}]
    // 'Bearer {token}'
    // [Bearer, {token}]
    const splitToken = header.split(" ");

    const prefix = isBearer ? "Bearer" : "Basic";

    if (splitToken.length !== 2 || splitToken[0] !== prefix) {
      throw new UnauthorizedException("잘못된 토큰입니다!");
    }

    const token = splitToken[1];

    return token;
  }


  decodeBasicToken(base64String: string) {
    const decoded = Buffer.from(base64String, "base64").toString("utf8");

    const split = decoded.split(":");

    if (split.length !== 2) {
      throw new UnauthorizedException("잘못된 유형의 토큰입니다.");
    }

    const email = split[0];
    const password = split[1];

    return {
      email,
      password
    };
  }

  verifyToken(token: string) {
    try {
      return this.jwtService.verify(token, {
        secret: JWT_SECRET
      });
    } catch (e) {
      throw new UnauthorizedException("토큰이 만료됐거나 잘못된 토큰입니다.");
    }
  }

  rotateToken(token: string, isRefreshToken: boolean) {
    const decoded = this.jwtService.verify(token, {
      secret: JWT_SECRET
    });

    /**
     * sub: id
     * email: email,
     * type: 'access' | 'refresh'
     */
    if (decoded.type !== "refresh") {
      throw new UnauthorizedException("토큰 재발급은 Refresh 토큰으로만 가능합니다!");
    }

    return this.signToken({
      ...decoded
    }, isRefreshToken);
  }

  signToken(user: Pick<UserModel, "email" | "id">, isRefreshToken: boolean) {
    const payload = {
      email: user.email,
      sub: user.id,
      type: isRefreshToken ? "refresh" : "access"
    };

    return this.jwtService.sign(payload, {
      secret: JWT_SECRET,
      // seconds
      expiresIn: isRefreshToken ? 3600 : 300
    });
  }

  loginUser(user: { email: string, id: string }) {
    return {
      accessToken: this.signToken(user, false),
      refreshToken: this.signToken(user, true)
    };
  }

  getUserByEmail(email: string) {
    const result = this.users.filter(user => user.email === email);

    if (result.length === 0) {
      return null;
    }

    return result[0];
  }

  async authenticateWithEmailAndPassword(user: Pick<UserModel, "email" | "password">) {
    /**
     * 1. 사용자가 존재하는지 확인 (email)
     * 2. 비밀번호가 맞는지 확인
     * 3. 모두 통과되면 찾은 상용자 정보 반환
     */
    const existingUser = this.getUserByEmail(user.email);

    if (!existingUser) {
      throw new UnauthorizedException("존재하지 않는 사용자입니다.");
    }

    /**
     * 파라미터
     *
     * 1) 입력된 비밀번호
     * 2) 기존 해시 (hash) -> 사용자 정보에 저장돼있는 hash
     */
    const passOk = existingUser.password === user.password;

    if (!passOk) {
      throw new UnauthorizedException("비밀번호가 틀렸습니다.");
    }

    return existingUser;
  }

  async loginWithEmail(user: Pick<UserModel, "email" | "password">) {
    const existingUser = await this.authenticateWithEmailAndPassword(user);

    return this.loginUser(existingUser);
  }

  async registerWithEmail(user: Pick<UserModel, "email" | "password">) {
    console.log(this.users);
    if (this.users.some(existing => existing.email === user.email)) {
      throw new BadRequestException("이미 가입한 이메일입니다.");
    }

    const newUser: UserModel = {
      id: uuid(),
      ...user,
      createdAt: new Date()
    };

    this.users = [
      ...this.users,
      newUser
    ];

    return this.loginUser(newUser);
  }
}
