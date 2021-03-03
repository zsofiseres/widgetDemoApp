import 'package:flutter/material.dart';

class PageTwoViewModel with ChangeNotifier {
  bool isLoading = false;

  void _toggleIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future symulateNetworkRequest() async {
    _toggleIsLoading();
    await Future.delayed(Duration(seconds: 2));
    _toggleIsLoading();
  }

  String emailValidator(String email) {
    if (email.length > 3) {
      return null;
    }
    return "Az emailnek legalább 3 karakter hosszúnak kell lennie";
  }

  String passwordValidator(String password) {
    if (password == "password") {
      return null;
    } else if (password.length > 3) {
      return "Rossz jelszo";
    }
    return "A jelszónak tartalmaznia kell legalább 3 karaktert";
  }
}
