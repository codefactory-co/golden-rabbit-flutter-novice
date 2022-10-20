import 'package:cf_tube/const/api.dart';
import 'package:dio/dio.dart';
import 'package:cf_tube/model/video_model.dart';

class YoutubeRepository {
  static Future<List<VideoModel>> getVideos() async {
    final resp = await Dio().get(  // ➊ GET 메서드 보내기
      YOUTUBE_API_BASE_URL,  // 요청을 보낼 URL
      queryParameters: {     // 요청에 포함할 쿼리 변수들
        'channelId': CF_CHANNEL_ID,
        'maxResults': 50,
        'key': API_KEY,
        'part': 'snippet',
        'order': 'date',
      },
    );

    final listWithData = resp.data['items'].where(
          (item) =>
      item?['id']?['videoId'] != null && item?['snippet']?['title'] != null,
    );  // videoId와 title이 null이 아닌 값들만 필터링

    return listWithData
        .map<VideoModel>(
          (item) => VideoModel(
        id: item['id']['videoId'],
        title: item['snippet']['title'],
      ),
    )
        .toList();  // 필터링된 값들을 기반으로 VideoModel 생성
  }
}
