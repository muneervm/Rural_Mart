// import 'package:flutter/material.dart';
// import 'package:grocery_application/API/AuthAPI/auth_api.dart';
// import 'package:grocery_application/Datastore/shared_pref.dart';

// class AuthProvider with ChangeNotifier {
//   final Api _api = Api();

//   bool _isLoading = false;
//   String? _errorMessage;

//   bool get isLoading => _isLoading;
//   String? get errorMessage => _errorMessage;

//   Future<bool> login(String email, String password) async {
//     _isLoading = true;
//     _errorMessage = null;
//     notifyListeners();

//     try {
//       final response = await _api.authenticate(email, password);
//       print("API response: $response");

//       if (response['status'] == 'success') {
//         await SharedPrefs.saveToken(response['token']);
//         await SharedPrefs.saveUserId(response['user']['id']);
//         await SharedPrefs.saveUsername(response['user']['name']);
//         await SharedPrefs.saveUserEmail(response['user']['email']);

//         _isLoading = false;
//         notifyListeners();
//         return true;
//       } else {
//         _isLoading = false;
//         _errorMessage = response['message'] ?? 'Login failed';
//         notifyListeners();
//         return false;
//       }
//     } catch (e) {
//       _isLoading = false;
//       _errorMessage = 'Error: ${e.toString()}';
//       notifyListeners();
//       return false;
//     }
//   }
// }
