import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskito_mobile/util/colors.dart';
import 'package:taskito_mobile/util/constants.dart';

class TaskListItem extends StatelessWidget {
  final VoidCallback onIItemPressed;
  final String taskTitle;
  final bool isCompleted;
  final String taskDescription;
  final String dueDate;

  const TaskListItem(
      {Key? key,
      required this.onIItemPressed,
      required this.taskTitle,
      required this.isCompleted,
      required this.taskDescription,
      required this.dueDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.purple,
          borderRadius: BorderRadius.circular(24 )
        ),
        child: MaterialButton(
          onPressed: onIItemPressed,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      taskTitle,
                      style: GoogleFonts.poppins(
                        fontSize: FontSizes.bodyLarge,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(dueDate, style: GoogleFonts.poppins(
                        fontSize: FontSizes.bodyLarge,
                        color: AppColors.white,
                        fontWeight: FontWeight.normal
                    ),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 32),
                child: Text(
                  taskDescription,
                  style: GoogleFonts.poppins(
                    fontSize: FontSizes.bodyLarge,
                    color: AppColors.greyLight,
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
