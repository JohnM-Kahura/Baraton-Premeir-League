import 'package:bpl/config/global_colors.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fixtures extends StatefulWidget {
  const Fixtures({Key? key}) : super(key: key);

  @override
  _FixturesState createState() => _FixturesState();
}

class _FixturesState extends State<Fixtures> {
  // Stream<QuerySnapshot> fixtures =
  //     FirebaseFirestore.instance.collection('fixtures').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: SizedBox(
          height: 50,
          child: Image.asset('assets/baraton_logo.png'),
        ),
        title: Text('Premier League',style: heading,),
      ),
      backgroundColor: backgroundColor,
      // body: StreamBuilder<QuerySnapshot>(stream: fixtures,builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
      //   if(snapshot.hasError){
      //     return const  Text('Something went wrong');
      //   }
      //     if(snapshot.connectionState==ConnectionState.waiting){
      //       return const  Center(child: CircularProgressIndicator() ,);
      //     }
      //     final fixtures=snapshot.requireData;
      //     return ListView.builder(
      //     itemCount: 1,
      //     itemBuilder: (BuildContext context, int index) {  
      //       return Container(
      //         color: Colors.white,
      //         margin: const EdgeInsets.only(
      //           top: 5,
      //         ),
      //         child: Column(
      //           children: [
      //             Container(
      //               color: backgroundColor,
      //               child: Row(
      //                 children: [
      //                   Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: Text(
                          
      //                       fixtures.docs[index]['date_time'].toDate().toString(),
      //                       style: GoogleFonts.poppins(
      //                         letterSpacing: 1.5,
      //                         fontWeight: FontWeight.w800,
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             const Divider(
      //               height: 2,
      //             ),
      //             match('Gongagonga', 'Black Eagles', '11:00'),
      //             const Divider(
      //               height: 1,
      //             ),
      //             match('Rangers', 'Clippers', '17:00'),
      //             const Divider(
      //               height: 1,
      //             ),
      //             match('Nurses', 'Black Eagles', '15:00'),
      //             const Divider(
      //               height: 1,
      //             ),
      //           ],
      //         ),
      //       );
      //     });
      // },),
      body:Center(child: Text('fixtures'),) ,
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
