import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/BLoC/Home/home_bloc.dart';
import 'package:todo/BLoc/Home/home_event.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/ui/edit_task_screen.dart';
import 'package:todo/util/dateTime_extension.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key, required this.taskItem});
  final Task taskItem;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isTapped = !isTapped;
          });
          context.read<HomeBloc>().add(CheckBoxItem(isTapped, widget.taskItem));
        },
        child: Container(
          height: 132,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 32,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Transform.scale(
                              scale: 1.2,
                              child: Checkbox(
                                value: widget.taskItem.isDone,
                                onChanged: (onchanged) {},
                                activeColor: MyColors.greenColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                checkColor: Colors.white,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                widget.taskItem.title,
                                style: const TextStyle(
                                  fontFamily: "SM",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Text(
                          widget.taskItem.subtitle,
                          textDirection: TextDirection.rtl,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: "SM",
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TimeChip(
                            time: widget.taskItem.time,
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                            child: const EditChip(),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EditTaskScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(widget.taskItem.taskType.image),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimeChip extends StatelessWidget {
  const TimeChip({super.key, required this.time});
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83,
      height: 28,
      decoration: const BoxDecoration(
        color: MyColors.greenColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${time.converToHour()}:${time.converToMinute()}",
                  style: const TextStyle(
                    fontFamily: "SM",
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Image.asset(
              "images/icon_time.png",
              height: 16,
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class EditChip extends StatelessWidget {
  const EditChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83,
      height: 28,
      decoration: BoxDecoration(
        color: MyColors.greenColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "ویرایش",
              style: TextStyle(
                fontFamily: "SM",
                fontSize: 12,
                color: MyColors.greenColor,
              ),
            ),
            Image.asset(
              "images/icon_edit.png",
              height: 16,
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
