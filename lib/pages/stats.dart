import 'package:bpl/config/global_colors.dart';
import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
   getViableFixtureDates(DateTime now) {
   int  currentMonth = now.month;
  




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar:
          AppBar(elevation: 0, title: const Center(child: Text('Statistics'))),
      body: SingleChildScrollView(
          child: Column(children: [
        startContainer('John Doe', '30', 'Goals'),
        startContainer('John Alex', '30', 'Assits'),
        startContainer('Zambarani', '30', 'Goals'),
        startContainer('Clippers', '30', 'Clean Sheets'),
      ])),
      floatingActionButton:
          FloatingActionButton(onPressed: getViableFixtureDates(DateTime.now())),
    );
  }

  Container startContainer(String title, String number, String statistic) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(title),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.grey),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text(number), Text(statistic)],
            ),
          )
        ],
      ),
    );
  }
}
