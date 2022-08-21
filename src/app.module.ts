import { MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './controllers/api/app.controller';
import { DatabaseConfiguration } from 'config/database.configuration';
import { Administrator } from 'entities/Administrator';
import { AdministratorService } from './services/administrator/administrator.service';
import { Article } from 'entities/Article';
import { ArticleFeature } from 'entities/ArticleFeature';
import { ArticlePrice } from 'entities/ArticlePrice';
import { Cart } from 'entities/Cart';
import { CartArticle } from 'entities/CartArticle';
import { Category } from 'entities/Category';
import { Feature } from 'entities/Feature';
import { Order } from 'entities/Order';
import { Photo } from 'entities/Photo';
import { User } from 'entities/User';
import { AdministratorController } from './controllers/api/administrator.controller';
import { CategoryController } from './controllers/api/category.controller';
import { CategoryService } from './services/category/category.service';
import { ArticleService } from './services/article/article.service';
import { ArticleController } from './controllers/api/article.controller';
import { AuthController } from './controllers/api/auth.controller';
import { AuthMiddleware } from './middlewares/auth.middleware';
import { PhotoService } from './services/photo/photo.service';

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
    ],
    controllers: [
        AppController,
        AdministratorController,
        CategoryController,
        ArticleController,
        AuthController,
    ],
    providers: [AdministratorService, CategoryService, ArticleService, PhotoService],
    exports: [AdministratorService],
})
export class AppModule implements NestModule {
    configure(consumer: MiddlewareConsumer) {
        consumer.apply(AuthMiddleware).exclude('auth/*').forRoutes('api/*');
    }
}
