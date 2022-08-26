import { Column, Entity, Index, JoinColumn, OneToOne, PrimaryGeneratedColumn } from 'typeorm';
import { Cart } from './Cart';
import * as Validator from 'class-validator';

@Index('uq_order_cart_id', ['cartId'], { unique: true })
@Entity('order')
export class Order {
    @PrimaryGeneratedColumn({ type: 'int', name: 'order_id', unsigned: true })
    orderId: number;

    @Column('timestamp', {
        name: 'created_at',
        default: () => 'CURRENT_TIMESTAMP',
    })
    createdAt: Date;

    @Column('int', { name: 'cart_id', unique: true, unsigned: true })
    cartId: number;

    @Column('enum', {
        name: 'status',
        enum: ['rejected', 'accepted', 'shipped', 'pending'],
        default: () => "'pending'",
    })
    @Validator.IsNotEmpty()
    @Validator.IsString()
    @Validator.IsIn(['rejected', 'accepted', 'shipped', 'pending'])
    status: 'rejected' | 'accepted' | 'shipped' | 'pending';

    @OneToOne(() => Cart, (cart) => cart.order, {
        onDelete: 'CASCADE',
        onUpdate: 'RESTRICT',
    })
    @JoinColumn([{ name: 'cart_id', referencedColumnName: 'cartId' }])
    cart: Cart;
}
