import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/DI/service_locator.dart';
import 'package:todo/data/model/task_type.dart';
import 'package:todo/ui/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskTypeAdapter());

  initServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
