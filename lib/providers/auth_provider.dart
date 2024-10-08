import 'package:flutter/material.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  bool get isAuthenticated => _user != null;

  Future<void> login(String email, String password) async {
    // Simulate a login process
    await Future.delayed(Duration(seconds: 2));
    _user = User(
      id: '1',
      name: 'Ahmed Ezat',
      email: email,
      profilePictureUrl:
          'https://mostaql.hsoubcdn.com/uploads/thumbnails/1119216/64de4a4484465/google-digital-marketing-e-commerce-certificate.png',
    );
    notifyListeners();
  }

  Future<void> signup(String email, String password) async {
    // Simulate a signup process
    await Future.delayed(Duration(seconds: 2));
    _user = User(
      id: '1',
      name: 'John Doe',
      email: email,
      profilePictureUrl: 'http://example.com/profile.jpg',
    );
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
