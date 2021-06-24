import 'package:flutter/material.dart';
import 'package:loginapp/models/global.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 70.0, left: 40.0),
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
                  const EdgeInsets.only(top: 25.0, left: 40.0, right: 40.0),
              child: Column(
                children: [
                  Wrap(
                    runSpacing: 20,
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
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextField(
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
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextField(
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
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextField(
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
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: TextField(
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
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextField(
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              fillColor: Color(0xffededed),
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 37.0, left: 40.0, right: 40.0),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.circular(10)), // Make rounded corner
              child: Text("Sign Up", style: buttonText),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Text("Already Have an account?"),
                  TextButton(
                      onPressed: () {},
                      child: Text("Login Here",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              decoration: TextDecoration.underline)))
                ],
              ),
            )
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
