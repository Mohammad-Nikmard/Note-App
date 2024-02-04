import 'package:flutter/material.dart';
import 'package:todo/constants/constants.dart';

class TaskTypeWidget extends StatefulWidget {
  const TaskTypeWidget({super.key});

  @override
  State<TaskTypeWidget> createState() => _TaskTypeWidgetState();
}

class _TaskTypeWidgetState extends State<TaskTypeWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168,
      child: ListView.builder(
        itemCount: 3,
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
              child: Container(
                height: 168,
                width: 120,
                decoration: BoxDecoration(
                  color: (selectedIndex == index)
                      ? MyColors.greenColor
                      : Colors.transparent,
                  border: Border.all(
                    width: 2,
                    color: (selectedIndex == index)
                        ? MyColors.greenColor
                        : Colors.black,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset("images/banking.png"),
                    Text(
                      "امور بانکی",
                      style: TextStyle(
                        fontFamily: "SM",
                        fontSize: 16,
                        color: (selectedIndex == index)
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
