import 'package:flutter/material.dart';
import 'course_registration.dart';
import 'student_home.dart';

import 'marks.dart';
import 'feechallan.dart';
import 'feedetails.dart';
import 'attendance.dart';

class Transcript extends StatefulWidget {
  const Transcript({Key? key}) : super(key: key);

  @override
  State<Transcript> createState() => _TranscriptState();
}

class _TranscriptState extends State<Transcript> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

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

                //Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentHomeScreen() ));
                Navigator.pop(context);
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
      body: Center(
        child: Container(
          decoration: const BoxDecoration(color: Colors.blue),
          child: const Text('Transcript',style: TextStyle(fontSize: 30,color: Colors.red),),
        ),
      ),
    );
  }
}
