import 'package:flutter/material.dart';
import 'package:mapstest/color_schemes.g.dart';
import 'package:mapstest/screens/task_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks maps',
      theme: ThemeData(
        colorScheme: colorScheme,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: const TaskListScreen(),
    );
  }
}
