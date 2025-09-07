import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Nur Quran',
      home: Scaffold(
        appBar: AppBar(title: const Text('E-Nur Quran')),
        body: const Center(child: Text('Hello E-Nur Quran')),
      ),
    );
  }
}
