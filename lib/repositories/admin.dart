import 'dart:async';
import 'dart:convert';
import 'package:coaching_management_system/repositories/globals.dart';
import 'package:http/http.dart' as http;

class Admin {
  static const root = 'https://noendacademy.000webhostapp.com/admin.php';
  static const _getOne = 'GET_ONE';
  static const _getAll = 'GET_ALL';
  static const _add = '_ADD';
  String? loginID;
  String? firstName;
  String? lastName;
  String? gender;
  String? dob;
  String? cnic;
  String? email;
  String? mobile;
  String? address;

  Admin(
      {this.loginID,
        this.firstName,
        this.lastName,
        this.gender,
        this.dob,
        this.cnic,
        this.email,
        this.mobile,
        this.address});

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
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

Future<Admin> getOneAdmin(String loginID) async {
  final response = await http.post(
    Uri.parse(Admin.root),
    headers: {
      'Authorization': 'Basic ${base64Encode(utf8.encode('root1:password'))}',
    },
    body: {
      'loginID': loginID,
      'action': Admin._getOne,
    },
  );
  // print(response.statusCode);
  // print(response.body);
  if (jsonDecode(response.body) != "no user found") {
    return Admin.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    //print("im running");
    print(response.body);
    throw Exception('Failed to get user.');
  }
}

Future<List<Admin>> getAllAdmin() async {
  try {
    final response = await http.post(
      Uri.parse(Admin.root),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('root1:password'))}',
      },
      body: {
        'action': Admin._getAll,
      },
    );
    //print("getEmployees >> Response:: ${response.body}");
    if (response.statusCode == 200) {
      List<Admin> list = parsePhotos(response.body);
      //print(list[0].loginID);
      return list;
    } else {
      print('none found');
      throw <Admin>[];
    }
  } catch (e) {
    print(e);
    return <Admin>[];
  }
}

List<Admin> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Admin>((json) => Admin.fromJson(json)).toList();
}

Future<String> addAdmin(
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
      Uri.parse(Admin.root),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('root1:password'))}',
      },
      body: {
        'action': Admin._add,
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
    print("addTeacher >> Response:: ${response.body}");
    return response.body;
  } catch (e) {
    return 'error';
  }
}