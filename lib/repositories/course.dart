// import 'dart:async';
// import 'dart:convert';
// import 'package:coaching_management_system/repositories/globals.dart';
// import 'package:http/http.dart' as http;
//
// class Student {
//   static const root = 'http://localhost/noEndDB/course.php';
//   static const _getOne = 'GET_ONE';
//   static const _getAll = 'GET_ALL';
//   String? firstName;
//   String? lastName;
//   String? courseid;
//   String? coursename;
//   String? type;
//
//   Student(
//       {
//         this.firstName,
//         this.lastName,
//         this.courseid,
//         this.coursename,
//         this.type,
//        });
//
//   factory Student.fromJson(Map<String, dynamic> json) {
//     return Student(
//
//       firstName: json['First_name'] as String,
//       lastName: json['Last_name'] as String,
//       courseid: json['courseid'] as String,
//       coursename: json['coursename'] as String,
//       type: json['type'] as String,
//
//     );
//   }
// }
//
// Future<Student> getOneStudent(String loginID) async {
//   final response = await http.post(
//     Uri.parse(Student.root),
//     body: {
//       'loginID': loginID,
//       'action': Student._getOne,
//     },
//   );
//   // print(response.statusCode);
//   // print(response.body);
//   if (jsonDecode(response.body) != "no user found") {
//     return Student.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     //print("im running");
//
//     throw Exception('Failed to get user.');
//   }
// }
//
// Future<List<Student>> getAllStudent() async {
//   try {
//     final response = await http.post(
//       Uri.parse(Student.root),
//       body: {
//         'action': Student._getAll,
//       },
//     );
//     //print("getEmployees >> Response:: ${response.body}");
//     if (response.statusCode == 200) {
//       List<Student> list = parsePhotos(response.body);
//       //print(list[0].loginID);
//       return list;
//     } else {
//       print('none found');
//       throw <Student>[];
//     }
//   } catch (e) {
//     print(e);
//     return <Student>[];
//   }
// }
//
// List<Student> parsePhotos(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   return parsed.map<Student>((json) => Student.fromJson(json)).toList();
// }
//
// Future<String> addStudent(
//     String loginID,
//     String firstName,
//     String lastName,
//     String gender,
//     String dob,
//     String cnic,
//     String email,
//     String mobile,
//     String address) async {
//   try {
//     final response = await http.post(
//       Uri.parse(Student.root),
//       body: {
//         'action': Student._add,
//         'loginID': loginID,
//         'First_name': firstName,
//         'Last_name': lastName,
//         'Gender': gender,
//         'DOB': dob,
//         'CNIC': cnic,
//         'Email': email,
//         'Mobile': mobile,
//         'Address': address,
//       },
//     );
//     print("addEmployee >> Response:: ${response.body}");
//     return response.body;
//   } catch (e) {
//     return 'error';
//   }
// }
