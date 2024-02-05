import 'package:flutter/material.dart';
import 'package:time_pickerr/time_pickerr.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/widget/task_type_widget.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  FocusNode? _focusNode1;
  FocusNode? _focusNode2;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subTitleContorller = TextEditingController();

  int selectedIndex = 0;

  @override
  void initState() {
    _focusNode1 = FocusNode();
    _focusNode2 = FocusNode();
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
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
            Directionality(
              textDirection: TextDirection.rtl,
              child: CustomHourPicker(
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
                onPositivePressed: (context, time) {},
                onNegativePressed: (context) {},
              ),
            ),
            // SizedBox(
            //   height: 168,
            //   child: ListView.builder(
            //     itemCount: 3,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) {
            //       return TaskTypeWidget(
            //         index: index,
            //         selectedIndex: selectedIndex,
            //       );
            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
                  Navigator.pop(context);
                },
                child: const Text(
                  "ایجاد تسک",
                  style: TextStyle(
                    fontFamily: "SM",
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
