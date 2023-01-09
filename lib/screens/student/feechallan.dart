import 'package:flutter/material.dart';
import '../login_page.dart';
import 'course_registration.dart';
import 'student_home.dart';

import 'marks.dart';
import 'transcript.dart';
import 'feedetails.dart';
import 'attendance.dart';

class FeeChallan extends StatefulWidget {
  const FeeChallan({Key? key}) : super(key: key);

  @override
  State<FeeChallan> createState() => _FeeChallanState();
}

class _FeeChallanState extends State<FeeChallan> {
  bool check=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(
        //   Icons.arrow_back,
        //   size: 40,
        // ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: const Text('STUDENT ZONE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            )),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              //print(data);
              //showData();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          )

        ],
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
                Row(children: const [
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
                    " Fee Challan",
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
                        Container(
                          decoration: const BoxDecoration(color: Colors.blue),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                  child: Text(
                                    'Student Challan',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            decoration: BoxDecoration(color: Colors.grey[50]),
                            child: Container(
                              padding: const EdgeInsets.all(0),
                              decoration:
                              const BoxDecoration(color: Colors.grey),
                              child: Center(
                                child: Container(

                                  margin: const EdgeInsets.all(0),
                                  child: Table(
                                    children: [
                                      TableRow(children: [
                                        // Column(
                                        //   mainAxisAlignment:
                                        //   MainAxisAlignment.spaceEvenly,
                                        //   children: const [
                                        //     Text('S.NO'),
                                        //     SizedBox(height: 5 ),
                                        //     Text('1',style: TextStyle(fontSize: 12)),
                                        //   ],
                                        // ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Text('Amount'),SizedBox(height: 5),
                                            Text('146500 RS.',style: TextStyle(fontSize: 12)),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Text('Due Date'),SizedBox(height: 5),
                                            Text('04-Sep-2022',style: TextStyle(fontSize: 12),),
                                          ],
                                        ),
                                        Column(

                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Text('Status'),SizedBox(height: 5),
                                            Text('Paid',style: TextStyle(fontSize: 12)),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,

                                          children: [

                                            const Text('Pay'),const SizedBox(height: 0),
                                            check?
                                            TextButton(onPressed: (){},
                                                style: TextButton.styleFrom(backgroundColor: Colors.green),
                                                child: const Text("Paid",style: TextStyle(color: Colors.black))):
                                            TextButton(onPressed: (){check=true;setState(() {});},
                                                style: TextButton.styleFrom(backgroundColor: Colors.red),
                                                child: const Text("Pay",style: TextStyle(color: Colors.black),))
                                          ],
                                        )
                                        // TableCell(
                                        //     child: Row(
                                        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        //   children: const [
                                        //     Text('S.NO'),
                                        //     SizedBox(width: 5,),
                                        //     Text('Amount'),
                                        //     Text('Due Date'),
                                        //     Text('Status'),
                                        //     Text('Pay'),
                                        //   ],
                                        // ))
                                      ]),
                                      // TableRow(
                                      //   children: [
                                      //     TableCell(
                                      //         child: Row(
                                      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      //
                                      //
                                      //           children: [
                                      //         const Text('1'),
                                      //         const Text('146500 RS.'),
                                      //         const Text('04-Sep-2022'),
                                      //         const Text('Paid'),
                                      //         ElevatedButton(
                                      //           onPressed: () {},
                                      //           child: const Text('pay'),
                                      //         )
                                      //       ],
                                      //     ))
                                      //   ],
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
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
                //Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CourseRegistration()));
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
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const FeeChallan()));

                Navigator.pop(context);
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
    );
  }
}
