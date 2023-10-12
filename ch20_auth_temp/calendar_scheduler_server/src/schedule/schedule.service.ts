import { Injectable } from "@nestjs/common";
import { CreateScheduleDto } from "./dto/create-schedule.dto";
import { UpdateScheduleDto } from "./dto/update-schedule.dto";
import { Schedule } from "./entities/schedule.entity";
import * as moment from "moment";

@Injectable()
export class ScheduleService {
  schedules: Schedule[] = [];

  _getDateString(date: moment.Moment) {
    return date.format("YYYYMMDD");
  }

  get(userId: string, date: moment.Moment): Schedule[] {
    console.log('---------------------userid---------------');
    console.log(userId);
    console.log(this.schedules);
    return this.schedules.filter(
      (x) => this._getDateString(x.date) === this._getDateString(date) && x.userId === userId
    );
  }

  create(
    userId: string,
    schedule: CreateScheduleDto): Pick<Schedule, "id"> {
    const newSchedule = Schedule.fromCreateScheduleDto({
      userId,
      ...schedule
    });
    console.log(newSchedule);
    this.schedules = [...this.schedules, newSchedule];
    console.log(this.schedules);

    return {
      id: newSchedule.id
    };
  }

  delete(id: string): Pick<Schedule, "id"> {
    this.schedules = this.schedules.filter((x) => x.id != id);

    return {
      id
    };
  }
}
