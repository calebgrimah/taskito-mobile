import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskito_mobile/dashboard/widgets/task_list_item.dart';
import 'package:taskito_mobile/util/colors.dart';
import 'package:taskito_mobile/util/constants.dart';
import 'package:taskito_mobile/util/strings.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 32.0, horizontal: 24),
                  child: Text(
                    AppStrings.jobs,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: FontSizes.heading,
                        color: AppColors.greyDark),
                  ),
                )
              ],
            ),
          ),
          TaskListItem(
            onIItemPressed: () {},
            taskTitle: "TaskTitle",
            isCompleted: false,
            taskDescription: "Task Description",
            dueDate: "Due Date",
          ),
          TaskListItem(
            onIItemPressed: () {},
            taskTitle: "TaskTitle",
            isCompleted: false,
            taskDescription: "Task Description",
            dueDate: "Due Date",
          ),
        ],
      ),
    );
    ;
  }
}
