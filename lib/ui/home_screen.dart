import 'package:flutter/material.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/ui/add_task_screen.dart';
import 'package:todo/widget/task_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );
        },
        backgroundColor: MyColors.greenColor,
        child: Image.asset("images/icon_add.png"),
      ),
      backgroundColor: MyColors.backgroundScreenColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    child: const TaskWidget(),
                    onDismissed: (direction) {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
