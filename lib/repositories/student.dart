import 'dart:async';
import 'dart:convert';
import 'package:coaching_management_system/repositories/globals.dart';
import 'package:http/http.dart' as http;

class Student {
  static const root = 'https://noendacademy.000webhostapp.com/student.php';
  static const _getOne = 'GET_ONE';
  static const _getAll = 'GET_ALL';
  static const _add = '_ADD';
  static const _del = '_DELETE';

  String? loginID;
  String? firstName;
  String? lastName;
  String? gender;
  String? dob;
  String? cnic;
  String? email;
  String? mobile;
  String? address;

  Student(
      {this.loginID,
      this.firstName,
      this.lastName,
      this.gender,
      this.dob,
      this.cnic,
      this.email,
      this.mobile,
      this.address});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      loginID: json['loginID'] as String,
      firstName: json['First_name'] as String,
      lastName: json['Last_name'] as String,
      gender: json['Gender'] as String,
      dob: json['DOB'] as String,
      cnic: json['CNIC'] as String,
      email: json['Email'] as String,
      mobile: json['Mobile'] as String,
      address: json['Address'] as String,
    );
  }
}

Future<Student> getOneStudent(String loginID) async {
  final response = await http.post(
    Uri.parse(Student.root),
    headers: {
      'Authorization': 'Basic ${base64Encode(utf8.encode('root1:password'))}',
    },
    body: {
      'loginID': loginID,
      'action': Student._getOne,
    },
  );
  // print(response.statusCode);
  // print(response.body);
  if (jsonDecode(response.body) != "no user found") {
    return Student.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    //print("im running");

    throw Exception('Failed to get user.');
  }
}

Future<List<Student>> getAllStudent() async {
  try {
    final response = await http.post(
      Uri.parse(Student.root),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('root1:password'))}',
      },
      body: {
        'action': Student._getAll,
      },
    );
    //print("getEmployees >> Response:: ${response.body}");
    if (response.statusCode == 200) {
      List<Student> list = parsePhotos(response.body);
      //print(list[0].loginID);
      return list;
    } else {
      print('none found');
      throw <Student>[];
    }
  } catch (e) {
    print(e);
    return <Student>[];
  }
}

List<Student> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Student>((json) => Student.fromJson(json)).toList();
}

Future<String> addStudent(
    String loginID,
    String firstName,
    String lastName,
    String gender,
    String dob,
    String cnic,
    String email,
    String mobile,
    String address) async {
  try {
    final response = await http.post(
      Uri.parse(Student.root),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('root1:password'))}',
      },
      body: {
        'action': Student._add,
        'loginID': loginID,
        'first_name': firstName,
        'last_name': lastName,
        'gender': gender,
        'dob': dob,
        'cnic': cnic,
        'email': email,
        'mobile': mobile,
        'address': address,
      },
    );
    print("addEmployee >> Response:: ${response.body}");
    print(firstName);
    print(dob);
    return response.body;
  } catch (e) {
    return 'error';
  }
}

Future<String> delStudent(String loginID) async {
  try{
    final response = await http.post(
      Uri.parse(Student.root),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('root1:password'))}',
      },
      body: {
        'action': Student._del,
        'loginID': loginID,
      },
    );
    print("addEmployee >> Response:: ${response.body}");
    return response.body;
  }
  catch (e) {
    return 'error';
  }

}
