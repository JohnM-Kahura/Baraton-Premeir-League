import 'package:bpl/config/global_colors.dart';
import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: backgroundColor,
         appBar:AppBar(title:Center(child:Text('Stats'))),

    );
  }
}
