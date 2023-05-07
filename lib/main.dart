import 'package:flutter/material.dart';
import 'package:pdpui_intro_4/packages/homepage.dart';
import 'package:pdpui_intro_4/packages/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  const IntroPage(),
      routes: {
        IntroPage.id:(context) => const IntroPage(),
        HomePage.id:(context) => const HomePage(),
      },

    );
  }
}

