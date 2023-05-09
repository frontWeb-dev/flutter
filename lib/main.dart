import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// root
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Theme setting : Material(goggle) || Cupertino(ios);
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.red.shade200,
          body: const Center(
            child: Text("hello flutter"),
          )),
    );
  }
}
