import 'package:bpl/config/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fixtures extends StatefulWidget {
  const Fixtures({Key? key}) : super(key: key);

  @override
  _FixturesState createState() => _FixturesState();
}

class _FixturesState extends State<Fixtures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Row(
                children: [
                  SizedBox(
                      height: 80,
                      child: Image.asset('assets/baraton_logo.png')),
                  Column(
                    children: [
                      Text('Premier', style: heading),
                      Text('League', style: heading),
                    ],
                  ),
                ],
              );
            }
            if (index == 1) {
              return Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: const Center(
                  child: Text(
                    'Fixtures',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }
            return Container(
              // height: 300,
              color: Colors.white,
              margin: const EdgeInsets.only(
                top: 5,
              ),
              child: Column(
                children: [
                  Container(
                    color: backgroundColor,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Friday 09 January 2022',
                            style: GoogleFonts.poppins(
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 2,
                  ),
                  match('Gongagonga', 'Black Eagles', '11:00'),
                  const Divider(
                    height: 1,
                  ),
                  match('Rangers', 'Clippers', '17:00'),
                  const Divider(
                    height: 1,
                  ),
                  match('Nurses', 'Black Eagles', '15:00'),
                  const Divider(
                    height: 1,
                  ),
                ],
              ),
            );
          }),
    );
  }

  Container match(String home, String away, String time) {
    return Container(
      color: Colors.white,
      height: 50,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(home),
          Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 223, 221, 221),
                ),
              ),
              child: Text(time)),
          Text(away),
        ],
      ),
    );
  }
}
