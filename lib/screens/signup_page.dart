import 'package:coaching_management_system/repositories/admin.dart';
import 'package:coaching_management_system/repositories/student.dart';
import 'package:coaching_management_system/repositories/teacher.dart';
import 'package:flutter/material.dart';
import 'package:coaching_management_system/repositories/login_details.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? status = 'student';
  TextEditingController loginID = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController addr = TextEditingController();
  TextEditingController mob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController cnic = TextEditingController();

  void register() {
    createUser(loginID.text, pass.text, status!);
    if(status == 'student'){
      addStudent(loginID.text, fname.text, lname.text, gender.text, dob.text, cnic.text, email.text, mob.text, addr.text);
    }
    else if(status == 'teacher'){
      addTeacher(loginID.text, fname.text, lname.text, gender.text, dob.text, cnic.text, email.text, mob.text, addr.text);
    }
    else if(status == 'admin'){
      addAdmin(loginID.text, fname.text, lname.text, gender.text, dob.text, cnic.text, email.text, mob.text, addr.text);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          children: <Widget>[
            //spacing
            const SizedBox(height: 25),

            //Prompt
            const Center(
              child: Text(
                'Hey There,',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            const SizedBox(height: 10),

            //prompt
            const Center(
              child: Text(
                'Create an Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),

            const SizedBox(height: 25),

            //first name
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.person_outline),
                    hintText: 'First Name',
                  ),
                  controller: fname,
                ),
              ),
            ),

            const SizedBox(height: 25),

            //last name
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child:  Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.person_outline),
                    hintText: 'Last Name',
                  ),
                  controller: lname,
                ),
              ),
            ),

            const SizedBox(height: 25),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child:  Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.perm_identity),
                    hintText: 'CNIC',
                  ),
                  controller: cnic,
                ),
              ),
            ),

            const SizedBox(height: 25),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.date_range),
                    hintText: 'DOB',
                  ),
                  controller: dob,
                ),
              ),
            ),

            const SizedBox(height: 25),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.person_outline),
                    hintText: 'Gender',
                  ),
                  controller: gender,
                ),
              ),
            ),

            const SizedBox(height: 25),

            //contact no
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.phone_android),
                    hintText: 'Contact No',
                  ),
                  controller: mob,
                ),
              ),
            ),

            const SizedBox(height: 25),

            //address
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.home),
                    hintText: 'Address',
                  ),
                  controller: addr,
                ),
              ),
            ),

            const SizedBox(height: 25),

            //email
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.email_outlined),
                    hintText: 'Email',
                  ),
                  controller: email,
                ),
              ),
            ),

            const SizedBox(height: 25),

            //status : radio buttons
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment(-0.975, 0.0),
                      child: Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('Student'),
                      leading: Radio(
                        value: 'student',
                        groupValue: status,
                        onChanged: (String? value) {
                          setState(() {
                            status = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Teacher'),
                      leading: Radio(
                        value: 'teacher',
                        groupValue: status,
                        onChanged: (String? value) {
                          setState(() {
                            status = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Admin'),
                      leading: Radio(
                        value: 'admin',
                        groupValue: status,
                        onChanged: (String? value) {
                          setState(() {
                            status = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            //RegID
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.key_outlined),
                    hintText: 'RegID',
                  ),
                  controller: loginID,
                ),
              ),
            ),

            const SizedBox(height: 25),

            //password
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.lock_outline),
                    hintText: 'Password',
                  ),
                  controller: pass,
                ),
              ),
            ),

            const SizedBox(height: 25),

            //confirm password
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.lock_outline),
                    hintText: 'Confirm Password',
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            //register button
            TextButton(
              onPressed: () {
                register();
              },
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.deepPurple,
                ),
                child: const Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
