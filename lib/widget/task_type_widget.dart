import 'package:flutter/material.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/data/model/task_type.dart';

class TaskTypeWidget extends StatefulWidget {
  const TaskTypeWidget(
      {super.key,
      required this.selectedIndex,
      required this.index,
      required this.taskTypeItem});
  final int selectedIndex;
  final int index;
  final TaskType taskTypeItem;

  @override
  State<TaskTypeWidget> createState() => _TaskTypeWidgetState();
}

class _TaskTypeWidgetState extends State<TaskTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      width: 120,
      decoration: BoxDecoration(
        color: (widget.selectedIndex == widget.index)
            ? MyColors.greenColor
            : Colors.transparent,
        border: Border.all(
          width: 2,
          color: (widget.selectedIndex == widget.index)
              ? MyColors.greenColor
              : Colors.black,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Image.asset(widget.taskTypeItem.image),
          Text(
            widget.taskTypeItem.title,
            style: TextStyle(
              fontFamily: "SM",
              fontSize: 16,
              color: (widget.selectedIndex == widget.index)
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
