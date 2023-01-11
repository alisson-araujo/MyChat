import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyChat',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MyChat'),
        ),
        body: const Center(
          child: Text('iniciando projeto'),
        ),
      ),
    );
  }
}
