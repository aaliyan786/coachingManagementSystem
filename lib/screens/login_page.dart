import 'package:coaching_management_system/repositories/login_details.dart';
import 'package:coaching_management_system/screens/admin/admin_home.dart';
import 'package:coaching_management_system/screens/teacher/teacher_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'signup_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'student/student_home.dart';
import '../../repositories/globals.dart' as globals;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginID = TextEditingController();
  TextEditingController pass = TextEditingController();

  void login() {
    if (globals.status == 'student') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const StudentHomeScreen(),
        ),
      );
    } else if (globals.status == 'teacher') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TeacherHome(),
        ),
      );
    } else if (globals.status == 'admin') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AdminHome(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return const Icon(
              Icons.school,
            );
          },
        ),
        title: const Text('NoEnd Academy'),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.school,
                size: 70,
              ),
              //greeting 1
              Text(
                'Hello Students!',
                style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                ),
              ),

              const SizedBox(height: 10),

              //greeting 2
              const Text(
                'Welcome To NoEnd Coaching Portal!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 50),

              //email TextField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
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
                        icon: Icon(Icons.people),
                        hintText: 'ID',
                      ),
                      controller: loginID,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              //password TextField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
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
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.lock),
                        hintText: 'Password',
                      ),
                      controller: pass,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              //sign-in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextButton(
                  onPressed: () async {
                    bool result = await loginUser(loginID.text, pass.text);
                    //print(result);
                    if (result) {
                      login();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.deepPurple,
                    ),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              //register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not yet enrolled? ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    child: const Text(
                      'Register Now!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}