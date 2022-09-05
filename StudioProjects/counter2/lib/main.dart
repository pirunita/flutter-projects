import 'package:flutter/material.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Counter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: "Flutter counter demo home page")
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  void _decrementCounter() {
    setState(() => _counter--);
  }

  void _resetCounter() {
    setState(() => _counter = 0);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 50.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.25),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Image.asset(
                "images/flutter_logo_1080.png",
                width: 100.0,
              ),
            ),
            const Text(
              "You have pushed the button this many times: ",
            ),
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.headline4
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                    onPressed: _decrementCounter,
                    child: Text("Decrement Counter"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)
                    ),

                ),
                ElevatedButton(
                    onPressed: _incrementCounter,
                    child: Text("Increment Counter"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue)
                    )
                )
              ]
            ),
          ]
        ),

      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: "Reset Counter",
        child: new Icon(Icons.refresh)
      ),
    );
  }
}