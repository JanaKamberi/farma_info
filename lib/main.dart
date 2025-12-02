import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const FarmaInfoApp());
}

class FarmaInfoApp extends StatelessWidget {
  const FarmaInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmaInfo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}