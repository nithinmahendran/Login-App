import 'package:flutter/material.dart';
import 'package:loginapp/models/global.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  "Sign Up",
                  style: headerTitle,
                ),
                Text("Enter your details to continue.", style: descriptionText),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
