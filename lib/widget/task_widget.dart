import 'package:flutter/material.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/ui/edit_task_screen.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                        children: [
                          Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              value: true,
                              onChanged: (onchanged) {},
                              activeColor: MyColors.greenColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              checkColor: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            "آموزش فلاتر",
                            style: TextStyle(
                              fontFamily: "SM",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "انجام تسک مورد نظر",
                      style: TextStyle(
                        fontFamily: "SM",
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const TimeChip(),
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
              Image.asset("images/hard_working.png"),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeChip extends StatelessWidget {
  const TimeChip({super.key});

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
            const Text(
              "11:00",
              style: TextStyle(
                fontFamily: "SM",
                fontSize: 10,
                color: Colors.white,
              ),
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
                fontSize: 10,
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
