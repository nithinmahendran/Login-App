import 'dart:io';
import 'package:flutter/material.dart';
import 'package:loginapp/UI/register.dart';
import 'UI/login.dart';
import 'UI/success.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/models/authentication.dart';
void main() async {
  // Directory appDocumentDir;
  //appDocumentDir = await path_provider.getApplicationDocumentsDirectory();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Authentication() )
      ],
          child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Login App',
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Poppins"),
          home: LoginPage()),
    );
   
  }

 
}
