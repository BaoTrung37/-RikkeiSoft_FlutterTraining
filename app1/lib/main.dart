import 'package:app1/screens/screen2/screen2.dart';
import 'package:flutter/material.dart';

import 'screens/screen1/screen1.dart';
import 'screens/screen3/screen3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: const Text(
                'Screen 1',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Screen1();
                }));
              },
            ),
            RaisedButton(
              child: const Text(
                'Screen 2',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Screen2();
                }));
              },
            ),
            RaisedButton(
              child: const Text(
                'Screen 3',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Screen3();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
