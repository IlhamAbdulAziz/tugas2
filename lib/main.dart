import 'package:flutter/material.dart';
import 'package:tugas2/pages/main_pages.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPages(), 
    theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}