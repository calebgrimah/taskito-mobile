import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskito_mobile/dashboard/views/home_screen.dart';
import 'package:taskito_mobile/dashboard/views/jobs_screen.dart';
import 'package:taskito_mobile/util/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  BottomNavigationMenuItem? currentItem;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.orange,
        onPressed: (){},
        child: const Icon(
            Icons.add
        ),
      ),
      body: SafeArea(
        child: AnimatedCrossFade(
          duration: Duration(milliseconds: 400),
          firstChild: const HomeScreen(),
          secondChild: const JobsScreen(),
          crossFadeState: currentItem == null || currentItem?.id == 1
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(displayWidth * .05),
            height: displayWidth * .155,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyDark.withOpacity(.1),
                  blurRadius: 30,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...navigationButtons.map((index) => InkWell(
                        onTap: () {
                          setState(() {
                            currentItem = index;
                            HapticFeedback.lightImpact();
                          });
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Stack(
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentItem
                                  ? displayWidth * .32
                                  : displayWidth * .18,
                              alignment: Alignment.center,
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                height: index == currentItem
                                    ? displayWidth * .12
                                    : 0,
                                width: index == currentItem
                                    ? displayWidth * .32
                                    : 0,
                                decoration: BoxDecoration(
                                  color: index == currentItem
                                      ? AppColors.purple.withOpacity(.2)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentItem
                                  ? displayWidth * .31
                                  : displayWidth * .18,
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                      AnimatedContainer(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        width: index == currentItem
                                            ? displayWidth * .13
                                            : 0,
                                      ),
                                      AnimatedOpacity(
                                        opacity: index == currentItem ? 1 : 0,
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        child: Text(
                                          index == currentItem
                                              ? index.title
                                              : '',
                                          style: const TextStyle(
                                            color: AppColors.purple,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      AnimatedContainer(
                                        duration: Duration(seconds: 1),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        width: index == currentItem
                                            ? displayWidth * .03
                                            : 20,
                                      ),
                                      Icon(
                                        index.iconData,
                                        size: displayWidth * .076,
                                        color: index == currentItem
                                            ? Colors.purple
                                            : Colors.black26,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<BottomNavigationMenuItem> navigationButtons = [
    BottomNavigationMenuItem(1, "Home", Icons.home_rounded),
    BottomNavigationMenuItem(2, "Jobs", Icons.work_rounded),
  ];
}

class BottomNavigationMenuItem {
  final int id;
  final String title;
  final IconData iconData;

  BottomNavigationMenuItem(this.id, this.title, this.iconData);
}
