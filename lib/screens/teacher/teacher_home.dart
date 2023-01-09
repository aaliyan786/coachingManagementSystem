import 'package:coaching_management_system/repositories/teacher.dart';
import 'package:coaching_management_system/screens/teacher/view_std.dart';
import 'package:flutter/material.dart';

import '../../repositories/globals.dart' as globals;
import '../login_page.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({Key? key}) : super(key: key);

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  late Future<Teacher> data;

  @override
  void initState() {
    super.initState();
    data = getOneTeacher(globals.id);
    //getInfo(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(
        //   Icons.arrow_back,
        //   size: 40,
        // ),
        //centerTitle: true,
        //backgroundColor: Colors.blue[900],
        title: const Text('NoEnd Academy'),
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

                //Navigator.push(context, MaterialPageRoute(builder: (context) => const TeacherHome() ));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/signing-a-document.png',
                width: 30,
                height: 30,
              ),
              title: const Text('View Students',
                  style: TextStyle(fontSize: 18)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewStd()));
              },
            ),
            // ListTile(
            //   leading: Image.asset(
            //     'signing-a-document.png',
            //     width: 30,
            //     height: 30,
            //   ),
            //   title: const Text('Manage Teachers', style: TextStyle(fontSize: 18)),
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
            //             builder: (context) => const TeacherHome()));
            //     //print('after');
            //   },
            // ),
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
            // ListTile(
            //   leading: Image.asset(
            //     'marks.png',
            //     width: 30,
            //     height: 30,
            //   ),
            //   title: const Text('Marks', style: TextStyle(fontSize: 18)),
            //   onTap: () {
            //     // Update the state of the app
            //     // ...
            //     // Then close the drawer
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => const Marks()));
            //
            //     //Navigator.pop(context);
            //   },
            // ),
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
            // ListTile(
            //   leading: Image.asset(
            //     'feeslip.png',
            //     height: 30,
            //     width: 30,
            //   ),
            //   title: const Text('Fee Challan', style: TextStyle(fontSize: 18)),
            //   onTap: () {
            //     // Update the state of the app
            //     // ...
            //     // Then close the drawer
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const FeeChallan()));
            //
            //     //Navigator.pop(context);
            //   },
            // ),
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
          child: FutureBuilder<Teacher>(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
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
                          "Teacher Profile   ",
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          "|",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          "   Home",
                          style: TextStyle(fontSize: 15),
                        ),
                      ]),
                      // const Padding(padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20)),
                      const SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(border: Border.all(width: 2)),
                        width: 350,
                        height: 350,
                        child: Column(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.deepPurple,
                                ),
                                //width: 350,
                                child: Row(
                                  children: const [
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    //Image.asset('assets/info.png',height: 10,),
                                    Icon(
                                      Icons.info,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "   Personal Information",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(left: 15)),
                                Flexible(
                                  child: RichText(
                                    text: TextSpan(
                                      //text: 'Address:   ',
                                      style:
                                      Theme.of(context).textTheme.bodyText1,
                                      children: [
                                        const TextSpan(
                                          text: 'loginID:   ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 15),
                                        ),
                                        TextSpan(
                                          text: snapshot.data!.loginID,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                                // Text("Name: "),
                                // Text("Muhammad Hasan"),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(left: 15)),
                                Flexible(
                                  child: RichText(
                                    text: TextSpan(
                                      //text: 'Address:   ',
                                      style:
                                      Theme.of(context).textTheme.bodyText1,
                                      children: [
                                        const TextSpan(
                                            text: 'First Name:   ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 15)),
                                        TextSpan(
                                          text: snapshot.data!.firstName,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                                // Text("Name: "),
                                // Text("Muhammad Hasan"),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(left: 15)),
                                Flexible(
                                  child: RichText(
                                    text: TextSpan(
                                      //text: 'Address:   ',
                                      style:
                                      Theme.of(context).textTheme.bodyText1,
                                      children: [
                                        const TextSpan(
                                            text: 'Last Name:   ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 15)),
                                        TextSpan(
                                          text: snapshot.data!.lastName,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                                // Text("Name: "),
                                // Text("Muhammad Hasan"),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(children: [
                              const Padding(padding: EdgeInsets.only(left: 15)),
                              Flexible(
                                child: RichText(
                                    text: TextSpan(
                                      //text: 'Address:   ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        children: [
                                          const TextSpan(
                                              text: 'Gender:   ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 15)),
                                          TextSpan(
                                            text: snapshot.data!.gender,
                                          )
                                        ])),
                              )
                              //Text("Gender: "), Text("Male"),
                            ]),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(children: [
                              const Padding(padding: EdgeInsets.only(left: 15)),
                              Flexible(
                                child: RichText(
                                    text: TextSpan(
                                      //text: 'Address:   ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        children: [
                                          const TextSpan(
                                              text: 'DOB:   ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 15)),
                                          TextSpan(
                                            text: snapshot.data!.dob,
                                          )
                                        ])),
                              )
                              //Text("DOB: "), Text("8/16/2001")
                            ]),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(children: [
                              const Padding(padding: EdgeInsets.only(left: 15)),
                              Flexible(
                                child: RichText(
                                    text: TextSpan(
                                      //text: 'Address:   ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        children: [
                                          const TextSpan(
                                              text: 'CNIC   ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 15)),
                                          TextSpan(
                                            text: snapshot.data!.cnic,
                                          )
                                        ])),
                              )
                              //Text("CNIC: "), Text("42301-8291012-7")
                            ]),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(children: [
                              const Padding(padding: EdgeInsets.only(left: 15)),
                              Flexible(
                                child: RichText(
                                    text: TextSpan(
                                      //text: 'Address:   ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        children: [
                                          const TextSpan(
                                              text: 'Email:   ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 15)),
                                          TextSpan(
                                            text: snapshot.data!.email,
                                          )
                                        ])),
                              )
                              //Text("Email: "), Text("k200479@nu.edu.pk")
                            ]),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(children: [
                              const Padding(padding: EdgeInsets.only(left: 15)),
                              Flexible(
                                child: RichText(
                                    text: TextSpan(
                                      //text: 'Address:   ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        children: [
                                          const TextSpan(
                                              text: 'Mobile No:   ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 15)),
                                          TextSpan(
                                            text: snapshot.data!.mobile,
                                          )
                                        ])),
                              )
                              //Text("Mobile No: "), Text("033373165085")
                            ]),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(border: Border.all(width: 2)),
                        width: 350,
                        height: 250,
                        child: Column(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.deepPurple,
                                ),
                                //width: 350,
                                child: Row(
                                  children: const [
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    Icon(
                                      Icons.contact_page_rounded,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "   Contact Information",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(left: 15)),
                                Flexible(
                                  child: RichText(
                                      text: TextSpan(
                                        //text: 'Address:   ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                          children: [
                                            const TextSpan(
                                                text: 'Address:   ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 15)),
                                            TextSpan(
                                              text: snapshot.data!.address,
                                            )
                                          ])),
                                )
                                //Text("Address: "),
                                // Text(" Flat 104 Khurasan Homes Next \nTo Khurasan Imam Bargah Soldier Bazaar \nNo.3 Karachi"),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}