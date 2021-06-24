import 'package:flutter/material.dart';
import 'package:loginapp/models/global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 200.0, left: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login", style: headerTitle),
                Text("Login to continue.", style: descriptionText),
              ],
            ),
          ),
          Container(
            //Text fields
            padding: const EdgeInsets.only(top: 60.0, left: 40.0, right: 40.0),
            child: Column(
              children: [
                Wrap(
                  runSpacing: 25,
                  children: [
                    Container(
                      height: 52.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xffededed)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                          decoration: InputDecoration(
                              fillColor: Color(0xffededed),
                              hintText: 'Email Address',
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.alternate_email,color: Colors.black,)),
                        ),
                      ),
                    ),
                    Container(
                      height: 52.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xffededed)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                          obscureText: true,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                              fillColor: Color(0xffededed),
                              hintText: 'Password',
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.lock,color: Colors.black,)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 37.0),
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.circular(10)), // Make rounded corner
                      child: Text("Sign Up", style: buttonText),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                Text("Don't Have an account?"),
                TextButton(
                    onPressed: () {},
                    child: Text("Sign Up Here",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            decoration: TextDecoration.underline)))
              ],
            ),
          )
        ],
      )),
    );
  }
}
