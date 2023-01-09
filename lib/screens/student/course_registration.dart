import 'dart:convert';

import 'package:flutter/material.dart';
import 'student_home.dart';
import 'marks.dart';
import 'transcript.dart';
import 'feechallan.dart';
import 'feedetails.dart';
import 'attendance.dart';
import 'package:http/http.dart'as http;

class CourseRegistration extends StatefulWidget {
  //static const String id='course_registration';

  const CourseRegistration({Key? key}) : super(key: key);

  @override
  State<CourseRegistration> createState() => _CourseRegistrationState();
}
class Texts extends StatelessWidget {

  final String word;
  const Texts({super.key,required this.word});
  @override
  Widget build(BuildContext context) {
    return Text(word,style: const TextStyle(fontWeight: FontWeight.w600),);
  }
}


class Rows extends StatelessWidget {
  const Rows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(color: Colors.lightBlue),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [

          Center(
              child: Text(
                'Code',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )),
          Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                  child: Text('Course Name',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)))),
          // Center(child: Text('CrdHrs',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white))),
          Center(
              child: Text('Type',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white))),
          Center(
              child: Text('Register',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white))),


        ],
      ),
    );
  }
}
class Rows2 extends StatefulWidget {
  const Rows2({Key? key}) : super(key: key);

  @override
  State<Rows2> createState() => _Rows2State();
}

class _Rows2State extends State<Rows2> {
bool chk=false;
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
              const Center(child: Texts(word: 'CS118',)),
              const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    'Programming Fundamentals',
                    //  style: TextStyle(fontSize: 12),
                  )),
              // const  Center(child: Text('3')),
              const  Center(child: Text('Core')),
              chk?
              TextButton(onPressed: (){chk=false;setState(() {});},
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Enrolled",style: TextStyle(color: Colors.black))):
              TextButton(onPressed: (){chk=true;setState(() {});},
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Enroll",style: TextStyle(color: Colors.black),))

            ]
        ),
      ),
    );
  }
}



class _CourseRegistrationState extends State<CourseRegistration> {
  final int num=1;


//  String url="https://192.168.0.106/getdata.php";
//   var courses = <String>[];
//   getcourses()async{
//
//     String url="https://192.168.0.106/getdata.php";
//     print('hello00000');
//        var response = await http.get(Uri.parse(url));
//
//     if(response.statusCode == 200){
//       setState(() {
//         print('hello1');
//         courses = jsonDecode(response.body);
//       });
//       //print('hello');
//       print(courses);
//       return courses;
//     }
//   }
// @override
//   void initState(){
//   super.initState();
//   getcourses();
//   print('done');

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            //  const DrawerHeader(child: Image(image: AssetImage('assets/calender.jpg'),)),

            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              currentAccountPicture: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/hasan1.jpg'),
              ),
              accountName: Text(
                'Muhammad Hasan',
                style: TextStyle(fontSize: 18),
              ),
              accountEmail:
              Text('K200479@nu.edu.pk', style: TextStyle(fontSize: 18)),
            ),
            ListTile(
              leading: Image.asset(
                'assets/home-page.png',
                width: 30,
                height: 30,
              ),
              title: const Text('Home', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer

                Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentHomeScreen() ));
                //Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/signing-a-document.png',
                width: 30,
                height: 30,
              ),
              title: const Text('Course Registration',
                  style: TextStyle(fontSize: 18)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const CourseRegistration()));
              },
            ),
            // ListTile(
            //   leading: Image.asset(
            //     'icons8-attendance-48.png',
            //     width: 30,
            //     height: 30,
            //   ),
            //   title: const Text('Attendance', style: TextStyle(fontSize: 18)),
            //   onTap: () {
            //     // Update the state of the app
            //     // ...
            //     // Then close the drawer
            //
            //     // Navigator.push(context, MaterialPageRoute(builder: (context) => const CourseRegistration()));
            //     //print('before');
            //
            //     //Navigator.pop(context);
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const Attendance()));
            //     //print('after');
            //   },
            // ),
            ListTile(
              leading: Image.asset(
                'assets/marks.png',
                width: 30,
                height: 30,
              ),
              title: const Text('Marks', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Marks()));

                //Navigator.pop(context);
              },
            ),
            // ListTile(
            //   leading: Image.asset(
            //     'icons8-transcript-64.png',
            //     height: 30,
            //     width: 30,
            //   ),
            //   title: const Text('Transcript', style: TextStyle(fontSize: 18)),
            //   onTap: () {
            //     // Update the state of the app
            //     // ...
            //     // Then close the drawer
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const Transcript()));
            //
            //     //Navigator.pop(context);
            //   },
            // ),
            ListTile(
              leading: Image.asset(
                'assets/feeslip.png',
                height: 30,
                width: 30,
              ),
              title: const Text('Fee Challan', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FeeChallan()));

                //Navigator.pop(context);
              },
            ),
            // ListTile(
            //   leading: Image.asset(
            //     'details-pane.png',
            //     width: 30,
            //     height: 30,
            //   ),
            //   title: const Text('Fee Details', style: TextStyle(fontSize: 18)),
            //   onTap: () {
            //     // Update the state of the app
            //     // ...
            //     // Then close the drawer
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const FeeDetails()));
            //
            //     //Navigator.pop(context);
            //   },
            // ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(

              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // TextButton(onPressed:(){
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const CourseRegistration()));}, child: const Text('Press Me')),
                Row(
                    children: const [

                      Padding(padding: EdgeInsets.all(10.0)),
                      Text(
                        "Student Profile   ",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "|",
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        " Course Registration",
                        style: TextStyle(fontSize: 15),
                      ),
                    ]),
                // const Padding(padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20)),
                const SizedBox(height: 10),
                Container(
                    decoration: BoxDecoration(color: Colors.teal.shade50),
                    height: 500,
                    width: 400,
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                        children: [

                          Expanded(
                            // flex:1,

                            child: ListView.builder(padding: const EdgeInsets.all(10),itemCount: num,itemBuilder: (context,index){
                              return const Rows();
                            }),
                          ),
                          Expanded(
                              flex: 9,
                              child: ListView.builder(padding: const EdgeInsets.all(2),itemCount: 1,itemBuilder: (context,index,){
                                return const Rows2();
                              })),
                          // Expanded(
                          //  // flex: 1,
                          //       child: ListView.builder(itemCount: 5,itemBuilder: (context,index){
                          //         return const Rows2();
                          //       }),
                          // )

                          // Rows()
                          //     Row(
                          //               // decoration:
                          //               //     BoxDecoration(color: Colors.lightBlue),
                          //               //decoration: BoxDecoration(color: Colors.lightBlueAccent),
                          //               children:  [
                          //                 Container(decoration: BoxDecoration(border: Border.all(),color: Colors.deepPurple,)),
                          //                 Center(
                          //                     child: Text(
                          //                   'Code',
                          //                   style: TextStyle(
                          //                       fontSize: 15,
                          //                       fontWeight: FontWeight.w400,
                          //                       color: Colors.white),
                          //                 )),
                          //                 Padding(
                          //                     padding: EdgeInsets.all(10),
                          //                     child: Center(
                          //                         child: Text('Course Name',
                          //                             style: TextStyle(
                          //                                 fontSize: 15,
                          //                                 fontWeight: FontWeight.w400,
                          //                                 color: Colors.white)))),
                          //                 // Center(child: Text('CrdHrs',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white))),
                          //                 Center(
                          //                     child: Text('Type',
                          //                         style: TextStyle(
                          //                             fontSize: 15,
                          //                             fontWeight: FontWeight.w400,
                          //                             color: Colors.white))),
                          //                 Center(
                          //                     child: Text('Register',
                          //                         style: TextStyle(
                          //                             fontSize: 15,
                          //                             fontWeight: FontWeight.w400,
                          //                             color: Colors.white))),
                          //
                          //
                          //     //ListView.builder(itemBuilder: (context,ind))
                          //
                          //     // Table(
                          //     //   border: TableBorder.all(width: 1),
                          //     //   defaultColumnWidth: const FixedColumnWidth(90),
                          //     //   defaultVerticalAlignment:
                          //     //       TableCellVerticalAlignment.middle,
                          //     //   children:   [
                          //     //      const TableRow(
                          //     //         decoration:
                          //     //             BoxDecoration(color: Colors.lightBlue),
                          //     //         //decoration: BoxDecoration(color: Colors.lightBlueAccent),
                          //     //         children: [
                          //     //           Center(
                          //     //               child: Text(
                          //     //             'Code',
                          //     //             style: TextStyle(
                          //     //                 fontSize: 15,
                          //     //                 fontWeight: FontWeight.w400,
                          //     //                 color: Colors.white),
                          //     //           )),
                          //     //           Padding(
                          //     //               padding: EdgeInsets.all(10),
                          //     //               child: Center(
                          //     //                   child: Text('Course Name',
                          //     //                       style: TextStyle(
                          //     //                           fontSize: 15,
                          //     //                           fontWeight: FontWeight.w400,
                          //     //                           color: Colors.white)))),
                          //     //           // Center(child: Text('CrdHrs',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white))),
                          //     //           Center(
                          //     //               child: Text('Type',
                          //     //                   style: TextStyle(
                          //     //                       fontSize: 15,
                          //     //                       fontWeight: FontWeight.w400,
                          //     //                       color: Colors.white))),
                          //     //           Center(
                          //     //               child: Text('Register',
                          //     //                   style: TextStyle(
                          //     //                       fontSize: 15,
                          //     //                       fontWeight: FontWeight.w400,
                          //     //                       color: Colors.white))),
                          //     //         ]),
                          //     //
                          //     //
                          //     //       TableRow(
                          //     //
                          //     //         //decoration:  BoxDecoration(color: Colors.lightBlueAccent),
                          //     //         children: [
                          //     //           const Center(child: Text('CS118')),
                          //     //           const Padding(
                          //     //               padding: EdgeInsets.only(left: 5),
                          //     //               child: Text(
                          //     //                 'Programming Fundamentals',
                          //     //                 style: TextStyle(fontSize: 12),
                          //     //               )),
                          //     //           // const  Center(child: Text('3')),
                          //     //           const Center(child: Text('Core')),
                          //     //           loading?
                          //     //           TextButton(
                          //     //               onPressed: () {loading=true;
                          //     //                 setState(() {
                          //     //
                          //     //                 });},
                          //     //
                          //     //               style: TextButton.styleFrom(
                          //     //                   // foregroundColor: Colors.red,
                          //     //                   // elevation: 2,
                          //     //                 backgroundColor: Colors.green),
                          //     //               child: const Text('Enroll',style: TextStyle(color: Colors.black))):
                          //     //           TextButton(
                          //     //               onPressed: () {loading=true;
                          //     //               setState(() {
                          //     //
                          //     //               });},
                          //     //
                          //     //               style: TextButton.styleFrom(
                          //     //                 // foregroundColor: Colors.red,
                          //     //                 // elevation: 2,
                          //     //                   backgroundColor: Colors.red),
                          //     //               child: const Text('Enroll',style: TextStyle(color: Colors.black),))
                          //     //
                          //     //           // ElevatedButton(
                          //     //           //   onPressed: () {
                          //     //           //    print('Pressed');
                          //     //           //   },
                          //     //           //   style: ButtonStyle(
                          //     //           //     backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //     //           //           (Set<MaterialState> states) {
                          //     //           //         if (states.contains(MaterialState.pressed)) return Colors.blue;
                          //     //           //         return Colors.red;
                          //     //           //       },
                          //     //           //     ),
                          //     //           //   ),child: const Text('Enroll'),
                          //     //           // )
                          //     //           //Container(child: FlatButton,)
                          //     //
                          //     //           // Text('CS118'),
                          //     //           // Text('Programming Fundamentals'),
                          //     //           // Text('3'),
                          //     //           // Text('Core')
                          //     //         ]),
                          //     //   ],
                          //     //
                          //     // ),
                          //     // Expanded(
                          //     //   child: ListView.builder(
                          //     //       itemCount: 5,
                          //     //       itemBuilder: (context,index){
                          //     //         loading=false;
                          //     //
                          //     //         return Row(
                          //     //
                          //     //             children: [
                          //     //               border
                          //     //                  const Center(child: Text('CS118')),
                          //     //                  const Padding(
                          //     //                      padding: EdgeInsets.only(left: 5),
                          //     //                      child: Text(
                          //     //                        'Programming Fundamentals',
                          //     //                        style: TextStyle(fontSize: 12),
                          //     //                      )),
                          //     //                  // const  Center(child: Text('3')),
                          //     //                  const Center(child: Text('Core')),
                          //     //                  loading?
                          //     //                  TextButton(
                          //     //                      onPressed: () {loading=true;
                          //     //                        setState(() {
                          //     //
                          //     //                        });},
                          //     //
                          //     //                      style: TextButton.styleFrom(
                          //     //                          // foregroundColor: Colors.red,
                          //     //                          // elevation: 2,
                          //     //                        backgroundColor: Colors.green),
                          //     //                      child: const Text('Enroll',style: TextStyle(color: Colors.black))):
                          //     //                  TextButton(
                          //     //                      onPressed: () {loading=true;
                          //     //                      setState(() {
                          //     //
                          //     //                      });},
                          //     //
                          //     //                      style: TextButton.styleFrom(
                          //     //                        // foregroundColor: Colors.red,
                          //     //                        // elevation: 2,
                          //     //                          backgroundColor: Colors.red),
                          //     //                      child: const Text('Enroll',style: TextStyle(color: Colors.black),))
                          //     //
                          //     //                  // ElevatedButton(
                          //     //                  //   onPressed: () {
                          //     //                  //    print('Pressed');
                          //     //                  //   },
                          //     //                  //   style: ButtonStyle(
                          //     //                  //     backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          //     //                  //           (Set<MaterialState> states) {
                          //     //                  //         if (states.contains(MaterialState.pressed)) return Colors.blue;
                          //     //                  //         return Colors.red;
                          //     //                  //       },
                          //     //                  //     ),
                          //     //                  //   ),child: const Text('Enroll'),
                          //     //                  // )
                          //     //                  //Container(child: FlatButton,)
                          //     //
                          //     //                  // Text('CS118'),
                          //     //                  // Text('Programming Fundamentals'),
                          //     //                  // Text('3'),
                          //     //                  // Text('Core')
                          //     //
                          //     //         ]);
                          //     //
                          //     //
                          //     //       }
                          //     //
                          //     //
                          //     //   ),
                          //     // ),
                          //     // ListView.builder(
                          //     //   itemCount: 10,
                          //     //   itemBuilder: (context, ){
                          //     //
                          //     //   },
                          //     // )
                          //   ],
                          // ),
                        ])
                )],
            ),
          ),
        ),
      ),
    );
  }
}

// Future<void>getapidata()async{
//   String url="https://192.168.0.106/getdata.php";
//   var result = await http.get(Uri.parse(url),headers: {
//     //"auth-token": idToken, // whatever headers you need
//     "content-type": "application/json" // This prevents empty response body
//   },);
//   print(result.body);
// }x`x