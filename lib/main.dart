import 'package:flutter/material.dart';
import 'package:globo_fitness/screens/intro_screen.dart';

void main() {
  runApp(
    const GlobeApp(),
  ); //show on the screen the widgeds that we put in the method
}

//shortcut: stless
class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: const IntroScreen(),
    );
  }
}
