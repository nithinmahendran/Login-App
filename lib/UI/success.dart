import 'package:flutter/material.dart';
import 'package:loginapp/UI/login.dart';
import 'package:loginapp/models/global.dart';
import 'package:lottie/lottie.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          Lottie.asset(
            'assets/confetti.json',
            repeat: true,
            reverse: false,
            animate: true,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              Container(
                margin: EdgeInsets.only(top:80),
                height: 180.0,
                child: new Image.asset(
                  'assets/images/party.png',
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 90.0, top: 10.0),
                  child: Text(
                    "You have successfully logged in!",
                    style: successTitle,
                  )),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 80.0,left: 40.0,right: 40.0),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(10)), // Make rounded corner
                  child: Text("Logout", style: whiteButtonText),
                ),
              ),
            ],
          ),
        ]));
  }
}
