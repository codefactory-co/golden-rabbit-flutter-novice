import { PipeTransform, Injectable, ArgumentMetadata } from '@nestjs/common';
import * as moment from 'moment';

@Injectable()
export class ValidationPipe implements PipeTransform {
  transform(value: any, metadata: ArgumentMetadata) {
    return moment(value, 'YYYYMMDD');
  }
}
