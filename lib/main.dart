import 'package:flutter/material.dart';
import 'package:mug_manager/ui/features/mug_display/view/mug_display_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mug Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MugDisplayPage(),
    );
  }
}
