import 'package:adlogin/Pages/home_page.dart';
import 'package:adlogin/Pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCwaFE21mbWpskkciCqFVdnztqNnQNwLyQ",
          appId: "1:77822549283:android:60a89cd3142e59adc78096",
          messagingSenderId: "77822549283",
          projectId: "adlogintut"));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login And Sign up ',
      theme: ThemeData(primarySwatch: Colors.red),
      home: LoginPage(),
    );
  }
}
