import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { ArticleFeature } from './ArticleFeature';
import { Category } from './Category';

@Index('uq_feature_name_category_id', ['name', 'categoryId'], { unique: true })
@Index('fk_feature_category_id', ['categoryId'], {})
@Entity('feature')
export class Feature {
  @PrimaryGeneratedColumn({ type: 'int', name: 'feature_id', unsigned: true })
  featureId: number;

  @Column('varchar', { name: 'name', length: 32 })
  name: string;

  @Column('int', { name: 'category_id', unsigned: true })
  categoryId: number;

  @OneToMany(() => ArticleFeature, (articleFeature) => articleFeature.feature)
  articleFeatures: ArticleFeature[];

  @ManyToOne(() => Category, (category) => category.features, {
    onDelete: 'CASCADE',
    onUpdate: 'RESTRICT',
  })
  @JoinColumn([{ name: 'category_id', referencedColumnName: 'categoryId' }])
  category: Category;
}
