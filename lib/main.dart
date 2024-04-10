import 'package:core_flutter_final_exam/view/screens/addDataScreen.dart';
import 'package:core_flutter_final_exam/view/screens/homeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomeScreen(),
        '/addData': (context) => const AddDataScreen(),
      },
    );
  }
}
