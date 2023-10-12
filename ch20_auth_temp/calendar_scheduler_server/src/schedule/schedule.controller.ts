import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  BadRequestException,
  Query, UseGuards
} from "@nestjs/common";
import { ScheduleService } from "./schedule.service";
import { Schedule } from "./entities/schedule.entity";
import { CreateScheduleDto } from "./dto/create-schedule.dto";
import { UpdateScheduleDto } from "./dto/update-schedule.dto";
import {
  ApiBadRequestResponse,
  ApiBody,
  ApiOperation,
  ApiParam,
  ApiQuery,
  ApiResponse,
  ApiTags,
  PickType
} from "@nestjs/swagger";
import { DeleteScheduleDto } from "./dto/delete-schedule.dto";
import * as moment from "moment";
import { AccessTokenGuard } from "../auth/guard/bearer-token.guard";
import { User } from "../auth/decorator/user.decorator";
import { UserModel } from "../auth/auth.service";

@ApiTags("schedule")
@Controller("schedule")
export class ScheduleController {
  constructor(private readonly scheduleService: ScheduleService) {
  }

  @Get()
  @ApiOperation({
    summary: "날짜를 기준으로 일정을 가져옵니다."
  })
  @ApiQuery({
    name: "date",
    type: String,
    description: "일정을 필터링 할 날짜",
    example: "20220102"
  })
  @ApiResponse({
    status: 200,
    description: "성공",
    type: Schedule
  })
  @UseGuards(AccessTokenGuard)
  get(
    @User() user: UserModel,
    @Query("date") date: string): Schedule[] {
    let parsedDate;

    try {
      parsedDate = moment(date, "YYYYMMDD");
    } catch (e) {
      throw new BadRequestException("잘못된 날짜입니다.");
    }

    return this.scheduleService.get(user.id, parsedDate);
  }

  @Post()
  @ApiOperation({ summary: "새로운 일정을 생성합니다." })
  @ApiResponse({
    status: 201,
    description: "새로 생성된 일정의 ID 값을 반환받을 수 있습니다.",
    type: PickType(Schedule, ["id"])
  })
  @ApiBody({
    type: CreateScheduleDto,
    description: "스케쥴 정보"
  })
  @UseGuards(AccessTokenGuard)
  post(
    @User() user: UserModel,
    @Body() createScheduleDto: CreateScheduleDto) {
    return this.scheduleService.create(user.id, createScheduleDto);
  }

  @Delete()
  @ApiOperation({ summary: "특정 일정을 삭제합니다." })
  @ApiResponse({
    status: 200,
    description: "삭제된 일정의 ID를 반환합니다.",
    type: PickType(Schedule, ["id"])
  })
  @ApiBody({
    type: DeleteScheduleDto,
    description: "삭제할 일정의 ID"
  })
  @UseGuards(AccessTokenGuard)
  delete(
    @User() user: UserModel,
    @Body() deleteScheduleDto: DeleteScheduleDto) {
    return this.scheduleService.delete(deleteScheduleDto.id);
  }
}
