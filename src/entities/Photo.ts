import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Article } from './Article';

@Index('uq_photo_image_path', ['imagePath'], { unique: true })
@Index('fk_photo_article_id', ['articleId'], {})
@Entity('photo')
export class Photo {
  @PrimaryGeneratedColumn({ type: 'int', name: 'photo_id', unsigned: true })
  photoId: number;

  @Column('int', { name: 'article_id', unsigned: true })
  articleId: number;

  @Column('varchar', { name: 'image_path', unique: true, length: 128 })
  imagePath: string;

  @ManyToOne(() => Article, (article) => article.photos, {
    onDelete: 'CASCADE',
    onUpdate: 'RESTRICT',
  })
  @JoinColumn([{ name: 'article_id', referencedColumnName: 'articleId' }])
  article: Article;
}
