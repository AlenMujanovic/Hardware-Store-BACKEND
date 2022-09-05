import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Article } from 'src/entities/Article';
import { Cart } from 'src/entities/Cart';
import { CartArticle } from 'src/entities/CartArticle';
import { Order } from 'src/entities/Order';
import { Repository } from 'typeorm';

@Injectable()
export class CartService {
    constructor(
        @InjectRepository(Cart)
        private readonly cart: Repository<Cart>,
        @InjectRepository(CartArticle)
        private readonly cartArticle: Repository<CartArticle>,
        @InjectRepository(Article)
        private readonly article: Repository<Article>,
        @InjectRepository(Order)
        private readonly order: Repository<Order>,
    ) {}

    async getLastActiveCartByUserId(userId: number): Promise<Cart | null> {
        const carts = await this.cart.find({
            where: {
                userId: userId,
            },
            order: {
                createdAt: 'DESC',
            },
            take: 1,
            relations: ['order'],
        });

        if (!carts || carts.length === 0) {
            return null;
        }

        const cart = carts[0];

        if (cart.order !== null) {
            return null;
        }

        return cart;
    }

    async createNewCartForUser(userId: number): Promise<Cart> {
        const newCart: Cart = new Cart();
        newCart.userId = userId;

        return await this.cart.save(newCart);
    }

    async addArticleToCart(cartId: number, articleId: number, quantity: number): Promise<Cart> {
        let record: CartArticle = await this.cartArticle.findOne({
            where: {
                cartId: cartId,
                articleId: articleId,
            },
        });

        if (!record) {
            record = new CartArticle();
            record.cartId = cartId;
            record.articleId = articleId;
            record.quantity = quantity;
        } else {
            record.quantity += quantity;
        }

        await this.cartArticle.save(record);

        return this.getById(cartId);
    }

    async getById(cartId: number): Promise<Cart> {
        return await this.cart.findOne({
            where: {
                cartId,
            },
            relations: [
                'cartArticles',
                'user',
                'cartArticles.article',
                'cartArticles.article.category',
                'cartArticles.article.articlePrices',
            ],
        });
    }

    async changeQuantity(cartId: number, articleId: number, newQuantity: number): Promise<Cart> {
        let record: CartArticle = await this.cartArticle.findOne({
            where: {
                cartId: cartId,
                articleId: articleId,
            },
        });

        if (record) {
            record.quantity = newQuantity;

            if (record.quantity === 0) {
                await this.cartArticle.delete(record.cartArticleId);
            } else {
                await this.cartArticle.save(record);
            }
        }

        return await this.getById(cartId);
    }
}
