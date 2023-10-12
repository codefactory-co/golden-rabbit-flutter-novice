import { IsDate, IsNumber, IsString } from 'class-validator';
import { CreateScheduleDto } from '../dto/create-schedule.dto';
import { v4 as uuid } from 'uuid';
import { ApiProperty } from '@nestjs/swagger';
import { Transform } from 'class-transformer';
import * as moment from 'moment';

export class Schedule {
  static fromCreateScheduleDto(dto: CreateScheduleDto) {
    return new Schedule(dto);
  }

  constructor(params: Omit<Schedule, 'id'>) {
    this.id = uuid();
    this.userId = params.userId;
    this.content = params.content;
    this.date = moment(params.date, 'YYYYMMDD');
    this.startTime = params.startTime;
    this.endTime = params.endTime;
  }

  @ApiProperty({
    name: 'id',
    description: '아이디',
    example: '1952a209-7c26-4f50-bc65-086f6e64dbbd',
  })
  id: string;

  @ApiProperty({
    name: 'userId',
    description: '유저 ID',
    example: '1',
  })
  userId: string;

  @ApiProperty({
    name: 'content',
    description: '일정 내용',
    example: '프로그래밍 공부하기',
  })
  content: string;

  @ApiProperty({
    name: 'date',
    description: '일정 날짜 (YYMMDD)',
    example: '20210102',
  })
  @Transform(({ value }) => value.format('YYYYMMDD'), {toPlainOnly: true})
  @Transform(({ value }) => moment(value), {toClassOnly:true})
  date: moment.Moment;

  @ApiProperty({
    name: 'startTime',
    description: '시작 시간',
    example: '12',
  })
  startTime: number;

  @ApiProperty({
    name: 'endTime',
    description: '마감 시간',
    example: '14',
  })
  endTime: number;

  @Transform(({ value }) => value.format('YYYYMMDD hh:mm:ss'), {toPlainOnly: true})
  createdAt: moment.Moment = moment();
}
