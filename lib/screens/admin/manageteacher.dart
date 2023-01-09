import 'package:coaching_management_system/screens/admin/admin_home.dart';
import 'package:coaching_management_system/screens/admin/check.dart';
import 'package:coaching_management_system/screens/admin/manageStudent.dart';
import 'package:coaching_management_system/screens/student/course_registration.dart';
import 'package:flutter/material.dart';
import '../../repositories/student.dart';
import '../../repositories/teacher.dart';
import '../signup_page.dart';


class ManageTeacher extends StatefulWidget {
  const ManageTeacher({Key? key}) : super(key: key);
  final String title = "Teacher Data Table";
  final String numss = "hello";
  @override
  State<ManageTeacher> createState() => _ManageTeacherState();
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
                'ID',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )),
          Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                  child: Text('First Name',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)))),
          // Center(child: Text('CrdHrs',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white))),
          Center(
              child: Text('Last Name',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white))),
          Center(
              child: Text('Mobile',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white))),

        ],
      ),
    );
  }
}
class _ManageTeacherState extends State<ManageTeacher> {
  int num=1;
  late List<Teacher> _employees;
  late GlobalKey<ScaffoldState> _scaffoldKey;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late bool _isUpdating;
  late String _titleProgress;
  void initState() {
    super.initState();
    _employees = [];
    _isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _getEmployees();
  }

  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  // _addEmployee() {
  //   if (_firstNameController.text.trim().isEmpty ||
  //       _lastNameController.text.trim().isEmpty) {
  //     print("Empty fields");
  //     return;
  //   }
  //   _showProgress('Adding Employee...');
  //   addStudent(_firstNameController.text, _lastNameController.text)
  //       .then((result) {
  //     if ('success' == result) {
  //       _getEmployees();
  //     }
  //     _clearValues();
  //   });
  // }

  _getEmployees() {
    _showProgress('Loading Employees...');
    getAllTeacher().then((employees) {
      setState(() {
        _employees = employees;
      });
      _showProgress(widget.title);
      print("Length: ${employees.length}");
    });
  }

  // _deleteEmployee(Employee employee) {
  //   _showProgress('Deleting Employee...');
  //   Services.deleteEmployee(employee.id).then((result) {
  //     if ('success' == result) {
  //       setState(() {
  //         _employees.remove(employee);
  //       });
  //       _getEmployees();
  //     }
  //   });
  // }

  // _updateEmployee(Employee employee) {
  //   _showProgress('Updating Employee...');
  //   Services.updateEmployee(
  //           employee.id, _firstNameController.text, _lastNameController.text)
  //       .then((result) {
  //     if ('success' == result) {
  //       _getEmployees();
  //       setState(() {
  //         _isUpdating = false;
  //       });
  //       _firstNameController.text = '';
  //       _lastNameController.text = '';
  //     }
  //   });
  // }

  _setValues(Teacher employee) {
    _firstNameController.text = employee.firstName!;
    _lastNameController.text = employee.lastName!;
    setState(() {
      _isUpdating = true;
    });
  }

  _clearValues() {
    _firstNameController.text = '';
    _lastNameController.text = '';
  }

  SingleChildScrollView _dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(
                label: Text("ID"),
                numeric: false,
                tooltip: "This is the employee id"),
            DataColumn(
                label: Text(
                  "FIRST",
                ),
                numeric: false,
                tooltip: "This is the last name"),
            DataColumn(
                label: Text("LAST"),
                numeric: false,
                tooltip: "This is the last name"),
            DataColumn(
                label: Text("DELETE"),
                numeric: false,
                tooltip: "Delete Action"),
          ],
          rows: _employees
              .map(
                (employee) => DataRow(
              cells: [
                DataCell(
                  Text(employee.loginID!),
                  onTap: () {
                    print("Tapped ${employee.firstName}");
                    _setValues(employee);
                  },
                ),
                DataCell(
                  Text(
                    employee.firstName!,
                  ),
                  onTap: () {
                    print("Tapped ${employee.firstName}");
                    _setValues(employee);
                  },
                ),
                DataCell(
                  Text(
                    employee.lastName!,
                  ),
                  onTap: () {
                    print("Tapped ${employee.firstName}");
                    _setValues(employee);
                  },
                ),
                DataCell(
                  Text(employee.gender!),
                  onTap: () {
                    print("Tapped ${employee.firstName}");
                    _setValues(employee);
                  },
                ),
                DataCell(
                  Text(employee.dob!),
                  onTap: () {
                    print("Tapped ${employee.firstName}");
                    _setValues(employee);
                  },
                ),
                DataCell(
                  Text(employee.cnic!),
                  onTap: () {
                    print("Tapped ${employee.firstName}");
                    _setValues(employee);
                  },
                ),
                DataCell(
                  Text(employee.email!),
                  onTap: () {
                    print("Tapped ${employee.firstName}");
                    _setValues(employee);
                  },
                ),
                DataCell(
                  Text(employee.mobile!),
                  onTap: () {
                    print("Tapped ${employee.firstName}");
                    _setValues(employee);
                  },
                ),
                DataCell(
                  Text(employee.address!),
                  onTap: () {
                    print("Tapped ${employee.firstName}");
                    _setValues(employee);
                  },
                ),
                // DataCell(
                //   IconButton(
                //     icon: const Icon(Icons.delete),
                //     onPressed: () {
                //       _deleteEmployee(employee);
                //     },
                //   ),
                //   onTap: () {
                //     print("Tapped ${employee.firstName}");
                //   },
                // ),
              ],
            ),
          )
              .toList(),
        ),
      ),
    );
  }

  // showSnackBar(context, message) {
  //   _scaffoldKey.currentState.showSnackBar(SnackBar(
  //     content: Text(message),
  //   ));
  // }
  String? nums="hello000000000";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titleProgress),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _getEmployees();
            },
          ),
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

                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminHome() ));
                //Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/signing-a-document.png',
                width: 30,
                height: 30,
              ),
              title: const Text('Manage Students',
                  style: TextStyle(fontSize: 18)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ManageStudent()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/signing-a-document.png',
                width: 30,
                height: 30,
              ),
              title: const Text('Manage Teachers', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const ManageStudent()));
                //print('before');

                Navigator.pop(context);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const ManageTeacher()));
                //print('after');
              },
            ),
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
      // body: Rowws(sid: _employees[0].loginID,sname: _employees[0].firstName,stype: _employees[0].mobile,)
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
                              child: ListView.builder(padding: const EdgeInsets.all(2),itemCount: _employees.length,itemBuilder: (context,index,){
                                return  Rowws(sid: _employees[index].loginID,sfname: _employees[index].firstName,slname: _employees[index].lastName,mob: _employees[index].mobile,);
                              })),
                          FloatingActionButton(onPressed: (){Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage()));},child: const Icon(Icons.add))
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
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.all(20.0),
      //       child: TextField(
      //         controller: _firstNameController,
      //         decoration: const InputDecoration.collapsed(
      //           hintText: "First Name",
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(20.0),
      //       child: TextField(
      //         controller: _lastNameController,
      //         decoration: const InputDecoration.collapsed(
      //           hintText: "Last Name",
      //         ),
      //       ),
      //     ),
      //     _isUpdating
      //         ? Row(
      //             children: <Widget>[
      //               // OutlinedButton(
      //               //   child: Text('UPDATE'),
      //               //   onPressed: () {
      //               //     _updateEmployee(_selectedEmployee);
      //               //   },
      //               // ),
      //               OutlinedButton(
      //                 child: const Text('CANCEL'),
      //                 onPressed: () {
      //                   setState(() {
      //                     _isUpdating = false;
      //                   });
      //                   _clearValues();
      //                 },
      //               ),
      //             ],
      //           )
      //         : Container(),
      //     // Expanded(
      //     //   child: _dataBody(),
      //     // )
      //   ],
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _addEmployee();
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
