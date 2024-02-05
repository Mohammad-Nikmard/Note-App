import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/BLoC/Home/home_bloc.dart';
import 'package:todo/DI/service_locator.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/data/model/task_type.dart';
import 'package:todo/ui/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskTypeAdapter());
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('TaskBox');

  initServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => locator.get<HomeBloc>(),
        child: const HomeScreen(),
      ),
    );
  }
}
