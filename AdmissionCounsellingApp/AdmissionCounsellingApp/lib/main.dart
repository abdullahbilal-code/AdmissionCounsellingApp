import 'package:admissioncounsellingapp/NoteScreen.dart';
import 'package:admissioncounsellingapp/UniHomePage.dart';
import 'package:admissioncounsellingapp/UniversityLoginScreen.dart';
import 'package:admissioncounsellingapp/home_screen.dart';
import 'package:admissioncounsellingapp/login_opt.dart';
import 'package:admissioncounsellingapp/login_screen.dart';
import 'package:admissioncounsellingapp/quiz_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'model/studentProfile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admission Counselling App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: loginoption() /* uniHomeScreen() studentProfile()*/,
    );
  }
}
