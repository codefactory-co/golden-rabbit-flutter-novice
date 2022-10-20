import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  static final LatLng companyLatLng = LatLng(  // ➊ 지도 초기화 위치
    37.5233273,  // 위도
    126.921252,  // 경도
  );
  static final Marker marker = Marker(
    markerId: MarkerId('company'),
    position: companyLatLng,
  );
  static final Circle circle = Circle(
    circleId: CircleId('choolCheckCircle'),
    center: companyLatLng, // 원의 중심이 되는 위치. LatLng값을 제공합니다.
    fillColor: Colors.blue.withOpacity(0.5), // 원의 색상
    radius: 100, // 원의 반지름 (미터 단위)
    strokeColor: Colors.blue, // 원의 테두리 색
    strokeWidth: 1, // 원의 테두리 두께
  );

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: FutureBuilder<String>(
          future: checkPermission(),
          builder: (context, snapshot) {
            // ❶ 로딩 상태
            if (!snapshot.hasData &&
                snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            // ➋ 권한 허가된 상태
            if(snapshot.data == '위치 권한이 허가 되었습니다.'){

              // 기존 Column 위젯 관련 코드
              return Column(
                children: [
                  Expanded( // 2/3만큼 공간 차지
                    flex: 2,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: companyLatLng,
                        zoom: 16,
                      ),
                      myLocationEnabled: true,
                      markers: Set.from([marker]),
                      circles: Set.from([circle]),
                    ),
                  ),
                  Expanded(  // 1/3만큼 공간 차지
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(  // 시계 아이콘
                          Icons.timelapse_outlined,
                          color: Colors.blue,
                          size: 50.0,
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(  // [출근하기] 버튼
                          onPressed: () async {
                            final curPosition = await Geolocator.getCurrentPosition();  // 현재 위치

                            final distance = Geolocator.distanceBetween(
                              curPosition.latitude,  // 현재위치 위도
                              curPosition.longitude,  // 현재위치 경도
                              companyLatLng.latitude,  // 회사위치 위도
                              companyLatLng.longitude,  // 회사위치 경도
                            );
                            bool canCheck =
                                distance < 100; // 100미터 이내에 있으면 출근 가능

                            showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text('출근하기'),
                                  // 출근 가능 여부에 따라 다른 메시지 제공
                                  content: Text(
                                    canCheck ? '출근을 하시겠습니까?' : '출근할수 없는 위치입니다.',
                                  ),
                                  actions: [
                                    TextButton(
                                      // 취소를 누르면 false 반환
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: Text('취소'),
                                    ),
                                    if (canCheck) // 출근 가능한 상태일 때만 [출근하기] 버튼 제공
                                      TextButton(
                                        // 출근하기를 누르면 true 반환
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: Text('출근하기'),
                                      ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text('출근하기!'),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            // ➌ 권한 없는 상태
            return Center(
              child: Text(
                snapshot.data.toString(),
              ),
            );
          }
      ),
    );
  }

  AppBar renderAppBar() {
    // AppBar를 구현하는 함수
    return AppBar(
      title: Text(
        '오늘도 출근',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Future<String> checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();   // 위치 서비스 활성화여부 확인

    if (!isLocationEnabled) {  // 위치 서비스 활성화 안 됨
      return '위치 서비스를 활성화해주세요.';
    }

    LocationPermission checkedPermission = await Geolocator.checkPermission();  // 위치 권한 확인

    if (checkedPermission == LocationPermission.denied) {  // 위치 권한 거절됨

      // 위치 권한 요청하기
      checkedPermission = await Geolocator.requestPermission();

      if (checkedPermission == LocationPermission.denied) {
        return '위치 권한을 허가해주세요.';
      }
    }

    // 위치 권한 거절됨 (앱에서 재요청 불가)
    if (checkedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 설정에서 허가해주세요.';
    }

    // 위 모든 조건이 통과되면 위치 권한 허가완료
    return '위치 권한이 허가 되었습니다.';
  }
}
