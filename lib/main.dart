import 'package:first/background.dart';
import 'package:flutter/material.dart';


Future <void> main() async => runApp(
  MaterialApp(
    home: Home(),
  ),);
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Background(),

    );
  }
}
