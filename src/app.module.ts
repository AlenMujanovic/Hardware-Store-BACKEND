import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './controllers/app.controller';
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
    TypeOrmModule.forFeature([Administrator]),
  ],
  controllers: [AppController, AdministratorController],
  providers: [AdministratorService],
})
export class AppModule {}
