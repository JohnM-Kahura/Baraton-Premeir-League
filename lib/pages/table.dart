import 'package:bpl/config/global_colors.dart';
import 'package:flutter/material.dart';

class BPLTable extends StatefulWidget {
  const BPLTable({Key? key}) : super(key: key);

  @override
  _BPLTableState createState() => _BPLTableState();
}

class _BPLTableState extends State<BPLTable> {
  bool showPreviousTables= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title:const Center(child: Text('League Table')), elevation: 0, actions: [
        IconButton(
          onPressed: () {
            setState(() {
              showPreviousTables=!showPreviousTables;
            });
          },
          icon: const Icon(Icons.event),
        ),
      ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10),
            child: Center(
              child: Text(
                '2021/2022.2',
                style: heading,
              ),
            ),
          ),
          Container(
            // margin: const EdgeInsets.all(10),
            child: Table(
              columnWidths: Map.from({
                // TODO: make this more responsive
                0: FixedColumnWidth(30),
                1: FixedColumnWidth(110),
                2: FixedColumnWidth(30),
                3: FixedColumnWidth(30),
                4: FixedColumnWidth(30),
                5: FixedColumnWidth(30),
                6: FixedColumnWidth(30),
                7: FixedColumnWidth(30),
                8: FixedColumnWidth(30),
              }),
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  Text('No.', style: rowHeading, textAlign: center),
                  Text('Teams', style: rowHeading, textAlign: center),
                  Text('P', style: rowHeading, textAlign: center),
                  Text('W', style: rowHeading, textAlign: center),
                  Text('D', style: rowHeading, textAlign: center),
                  Text('L', style: rowHeading, textAlign: center),
                  Text('GD', style: rowHeading, textAlign: center),
                  Text('Pts', style: rowHeading, textAlign: center),
                ]),
                entry('1.','Gongagonga','6','5', '1','0','8','16'),
                entry('2.','Zambarani','6','4', '2','0','6','14'),
                entry('3.','Black Eagles','6','5', '1','0','8','13'),
                entry('4.','Nurses','6','5', '1','0','4','13'),
                entry('5.','Clippers','6','5', '1','0','11','12'),
                entry('6.','Sigalagala','6','5', '1','0','8','12'),
                entry('7.','Veterans','6','5', '1','0','-6','4'),
                entry('8.','Pirates','6','5', '1','0','-6','4'),
                entry('9.','Snipers','6','5', '1','0','-7','4  '),
                entry('10.','Rangers','6','5', '1','0','-6','3'),
                entry('11.','Rovers','6','5', '1','0','-9','3'),
                entry('12.','Yanga','6','5', '1','0','-12','3'),
              ],
            ),
          ),
          Container(margin:const EdgeInsets.all(10),child: Row(children: [Text('Share table with',style: heading,),const Icon(Icons.share)],))
,        TextButton(onPressed: (){}, child:Text(' WhatsApp'))
        ],
      ),
    );
  }
}

TableRow entry(String pos, String team, String gamesPlayed, String wins,
    String draws, String losses, String goalDiff, String points) {
  return TableRow(children: [
    Text(pos,textAlign: center,),
    Text(team,textAlign: TextAlign.justify,),
    Text(gamesPlayed,textAlign: center,),
    Text(wins,textAlign: center,),
    Text(draws,textAlign: center,),
    Text(losses,textAlign: center,),
    Text(goalDiff,textAlign: center,),
    Text(points,textAlign: center,),
  ]);
}
