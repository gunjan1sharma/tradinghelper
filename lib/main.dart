import 'package:flutter/material.dart';
import 'package:trading_helper/screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trading Helper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "RobotoMono",
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 2, 233, 10)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
