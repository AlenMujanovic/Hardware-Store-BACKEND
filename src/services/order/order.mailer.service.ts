import { MailerService } from '@nestjs-modules/mailer';
import { Injectable } from '@nestjs/common';
import { MailConfig } from 'config/mail.config';
import { CartArticle } from 'src/entities/CartArticle';
import { Order } from 'src/entities/Order';

@Injectable()
export class OrderMailer {
    constructor(private readonly mailService: MailerService) {}
    async sendOrderEmail(order: Order) {
        await this.mailService.sendMail({
            to: order.cart.user.email,
            bcc: MailConfig.orderNotificationMail,
            subject: 'Order details',
            encoding: 'UTF-8',
            replyTo: 'no-replay@domain.com',
            html: this.makeOrderHtml(order),
        });
    }

    private makeOrderHtml(order: Order): string {
        let suma = order.cart.cartArticles.reduce((sum, current: CartArticle) => {
            return (
                sum +
                current.quantitiy *
                    current.article.articlePrices[current.article.articlePrices.length - 1].price
            );
        }, 0);
        return `<p>Zahvaljujemo se za Vašu porudžbonu!</p>
                <p>Ovo su detalji Vaše porudžbine:</p>
                <ul>
                    ${order.cart.cartArticles
                        .map((cartArticle: CartArticle) => {
                            return `<li>
                            $ {cartArticle.article.name.} x
                            $ {cartArticle.quantity}
                            </li>`;
                        })
                        .join('')}
                </ul>
                <p>Ukupan iznos je: ${suma.toFixed(2)} EUR.</p>
                <p>Potpis...</p>
                `;
    }
}
