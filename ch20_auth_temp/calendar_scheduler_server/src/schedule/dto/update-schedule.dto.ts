import { PartialType } from '@nestjs/swagger';
import { CreateScheduleDto } from './create-schedule.dto';
import { IsString } from 'class-validator';
import { Schedule } from '../entities/schedule.entity';

export class UpdateScheduleDto extends PartialType(Schedule) {}
