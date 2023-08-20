import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'globals.dart' as globals;

class LoginDetails {
  static const _signIn = 'SignIn';
  static const _register = 'Add_User';
  static const root = 'http://localhost/noEndDB/signup.php';

  final String loginID;
  final String pass;
  final String status;

  const LoginDetails(
      {required this.loginID, required this.pass, required this.status});

  factory LoginDetails.fromJson(Map<String, dynamic> json) {
    return LoginDetails(
      loginID: json['loginID'] as String,
      pass: json['pass'] as String,
      status: json['status'] as String,
    );
  }
}

//send data to server and convert response to class.
//add login details of user to database.
void createUser(String loginID, String pass, String status) async {
  final response = await http.post(
    Uri.parse(LoginDetails.root),
    headers: {
      'Authorization': 'Basic ${base64Encode(utf8.encode('root1:password'))}',
    },
    body: {
      'loginID': loginID,
      'pass': pass,
      'status': status,
      'action': LoginDetails._register,
    },
  );
  print(response.body);
  print(jsonDecode(response.body));
  var data = jsonDecode(response.body);
  if (data.toString() == 'Success') {
    // If the server did return a 201 CREATED response,
    // then show successful message toast.
    Fluttertoast.showToast(
      msg: "Registration Successful",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    //return LoginDetails.fromJson(data);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception nad show toast.
    Fluttertoast.showToast(
      msg: data.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    //throw Exception('Failed to create user');
  }
}

//fetch data to server and convert response to class.
//user login
Future<bool> loginUser(String loginID, String pass) async {
  print('inside login function');
  final response = await http.post(
    Uri.parse(LoginDetails.root),
    headers: {
      'Authorization': 'Basic ${base64Encode(utf8.encode('root1:password'))}',
    },
    body: {
      'loginID': loginID,
      'pass': pass,
      'action': LoginDetails._signIn,
    },
  );

  var data = jsonDecode(response.body);
  print('data');
  print(data);
  print(data[0]);
  if (data[0] == "Success") {
    // If the server did return a 200 OK response,
    // then parse the JSON and show toast.
    Fluttertoast.showToast(
      msg: "Login Successful",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    await SessionManager().set("ID", loginID);
    await SessionManager().set("status", data[2]);
    globals.id = loginID;
    globals.status = data[2];

    // print(await SessionManager().get("ID"));
    // print(await SessionManager().get("status"));
    return true;
    //return LoginDetails.fromJson(data);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception nad show toast.
    Fluttertoast.showToast(
      msg: data.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    return false;
    //throw Exception('Failed to create user');
  }
}
