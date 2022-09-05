import { Column, Entity, Index, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { Cart } from './Cart';
import * as Validator from 'class-validator';
import { Order } from './Order';

@Index('uq_user_email', ['email'], { unique: true })
@Index('uq_user_phone_number', ['phoneNumber'], { unique: true })
@Entity('user')
export class User {
    @PrimaryGeneratedColumn({ type: 'int', name: 'user_id', unsigned: true })
    userId: number;

    @Column('varchar', { name: 'email', unique: true, length: 255 })
    @Validator.IsNotEmpty()
    @Validator.IsEmail({
        allow_ip_domain: false,
        allow_utf8_local_part: true,
        require_tld: true,
    })
    email: string;

    @Column('varchar', { name: 'password_hash', length: 128 })
    @Validator.IsNotEmpty()
    @Validator.IsString()
    @Validator.IsHash('sha512')
    passwordHash: string;

    @Column('varchar', { name: 'forename', length: 64 })
    @Validator.IsNotEmpty()
    @Validator.IsString()
    @Validator.Length(2, 64)
    forename: string;

    @Column('varchar', { name: 'surname', length: 64 })
    @Validator.IsNotEmpty()
    @Validator.IsString()
    @Validator.Length(2, 64)
    surname: string;

    @Column('varchar', { name: 'phone_number', unique: true, length: 24 })
    @Validator.IsNotEmpty()
    @Validator.IsPhoneNumber(null) //+381....
    phoneNumber: string;

    @Column('text', { name: 'postal_address' })
    @Validator.IsNotEmpty()
    @Validator.IsString()
    @Validator.Length(10, 512)
    postalAddress: string;

    @OneToMany(() => Cart, (cart) => cart.user)
    carts: Cart[];
}
