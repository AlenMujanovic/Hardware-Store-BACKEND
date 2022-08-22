import { Body, Controller, Param, Post, Req, UploadedFile, UseInterceptors } from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { Crud } from '@nestjsx/crud';
import { StorageConfig } from 'config/storage.config';
import { Article } from 'entities/Article';
import { AddArticleDto } from 'src/dtos/article/add.article.dto';
import { ArticleService } from 'src/services/article/article.service';
import { diskStorage } from 'multer';
import { PhotoService } from 'src/services/photo/photo.service';
import { Photo } from 'entities/Photo';
import { ApiResponse } from 'src/misc/api.response.class';
import * as fileType from 'file-type';
import * as fs from 'fs';
import * as sharp from 'sharp';

@Controller('api/article')
@Crud({
    model: {
        type: Article,
    },
    params: {
        id: {
            field: 'articleId',
            type: 'number',
            primary: true,
        },
    },
    query: {
        join: {
            category: {
                eager: true,
            },
            photos: {
                eager: true,
            },
            articlePrices: {
                eager: true,
            },
            articleFeatures: {
                eager: true,
            },
            features: {
                eager: true,
            },
        },
    },
})
export class ArticleController {
    constructor(public service: ArticleService, public photoService: PhotoService) {}

    @Post('createFull')
    createFullArticle(@Body() data: AddArticleDto) {
        return this.service.createFullArticle(data);
    }

    @Post(':id/uploadPhoto')
    @UseInterceptors(
        FileInterceptor('photo', {
            storage: diskStorage({
                destination: StorageConfig.photoDestination,
                filename: (req, file, callback) => {
                    let original: string = file.originalname;

                    let normalized = original.replace(/\s+/g, '-');
                    normalized = normalized.replace(/[^A-z0-9\.\-]/g, '');
                    let sada = new Date();
                    let datePart = '';
                    datePart += sada.getFullYear().toString();
                    datePart += (sada.getMonth() + 1).toString();
                    datePart += sada.getDate().toString();

                    let randomPart: string = new Array(10)
                        .fill(0)
                        .map((e) => (Math.random() * 9).toFixed(0).toString())
                        .join('');

                    let fileName = datePart + '-' + randomPart + '-' + normalized;

                    fileName = fileName.toLocaleLowerCase();

                    callback(null, fileName);
                },
            }),
            fileFilter: (req, file, callback) => {
                if (!file.originalname.toLowerCase().match(/\.(jpg|png)$/)) {
                    req.fileFilterError = 'Bad file extension!';
                    callback(null, false);
                    return;
                }

                if (!file.mimetype.includes('jpeg') || file.mimetype.includes('png')) {
                    req.fileFilterError = 'Bad file content type!';
                    callback(null, false);
                    return;
                }
                callback(null, true);
            },

            limits: {
                files: 1,
                fileSize: StorageConfig.photoMaxFileSize,
            },
        }),
    )
    async uploadPhoto(
        @Param('id') articleId: number,
        @UploadedFile() photo,
        @Req() req,
    ): Promise<ApiResponse | Photo> {
        if (req.fileFilterError) {
            return new ApiResponse('error', -4002, req.fileFilterError);
        }

        if (!photo) {
            return new ApiResponse('error', -4002, 'File not uploaded');
        }

        const fileTypeResult = await fileType.fromFile(photo.path);
        if (!fileTypeResult) {
            fs.unlinkSync(photo.path);
            return new ApiResponse('error', -4002, 'Cannot detect file type');
        }

        const realMimeType = fileTypeResult.mime;
        if (!realMimeType.includes('jpeg') || realMimeType.includes('png')) {
            fs.unlinkSync(photo.path);
            return new ApiResponse('error', -4002, 'Bad file content type!');
        }

        await this.createThumb(photo);
        await this.createSmallImage(photo);

        const newPhoto: Photo = new Photo();
        newPhoto.articleId = articleId;
        newPhoto.imagePath = photo.filename;

        const savedPhoto = await this.photoService.add(newPhoto);
        if (!savedPhoto) {
            return new ApiResponse('error', -4001);
        }
        return savedPhoto;
    }

    async createThumb(photo) {
        const orginalFilePath = photo.path;
        const fileName = photo.filename;

        const destinationFilePath = StorageConfig.photoDestination + 'thumb/' + fileName;

        await sharp(orginalFilePath)
            .resize({
                fit: 'cover',
                width: StorageConfig.photoThumbSize.width,
                height: StorageConfig.photoThumbSize.height,
                background: {
                    r: 255,
                    g: 255,
                    b: 255,
                    alpha: 0.0,
                },
            })
            .toFile(destinationFilePath);
    }

    async createSmallImage(photo) {
        const orginalFilePath = photo.path;
        const fileName = photo.filename;

        const destinationFilePath = StorageConfig.photoDestination + 'small/' + fileName;

        await sharp(orginalFilePath)
            .resize({
                fit: 'cover',
                width: StorageConfig.photoSmallSize.width,
                height: StorageConfig.photoSmallSize.height,
                background: {
                    r: 255,
                    g: 255,
                    b: 255,
                    alpha: 0.0,
                },
            })
            .toFile(destinationFilePath);
    }
}
