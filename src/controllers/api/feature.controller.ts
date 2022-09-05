import { Controller, Get, Param, UseGuards } from '@nestjs/common';
import { Crud } from '@nestjsx/crud';
import DistinctFeatureValuesDto from 'src/dtos/feature/distinct.feature.values.dto';
import { Feature } from 'src/entities/Feature';
import { AllowToRoles } from 'src/misc/allow.to.roles.descriptor';
import { RoleCheckerGuard } from 'src/misc/role.checker.guard';
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
    routes: {
        only: ['createOneBase', 'createManyBase', 'getManyBase', 'getManyBase', 'updateOneBase'],
        createOneBase: {
            decorators: [UseGuards(RoleCheckerGuard), AllowToRoles('administrator')],
        },
        createManyBase: {
            decorators: [UseGuards(RoleCheckerGuard), AllowToRoles('administrator')],
        },
        updateOneBase: {
            decorators: [UseGuards(RoleCheckerGuard), AllowToRoles('administrator')],
        },
        getManyBase: {
            decorators: [UseGuards(RoleCheckerGuard), AllowToRoles('administrator', 'user')],
        },
        getOneBase: {
            decorators: [UseGuards(RoleCheckerGuard), AllowToRoles('administrator', 'user')],
        },
    },
})
export class FeatureController {
    constructor(public service: FeatureService) {}

    @Get('values/:categoryId')
    @UseGuards(RoleCheckerGuard)
    @AllowToRoles('administrator', 'user')
    async getDistinctValuesByCategoryId(
        @Param('categoryId') categoryId: number,
    ): Promise<DistinctFeatureValuesDto> {
        return await this.service.getDistinctValuesByCategoryId(categoryId);
    }
}
