import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Cart } from 'src/entities/Cart';
import { Repository } from 'typeorm';
import { Order } from 'src/entities/Order';
import { ApiResponse } from 'src/misc/api.response.class';

@Injectable()
export class OrderService {
    constructor(
        @InjectRepository(Cart)
        private readonly cart: Repository<Cart>,

        @InjectRepository(Order)
        private readonly order: Repository<Order>,
    ) {}

    async add(cartId: number): Promise<Order | ApiResponse> {
        const order = await this.order.findOne({ where: { cartId: cartId } });

        if (order) {
            return new ApiResponse('error', -7001, 'An order for this cart has already been made.');
        }

        const cart = await this.cart.findOne({
            where: { cartId },
            relations: ['cartArticles'],
        });

        if (!cart) {
            return new ApiResponse('error', -7002, 'No such cart found.');
        }

        if (cart.cartArticles.length === 0) {
            return new ApiResponse('error', -7003, 'This cart is empty.');
        }

        const newOrder: Order = new Order();
        newOrder.cartId = cartId;
        const savedOrder = await this.order.save(newOrder);

        return await this.order.findOne({
            where: { orderId: savedOrder.orderId },
            relations: [
                'cart',
                'cart.user',
                'cart.cartArticles',
                'cart.cartArticles.article',
                'cart.cartArticles.article.category',
                'cart.cartArticles.article.articlePrices',
            ],
        });
    }

    async getById(orderId: number) {
        return await this.order.findOne({
            where: { orderId },
            relations: [
                'cart',
                'cart.user',
                'cart.cartArticles',
                'cart.cartArticles.article',
                'cart.cartArticles.article.category',
                'cart.cartArticles.article.articlePrices',
            ],
        });
    }

    async changeStatus(orderId: number, newStatus: 'rejected' | 'accepted' | 'shipped' | 'pending') {
        const order = await this.getById(orderId);

        if (!order) {
            return new ApiResponse('error', -9001, 'No such order found!');
        }

        order.status = newStatus;

        await this.order.save(order);

        return await this.getById(orderId);
    }
}
