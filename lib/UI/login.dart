import 'package:flutter/material.dart';
import 'package:loginapp/UI/success.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/UI/register.dart';
import 'package:loginapp/models/authentication.dart';
import 'package:loginapp/models/global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String?, String?> _authData = {'email': '', 'password': ''};

  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    try {
      await Provider.of<Authentication>(context, listen: false)
          .logIn(_authData['email'], _authData['password']);

      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => SuccessPage()));
    } catch (error) {
      var errorMessage = 'Authentication Failed. Please try again later.';
      _showErrorDialog(errorMessage);
    }
  }

  void _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('An error occurred'),
              content: Text(msg),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Ok'))
              ],
            ));
  }

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
                Form(
                  key: _formKey,
                  child: Wrap(
                    runSpacing: 25,
                    children: [
                      Container(
                        height: 52.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xffededed)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty || !(value.contains('@'))) {
                                return 'Invalid Email';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['email'] = value;
                            },
                            decoration: InputDecoration(
                                fillColor: Color(0xffededed),
                                hintText: 'Email Address',
                                border: InputBorder.none,
                                suffixIcon: Icon(
                                  Icons.alternate_email,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                      ),
                      Container(
                        height: 52.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xffededed)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty || value.length <= 5) {
                                print("Nothing");
                                return 'Invalid Password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['password'] = value;
                            },
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                                fillColor: Color(0xffededed),
                                hintText: 'Password',
                                border: InputBorder.none,
                                suffixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _submit();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 37.0),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(
                                  10)), // Make rounded corner
                          child: Text("Login", style: buttonText),
                        ),
                      ),
                    ],
                  ),
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
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => RegisterPage()));
                    },
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
