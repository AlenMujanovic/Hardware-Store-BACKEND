import { MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './controllers/api/app.controller';
import { DatabaseConfiguration } from 'config/database.configuration';
import { Administrator } from 'src/entities/Administrator';
import { AdministratorService } from './services/administrator/administrator.service';
import { Article } from 'src/entities/Article';
import { ArticleFeature } from 'src/entities/ArticleFeature';
import { ArticlePrice } from 'src/entities/ArticlePrice';
import { Cart } from 'src/entities/Cart';
import { CartArticle } from 'src/entities/CartArticle';
import { Category } from 'src/entities/Category';
import { Feature } from 'src/entities/Feature';
import { Order } from 'src/entities/Order';
import { Photo } from 'src/entities/Photo';
import { User } from 'src/entities/User';
import { AdministratorController } from './controllers/api/administrator.controller';
import { CategoryController } from './controllers/api/category.controller';
import { CategoryService } from './services/category/category.service';
import { ArticleService } from './services/article/article.service';
import { ArticleController } from './controllers/api/article.controller';
import { AuthController } from './controllers/api/auth.controller';
import { AuthMiddleware } from './middlewares/auth.middleware';
import { PhotoService } from './services/photo/photo.service';
import { FeatureService } from './services/feature/feature.service';
import { FeatureController } from './controllers/api/feature.controller';
import { UserService } from './services/user/user.service';
import { CartService } from './services/cart/cart.service';
import { UserCartController } from './controllers/api/user.cart.controller';
import { OrderService } from './services/order/order.service';
import { MailerModule } from '@nestjs-modules/mailer';
import { MailConfig } from 'config/mail.config';
import { OrderMailer } from './services/order/order.mailer.service';
import { AdministratorOrderController } from './controllers/api/administrator.order.controller';

@Module({
    imports: [
        TypeOrmModule.forRoot({
            type: 'mysql',
            host: DatabaseConfiguration.hostname,
            port: 3306,
            username: DatabaseConfiguration.username,
            password: DatabaseConfiguration.password,
            database: DatabaseConfiguration.database,
            entities: [
                Administrator,
                Article,
                ArticleFeature,
                ArticlePrice,
                Cart,
                CartArticle,
                Category,
                Feature,
                Order,
                Photo,
                User,
            ],
        }),
        TypeOrmModule.forFeature([
            Administrator,
            Article,
            ArticleFeature,
            ArticlePrice,
            Cart,
            CartArticle,
            Category,
            Feature,
            Order,
            Photo,
            User,
        ]),
        MailerModule.forRoot({
            transport:
                'smtps://' + MailConfig.username + ':' + MailConfig.password + '@' + MailConfig.hostname,
            defaults: {
                from: MailConfig.senderEmail,
            },
        }),
    ],
    controllers: [
        AppController,
        AdministratorController,
        CategoryController,
        ArticleController,
        AuthController,
        FeatureController,
        UserCartController,
        AdministratorOrderController,
    ],
    providers: [
        AdministratorService,
        CategoryService,
        ArticleService,
        PhotoService,
        FeatureService,
        UserService,
        CartService,
        OrderService,
        OrderMailer,
    ],
    exports: [AdministratorService, UserService],
})
export class AppModule implements NestModule {
    configure(consumer: MiddlewareConsumer) {
        consumer.apply(AuthMiddleware).exclude('auth/*').forRoutes('api/*');
    }
}
