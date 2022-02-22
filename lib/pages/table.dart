import 'dart:io';
import 'dart:typed_data';
import 'package:bpl/config/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class BPLTable extends StatefulWidget {
  const BPLTable({Key? key}) : super(key: key);

  @override
  _BPLTableState createState() => _BPLTableState();
}

class _BPLTableState extends State<BPLTable> {
  bool showPreviousTables = false;
  ScreenshotController controller = ScreenshotController();
  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'BPL_Table$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    bool isSuccess = result['isSuccess'];
    // test async suspension issue
    print(isSuccess);
    return result['filePath'];
  }

  Future saveAndShare(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('$directory/BPL-Table.png');
    image.writeAsBytes(bytes);
    await Share.shareFiles([image.path], text: 'Baraton premeir league table');
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: controller,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Center(child: Text('League Table')),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  showPreviousTables = !showPreviousTables;
                });
              },
              icon: const Icon(Icons.event),
            ),
          ],
        ),
        body: Stack(
          children: [
            if (showPreviousTables)
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView(
                  children:const  [
                    InkWell(child: Text('2020-2021')),
                    InkWell(child: Text('2019-2020')),
                    InkWell(child: Text('2018-20219')),
                  ],
                ),
              ),
            Column(
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
                const customTable(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        final image = await controller
                            .captureFromWidget(const customTable());
                        saveAndShare(image);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: const [
                            Text(
                              'Share',
                            ),
                            Icon(
                              Icons.share,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        final image = await controller
                            .captureFromWidget(const customTable());

                        await saveImage(image);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: const [
                            Text('Table'),
                            Icon(
                              Icons.download,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class customTable extends StatelessWidget {
  const customTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: Map.from({
        // TODO: make this more responsive
        0: FixedColumnWidth(30),
        1: FixedColumnWidth(105),
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
        entry('1.', 'Gongagonga', '6', '5', '1', '0', '8', '16'),
        entry('2.', 'Zambarani', '6', '4', '2', '0', '6', '14'),
        entry('3.', 'Black Eagles', '6', '5', '1', '0', '8', '13'),
        entry('4.', 'Nurses', '6', '5', '1', '0', '4', '13'),
        entry('5.', 'Clippers', '6', '5', '1', '0', '11', '12'),
        entry('6.', 'Sigalagala', '6', '5', '1', '0', '8', '12'),
        entry('7.', 'Veterans', '6', '5', '1', '0', '-6', '4'),
        entry('8.', 'Pirates', '6', '5', '1', '0', '-6', '4'),
        entry('9.', 'Snipers', '6', '5', '1', '0', '-7', '4  '),
        entry('10.', 'Rangers', '6', '5', '1', '0', '-6', '3'),
        entry('11.', 'Rovers', '6', '5', '1', '0', '-9', '3'),
        entry('12.', 'Yanga', '6', '5', '1', '0', '-12', '3'),
      ],
    );
  }
}

TableRow entry(String pos, String team, String gamesPlayed, String wins,
    String draws, String losses, String goalDiff, String points) {
  return TableRow(children: [
    Text(
      pos,
      textAlign: center,
    ),
    Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5, left: 5),
      child: Text(
        team,
        textAlign: TextAlign.justify,
      ),
    ),
    Text(
      gamesPlayed,
      textAlign: center,
    ),
    Text(
      wins,
      textAlign: center,
    ),
    Text(
      draws,
      textAlign: center,
    ),
    Text(
      losses,
      textAlign: center,
    ),
    Text(
      goalDiff,
      textAlign: center,
    ),
    Text(
      points,
      textAlign: center,
    ),
  ]);
}
