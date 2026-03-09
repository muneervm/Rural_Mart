// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class Api {
//   final Map<String, String> headers = {
//     'Content-Type': 'application/json',
//     'Connection': 'keep-alive',
//   };

//   Future<Map<String, dynamic>> authenticate(
//     String email,
//     String password,
//   ) async {
//     final String url = 'http://localhost/spices/public/login.php';

//     final body = jsonEncode({"email": email, "password": password});

//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: headers,
//         body: body,
//       );

//       print('Status code: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final decoded = jsonDecode(response.body) as Map<String, dynamic>;
//         return decoded;
//       } else {
//         throw Exception('Failed to authenticate: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to authenticate: $e');
//     }
//   }
// }
