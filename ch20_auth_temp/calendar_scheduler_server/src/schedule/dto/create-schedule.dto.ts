import { Schedule } from '../entities/schedule.entity';
import { OmitType } from '@nestjs/swagger';

export class CreateScheduleDto extends OmitType(Schedule, ['id']) {}
