import { IsString } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class DeleteScheduleDto {
  @IsString()
  @ApiProperty({
    description: '삭제할 일정 ID',
    example: '2b6e8520-a6b9-431e-b9bd-1c2a97f73731',
  })
  id: string;
}
