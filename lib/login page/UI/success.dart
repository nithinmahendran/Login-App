import 'package:flutter/material.dart';
import 'package:loginapp/models/global.dart';

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
             
              height: 180.0,
              child: new Image.asset(
                'assets/images/party.png',
              ),
              
            ),
            Padding(
              padding: EdgeInsets.only(left: 90.0,top:10.0),
              child: Text("You have successfully logged in!",style: successTitle,))
          ],
        ));
  }
}
