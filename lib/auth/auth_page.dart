import 'package:flutter/material.dart';
import 'package:login_ui_part_2/Pages/log_in_page.dart';
import 'package:login_ui_part_2/Pages/signup_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // Initially show login page
  bool showLoginPage = true;

  // This func will toogle screen when 'Sign up here' or 'Sign in here' are pressed
  void toogleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toogleScreen);
    } else {
      return SignUpPage(showLoginPage: toogleScreen);
    }
  }
}
