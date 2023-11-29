

import 'package:flutter/material.dart';
import 'package:sport_updates/pages/home_page.dart';
import 'package:sport_updates/style/theme.dart';

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
      theme: darkTheme,
      darkTheme: darkTheme,
      home: const HomeScreen(),
    );
  }
}
