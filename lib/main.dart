import 'package:flutter/material.dart';
import 'package:shop_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shop App",
      theme: ThemeData(
        fontFamily: "Oswald",
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
      ),
      home: const HomePage(),
    );
  }
}
