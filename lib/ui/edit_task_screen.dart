import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_pickerr/time_pickerr.dart';
import 'package:todo/BLoC/Home/home_bloc.dart';
import 'package:todo/BLoc/Home/home_event.dart';
import 'package:todo/BLoc/Task/task_bloc.dart';
import 'package:todo/BLoc/Task/task_event.dart';
import 'package:todo/BLoc/Task/task_state.dart';
import 'package:todo/DI/service_locator.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/data/model/task_type.dart';
import 'package:todo/widget/task_type_widget.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key, required this.taskItem});
  final Task taskItem;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = TaskBloc(locator.get(), locator.get());
        bloc.add(TaskTypeListEvent());
        return bloc;
      },
      child: BlocConsumer<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: MyColors.greenColor,
              ),
            );
          }

          if (state is TaskReponseState) {
            return _MainBody(
              taskTypeList: state.taskTypeList,
              taskItem: widget.taskItem,
            );
          }
          return const Text("");
        },
        listener: (context, state) {
          if (state is TaskEditedState) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}

class _MainBody extends StatefulWidget {
  const _MainBody(
      {super.key, required this.taskTypeList, required this.taskItem});
  final List<TaskType> taskTypeList;
  final Task taskItem;

  @override
  State<_MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<_MainBody> {
  FocusNode? _focusNode1;
  FocusNode? _focusNode2;

  TextEditingController? _titleController;
  TextEditingController? _subTitleContorller;

  int selectedIndex = 0;
  DateTime? time;

  @override
  void initState() {
    _focusNode1 = FocusNode();
    _focusNode2 = FocusNode();

    _titleController = TextEditingController(text: widget.taskItem.title);
    _subTitleContorller = TextEditingController(text: widget.taskItem.subtitle);

    selectedIndex = widget.taskItem.taskType.index;
    super.initState();
  }

  @override
  void dispose() {
    _focusNode1!.dispose();
    _focusNode2!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundScreenColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: _titleController,
                    onTap: () {
                      setState(() {
                        FocusScope.of(context).requestFocus(_focusNode1);
                      });
                    },
                    focusNode: _focusNode1,
                    style: const TextStyle(
                      fontFamily: "SM",
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 12),
                      labelText: "عنوان تسک...",
                      labelStyle: TextStyle(
                        fontFamily: "SM",
                        color: _focusNode1!.hasFocus
                            ? MyColors.greenColor
                            : Colors.black,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          width: 2,
                          color: MyColors.greenColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: _subTitleContorller,
                    focusNode: _focusNode2,
                    onTap: () {
                      setState(() {
                        FocusScope.of(context).requestFocus(_focusNode2);
                      });
                    },
                    maxLines: 4,
                    style: const TextStyle(
                      fontFamily: "SM",
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      labelText: "توضیحات تسک...",
                      labelStyle: TextStyle(
                        fontFamily: "SM",
                        color: _focusNode2!.hasFocus
                            ? MyColors.greenColor
                            : Colors.black,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          width: 2,
                          color: MyColors.greenColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              CustomHourPicker(
                date: widget.taskItem.time,
                elevation: 2,
                title: "زمان مورد نظر خود را انتخاب کنید",
                titleStyle: const TextStyle(
                  fontFamily: "SM",
                  color: Colors.black,
                ),
                positiveButtonText: "انتخاب",
                negativeButtonText: "کنسل",
                negativeButtonStyle: const TextStyle(
                  fontFamily: "SM",
                  color: Color.fromARGB(255, 197, 39, 28),
                ),
                positiveButtonStyle: const TextStyle(
                  fontFamily: "SM",
                  color: MyColors.greenColor,
                ),
                onPositivePressed: (context, time) {
                  setState(() {
                    this.time = time;
                  });
                },
                onNegativePressed: (context) {},
              ),
              SizedBox(
                height: 168,
                child: ListView.builder(
                  itemCount: widget.taskTypeList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: TaskTypeWidget(
                          taskTypeItem: widget.taskTypeList[index],
                          index: index,
                          selectedIndex: selectedIndex,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 45),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    )),
                    backgroundColor: MyColors.greenColor,
                  ),
                  onPressed: () {
                    context.read<TaskBloc>().add(
                          EditTaskEvent(
                            widget.taskItem,
                            _titleController!.text,
                            _subTitleContorller!.text,
                            time!,
                            widget.taskTypeList[selectedIndex],
                          ),
                        );
                    context.read<HomeBloc>().add(HomeShowListEvent());
                  },
                  child: const Text(
                    "ویرایش تسک",
                    style: TextStyle(
                      fontFamily: "SM",
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
