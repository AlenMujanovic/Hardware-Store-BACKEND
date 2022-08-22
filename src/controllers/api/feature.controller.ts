import { Controller } from '@nestjs/common';
import { Crud } from '@nestjsx/crud';
import { Feature } from 'src/entities/Feature';
import { FeatureService } from 'src/services/feature/feature.service';

@Controller('api/feature')
@Crud({
    model: {
        type: Feature,
    },
    params: {
        id: {
            field: 'featureId',
            type: 'number',
            primary: true,
        },
    },
    query: {
        join: {
            articleFeature: {
                eager: false,
            },
            category: {
                eager: true,
            },
            articles: {
                eager: true,
            },
        },
    },
})
export class FeatureController {
    constructor(public service: FeatureService) {}
}
