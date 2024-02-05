import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/BLoC/Home/home_bloc.dart';
import 'package:todo/BLoc/Home/home_event.dart';
import 'package:todo/BLoc/Home/home_state.dart';
import 'package:todo/DI/service_locator.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/ui/add_task_screen.dart';
import 'package:todo/widget/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeShowListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: MyColors.greenColor,
            ),
          );
        }
        if (state is HomeResponse) {
          if (state.taskList.isEmpty) {
            return const EmptyBody();
          } else {
            return MainBody(getList: state.taskList);
          }
        }
        return const Text("");
      },
      listener: (cotnext, state) {},
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({super.key, required this.getList});
  final List<Task> getList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: locator.get<HomeBloc>(),
                child: const AddTaskScreen(),
              ),
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
                itemCount: getList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    child: BlocProvider(
                      create: (context) => locator.get<HomeBloc>(),
                      child: TaskWidget(
                        taskItem: getList[index],
                      ),
                    ),
                    onDismissed: (direction) {
                      context.read<HomeBloc>().add(DeleteItemEvent(index));
                    },
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

class EmptyBody extends StatelessWidget {
  const EmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: locator.get<HomeBloc>(),
                child: const AddTaskScreen(),
              ),
            ),
          );
        },
        backgroundColor: MyColors.greenColor,
        child: Image.asset("images/icon_add.png"),
      ),
      backgroundColor: MyColors.backgroundScreenColor,
      body: const SafeArea(
        child: Center(
          child: Text(
            "لیست خالی است",
            style: TextStyle(
              fontFamily: "SM",
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
