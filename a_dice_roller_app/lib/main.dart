import 'package:flutter/material.dart';

import 'gradient_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colors: [
            Color.fromARGB(255, 26, 2, 60),
            Color.fromARGB(255, 45, 7, 98),
          ],
        ),
      ),
    );
  }
}
