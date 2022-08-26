import {
    Column,
    Entity,
    Index,
    JoinColumn,
    JoinTable,
    ManyToMany,
    ManyToOne,
    OneToMany,
    PrimaryGeneratedColumn,
} from 'typeorm';
import { Category } from './Category';
import { ArticleFeature } from './ArticleFeature';
import { ArticlePrice } from './ArticlePrice';
import { CartArticle } from './CartArticle';
import { Photo } from './Photo';
import { type } from 'os';
import { Feature } from './Feature';
import * as Validator from 'class-validator';
import { ArticleStatus } from 'src/types/article.status.enum';

@Index('fk_article_category_id', ['categoryId'], {})
@Entity('article', { schema: 'aplikacija' })
export class Article {
    @PrimaryGeneratedColumn({ type: 'int', name: 'article_id', unsigned: true })
    articleId: number;

    @Column('varchar', { name: 'name', length: 128 })
    @Validator.IsNotEmpty()
    @Validator.IsString()
    @Validator.Length(5, 128)
    name: string;

    @Column('int', { name: 'category_id', unsigned: true })
    categoryId: number;

    @Column('varchar', { name: 'excerpt', length: 255 })
    @Validator.IsNotEmpty()
    @Validator.IsString()
    @Validator.Length(10, 255)
    excerpt: string;

    @Column('text', { name: 'description' })
    @Validator.IsNotEmpty()
    @Validator.IsString()
    @Validator.Length(64, 10000)
    description: string;

    @Column('enum', {
        name: 'status',
        enum: ['available', 'visible', 'hidden'],
        default: () => "'available'",
    })
    @Validator.IsNotEmpty()
    @Validator.IsString()
    // @Validator.IsEnum(ArticleStatus)
    @Validator.IsIn(['available', 'visible', 'hidden'])
    status: 'available' | 'visible' | 'hidden';

    @Column('tinyint', {
        name: 'is_promoted',
        unsigned: true,
    })
    @Validator.IsNotEmpty()
    @Validator.IsIn([0, 1])
    isPromoted: number;

    @Column('timestamp', {
        name: 'created_at',
        default: () => 'CURRENT_TIMESTAMP',
    })
    createdAt: Date;

    @ManyToOne(() => Category, (category) => category.articles, {
        onDelete: 'CASCADE',
        onUpdate: 'RESTRICT',
    })
    @JoinColumn([{ name: 'category_id', referencedColumnName: 'categoryId' }])
    category: Category;

    @OneToMany(() => ArticleFeature, (articleFeature) => articleFeature.article)
    articleFeatures: ArticleFeature[];

    @ManyToMany((type) => Feature, (feature) => feature.articles)
    @JoinTable({
        name: 'article_feature',
        joinColumn: { name: 'article_id', referencedColumnName: 'articleId' },
        inverseJoinColumn: { name: 'feature_id', referencedColumnName: 'featureId' },
    })
    features: Feature[];

    @OneToMany(() => ArticlePrice, (articlePrice) => articlePrice.article)
    articlePrices: ArticlePrice[];

    @OneToMany(() => CartArticle, (cartArticle) => cartArticle.article)
    cartArticles: CartArticle[];

    @OneToMany(() => Photo, (photo) => photo.article)
    photos: Photo[];
}
