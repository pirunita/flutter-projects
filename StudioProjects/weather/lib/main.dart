import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/models/src/app_settings.dart';

void main() {
  AppSettings settings = AppSettings();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
    // 1. SystemChrome은 native 플랫폼에서 앱이 표시되는 방법을 제어하는 플러터 클래스이며
    // 디바이스를 제어하는 데 사용하는 유일한 클래스다.
    // 2. setPreferredOrientations 를 이용해 세로모드로 앱을 설정 (portrait)
  ).then((_) => runApp(MyApp(settings: settings)));
  // 1. Future은 Dart의 모든 비동기 프로그래밍의 기초를 구성하는 클래스
  // 2. Future는 언젠가 값을 갖게 되겠지만 현재는 값이 없다.
  // 3. Future에 then을 사용할 수 있다.
  // 4. Future.then은 나중에 값을 구했을 때 실행할 콜백을 받는다.
  // 5. 콜백으로 준비된 값이 전달된다.
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){



    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      // 앱개발 동안 화면에 나타나는 배너를 제거하는 플래그
      theme: theme,
      // MaterialApp은 앱 전체의 테마를 처리
      home: PageContainer(settings: settings),
      // home은 앱의 홈페이지를 가리키며 모든 위젯은 home이 될 수 있다.
      // PageContainer은 날씨 앱을 구현하는 도중 만든 커스텀 위젯
    );
    // 1. MaterialApp 위젯은 전체 위젯 서브트리에 적용되는 다양한 기능을 제공
    // 2. MaterialApp은 플러터에서 제공하는 최상위 수준의 위젯 WidgetsApp을 상속받음.
    // 3. WidgetsApp은 네비게이터 설정, 앱 전반의 테마 사용 등 대부분의 모바일 앱에 필요한 기능을
    // 추상화 하여 제공하는 편리한 위젯이며 기본 설정, 스타일, 앱 구조를 제한하지 않으므로 커스터마이즈 가능
    // 4. WidgetsApp을 직접 사용하려면 많은 부분의 작업이 필요하며 일반적으로 직접 사용하지 않음.
    // 5. MaterialApp은 WidgetsApp에 비해 편리하게 사용할 수 있으며 머터리얼 디자인 전용 기능과 스타일 옵션 제공
    // 6. MaterialApp은 Material 스타일 가이드라인을 따른다.
  }
}