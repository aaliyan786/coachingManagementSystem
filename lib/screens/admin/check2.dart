//import 'package:coaching_management_system/repositories/globals.dart';
import 'package:flutter/material.dart';
import '../../repositories/student.dart';
import 'dart:math';


class Rowws extends StatefulWidget {

  const Rowws({Key? key,@required this.sid,this.sfname,this.mob,this.slname}) : super(key: key);
  final String? sid;
  final String? sfname;
  final String? slname;
  final String? mob;

  @override
  State<Rowws> createState() => _RowwsState();
}

class _RowwsState extends State<Rowws> {
  String? sid;
  String? sfname;
  String? slname;
  String? mob;

  @override
  void initState(){
    super.initState();
    sid=widget.sid!;
    sfname=widget.sfname!;
    slname=widget.slname!;
    mob=widget.mob!;
  }

  _deleteEmployee(String id){
    delStudent(id);
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Container(

          margin: const EdgeInsets.all(10),
          decoration:BoxDecoration(color: Colors.deepPurple,border: Border.all(width: 2.0)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                Center(child: Text(sid!)),
                Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(sfname!)),
                // const  Center(child: Text('3')),
                Center(child: Text(slname!)),
                Center(child: Text(mob!)),
                Center(child: Text(valuee().toString()),
                )
              ]
          )






      ),
    );
  }

  static int valuee() {
    int min = 70;
    int max = 100;

    int randomnum = min + Random().nextInt((max + 1) - min);
    return randomnum;
  }
}

// class Rowws extends StatelessWidget {
//
//   const Rowws({Key? key,@required this.sid,this.sfname,this.mob,this.slname}) : super(key: key);
// final String? sid;
// final String? sfname;
// final String? slname;
// final String? mob;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 70,
//       child: Container(
//
//         margin: const EdgeInsets.all(10),
//         decoration:BoxDecoration(color: Colors.deepPurple,border: Border.all(width: 2.0)),
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children:  [
//                Center(child: Text(sid!)),
//                Padding(
//                   padding: const EdgeInsets.only(left: 5),
//                   child: Text(
//                     sfname!
//                     //  style: TextStyle(fontSize: 12),
//                   )),
//               // const  Center(child: Text('3')),
//                Center(child: Text(slname!)),
//               Center(child: Text(mob!)),
//               Center(child: IconButton(
//                 icon: const Icon(Icons.delete_forever),
//                 tooltip: 'Increase volume by 10',
//                 onPressed: () {
//                   setState(() {
//                     _volume += 10;
//                   });
//                 },
//               ),),
//
//
//
//
//             ]
//         ),
//       ),
//     );
//   }
// }

