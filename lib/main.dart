import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var width  = 200.0;
  var height = 200.0;

  void updateContainerSize() {
    this.width = 300.0;
    this.height = 300.0;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(seconds: 1),
          tween: Tween<double>(begin: 0, end: 2 * math.pi),
          builder: (_, double angle, __) {
            return Transform.rotate(
              angle: angle,
              child: Container(
                color: Colors.red,
                width: width,
                height: height,
              ),
            );
          },
        )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: updateContainerSize,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
