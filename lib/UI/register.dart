import 'package:flutter/material.dart';
import 'package:loginapp/UI/login.dart';
import 'package:loginapp/models/authentication.dart';
import 'package:loginapp/models/global.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String?, String?> _authData = {'email': '', 'password': ''};

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

  void _successDialog(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Success!'),
              content: Text(msg),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text('Ok'))
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    try {
      await Provider.of<Authentication>(context, listen: false)
          .signUp(_authData['email'], _authData['password']);
      var message = 'User Registered Successfully.Please Log in to continue';
      _successDialog(message);
    } catch (error) {
      var errorMessage =
          'User is already registered. Please try with other credentials';
      _showErrorDialog(errorMessage);
    }
  }

  DateTime currentDate = DateTime.now();
  TextEditingController fNameController = TextEditingController();
  TextEditingController mNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phNumController = TextEditingController();
  TextEditingController nativeLocController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50.0, left: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign Up", style: headerTitle),
                  Text("Enter your details to continue.",
                      style: descriptionText),
                ],
              ),
            ),
            Container(
              // Container for text fields
              padding:
                  const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Wrap(
                      runSpacing: 17,
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
                              onSaved: (value) {},
                              controller: fNameController,
                              decoration: InputDecoration(
                                fillColor: Color(0xffededed),
                                hintText: 'First Name',
                                border: InputBorder.none,
                              ),
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
                              onSaved: (value) {},
                              controller: mNameController,
                              decoration: InputDecoration(
                                fillColor: Color(0xffededed),
                                hintText: 'Middle Name',
                                border: InputBorder.none,
                              ),
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
                              onSaved: (value) {},
                              controller: lNameController,
                              decoration: InputDecoration(
                                fillColor: Color(0xffededed),
                                hintText: 'Last Name',
                                border: InputBorder.none,
                              ),
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
                              onSaved: (value) {
                                _authData['email'] = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty || !(value.contains('@'))) {
                                  return 'Invalid Email';
                                }
                                return null;
                              },
                              controller: emailController,
                              decoration: InputDecoration(
                                fillColor: Color(0xffededed),
                                hintText: 'Email Address',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: 60.0,
                                child: Container(
                                  height: 52.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: const Color(0xffededed)),
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.0, right: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(DateFormat('dd MMM yyyy')
                                              .format(currentDate)),
                                          InkWell(
                                            onTap: () {
                                              _selectDate(context);
                                            },
                                            child:
                                                Icon(Icons.date_range_outlined),
                                          )
                                        ],
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Expanded(
                              child: Container(
                                width: 120.0,
                                height: 52.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: const Color(0xffededed)),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: TextFormField(
                                    onSaved: (value) {},
                                    controller: phNumController,
                                    decoration: InputDecoration(
                                      fillColor: Color(0xffededed),
                                      hintText: 'Phone Number',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                              onSaved: (value) {},
                              controller: nativeLocController,
                              decoration: InputDecoration(
                                fillColor: Color(0xffededed),
                                hintText: 'Native Location',
                                border: InputBorder.none,
                              ),
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
                              controller: passController,
                              decoration: InputDecoration(
                                fillColor: Color(0xffededed),
                                hintText: 'Password',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(
                                    10)), // Make rounded corner
                            child: Text("Sign Up", style: buttonText),
                          ),
                          onTap: () {
                            _submit();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // InkWell(
            //   child: Container(
            //     margin:
            //         const EdgeInsets.only(top: 25.0, left: 40.0, right: 40.0),
            //     width: MediaQuery.of(context).size.width,
            //     padding: const EdgeInsets.all(10),
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //         color: Colors.black,
            //         borderRadius:
            //             BorderRadius.circular(10)), // Make rounded corner
            //     child: Text("Sign Up", style: buttonText),
            //   ),
            //   onTap: () {
            //     // User data = User(
            //     //     email: emailController.text.toString(),
            //     //     password: passController.text.toString(),
            //     //     dob: DateFormat('dd MMM yyyy').format(currentDate),
            //     //     firstName: fNameController.text.toString(),
            //     //     middleName: mNameController.text.toString(),
            //     //     lastName: lNameController.text.toString(),
            //     //     phoneNum: phNumController.text.toString(),
            //     //     nativeLoc: nativeLocController.text.toString());
            //     // addValues(data);
            //     // setState(() {
            //     //   users.add(data);
            //     // });
            //   },
            // ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Text("Already Have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginPage()));
                      },
                      child: Text("Login Here",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              decoration: TextDecoration.underline)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1960),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }
}
