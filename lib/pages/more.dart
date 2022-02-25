import 'package:flutter/material.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Center(child: Text('More')),
        elevation: 0,
      ),
      body: const  Center(child: Text('settings--> account----> set fav team'),),
    );
  }
}
