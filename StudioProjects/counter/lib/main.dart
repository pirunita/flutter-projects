import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 변화가 필요없는 화면을 구성할 때 사용하는 위젯 클래스, build 메서드는 한 번만 호출
  @override
  Widget build(BuildContext context) {
    // 1. BuildContext는 widget tree에서 widget의 위치를 다루는 클래스
    // Flutter 내부의 모든 Widget은 내부에 build method를 갖고 있고
    // build method의 타입은 Widget이며 인자값으로 BuildContext를 갖는다.
    // 2. 모든 위젯은 자신만의 BuildContext를 가지고 있고, 그것은 StatelessWidget.build 혹은
    // State.build에 의해 반환되는 위젯의 부모가 된다. 즉, 모든 build 메서드는 widget tree에서
    // widget의 위치를 참조하는 BuildContext 하나를 인수로 받는다.
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page')
    );
  }
}

// 위젯 클래스
class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  // 1. Key는 widget tree에서 widget이 움직일때 마다 현재 상태를 보존하는 역할
  // key는 주로 element가 widget을 식별하는 데 사용
  // MyHomePage 클래스의 생성자(constructor)는 key와 title property를 옵션으로 받아서 super 키워드로
  // 부모 클래스의 생성자에 key를 전달
  // 2. const는 변경할 수 없는 widget instance

  final String title;
  // final 변수는 한 번만 할당할 수 있으며 클래스 수준에서 변수를 할당하기 전에 선언
  // 클래스의 생성자(constructor) 에서 할당하는 모든 변수에 final을 사용

  @override
  _MyHomePageState createState() => _MyHomePageState();
  // 모든 StatefulWidget은 State 객체를 반환하는 createState method를 반드시 정의해야 한다.
}

class _MyHomePageState extends State<MyHomePage> {
  // 상태 클래스는 플러터의 State 클래스를 상속받는다.
  int _counter = 0;

  void _incrementCounter() {
    // StatefulWidget의 상태를 변경할 때 호출하는 메서드, 상태 변화에 따라 재구성되어야 할 때 사용
    // setState 메서드가 호출될 때마다 build 메서드를 재호출하여 화면을 다시 그린다
    setState(() {
      _counter++;
    });
    // setState는 콜백을 인수로 받으며 이 콜백은 위젯의 상태를 갱신
  }

  @override
  Widget build(BuildContext context){
    // scaffold는 material design(구글식 디자인 컨)의 시각적인 레이아웃 구조를 실행
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            )
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        // callback을 받는 property. callback을 이용해 부모 위젯에서 상태를 관리
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

