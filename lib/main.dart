import 'package:flutter/material.dart';
import './screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto',
      theme: ThemeData(
        primaryColor: Color(0XFF424242),
        accentColor: Colors.tealAccent,
      ),
      home: HomePage(),
    );
  }
}
