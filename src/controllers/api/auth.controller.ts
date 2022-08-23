import { Body, Controller, Post, Put, Req } from '@nestjs/common';
import { LoginAdministratorDto } from 'src/dtos/administrator/login.administrator.dto';
import { ApiResponse } from 'src/misc/api.response.class';
import { AdministratorService } from 'src/services/administrator/administrator.service';
import * as crypto from 'crypto';
import { LoginInfoAdministratorDto } from 'src/dtos/administrator/login.info.administrator.dto';
import * as jwt from 'jsonwebtoken';
import { JwtDataAdministratorDto } from 'src/dtos/administrator/jwt.data.administrator.dto';
import { Request } from 'express';
import { jwtSecret } from 'config/jwt.secret';
import { UserRegistrationDto } from 'src/dtos/user/user.registration.dto';
import { UserService } from 'src/services/user/user.service';

@Controller('auth')
export class AuthController {
    constructor(public administratorService: AdministratorService, public userService: UserService) {}

    @Post('login')
    async doLogin(
        @Body() data: LoginAdministratorDto,
        @Req() req: Request,
    ): Promise<LoginInfoAdministratorDto | ApiResponse> {
        const administrator = await this.administratorService.getByUsername(data.username);

        if (!administrator) {
            return new Promise((resolve) => {
                resolve(new ApiResponse('error', -3001));
            });
        }

        const passwordHash = crypto.createHash('sha512');
        passwordHash.update(data.password);
        const passwordHashString = passwordHash.digest('hex').toUpperCase();

        if (administrator.passwordHash !== passwordHashString) {
            return new Promise((resolve) => resolve(new ApiResponse('error', -3002)));
        }

        //token(JWT)
        const jwtData = new JwtDataAdministratorDto();
        jwtData.administratorId = administrator.administratorId;
        jwtData.username = administrator.username;
        let now = new Date();
        now.setDate(now.getDate() + 14);
        const expiringTimestamp = now.getTime() / 1000;
        jwtData.exp = expiringTimestamp;

        jwtData.ip = req.ip.toString();
        jwtData.ua = req.headers['user-agent'];

        let token: string = jwt.sign(jwtData.toPlainObject(), jwtSecret);
        const responseObject = new LoginInfoAdministratorDto(
            administrator.administratorId,
            administrator.username,
            token,
        );

        return new Promise((resolve) => resolve(responseObject));
    }

    @Put('user/register')
    async userRegister(@Body() data: UserRegistrationDto) {
        return await this.userService.register(data);
    }
}
