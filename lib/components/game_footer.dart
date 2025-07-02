import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/components/showcustomdialog.dart';
import 'package:yallanfoz/controller/gamepage_controller.dart';

class GameFooter extends GetView<GamePageController> {
  final page;
  const GameFooter({super.key, this.page});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool showControls = page == 1;
    return Expanded(
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 149, 97, 99),
              Color.fromARGB(255, 137, 37, 9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 20, spreadRadius: 10),
          ],
        ),
        child: Container(
          width: width,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFFea8685),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          controller.mygame['first_team'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.015,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 5),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Visibility(
                                visible: showControls,
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                child: IconButton(
                                  iconSize: width * 0.02,
                                  color: Colors.white,
                                  onPressed: () {
                                    controller.first_team_score.value =
                                        controller.first_team_score.value + 100;
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Obx(
                                  () => Text(
                                    "${controller.first_team_score}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.015,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Visibility(
                                visible: showControls,
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                child: IconButton(
                                  iconSize: width * 0.02,
                                  color: Colors.white,
                                  onPressed: () {
                                    controller.first_team_score.value =
                                        controller.first_team_score.value - 100;
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "وسائل المساعدة",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.015,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              shape: const CircleBorder(),
                              child: Obx(() {
                                if (controller.first_team_two.value == 0 &&
                                    controller.last_answer == 1 &&
                                    page == 2) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xFFea8685),
                                        width: 2,
                                      ),
                                      color:
                                          controller.first_team_two_active.value
                                              ? Color(0xFFea8685)
                                              : null,
                                    ),
                                    child: InkWell(
                                      customBorder: const CircleBorder(),
                                      onTap: () {
                                        // action
                                        controller.first_team_two_active.value =
                                            !controller
                                                .first_team_two_active
                                                .value;
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          width * 0.012,
                                        ), // تحكم في حجم الأيقونة
                                        child: Icon(
                                          Icons.looks_two_outlined,
                                          size: width * 0.028,
                                          color:
                                              controller
                                                      .first_team_two_active
                                                      .value
                                                  ? Colors.white
                                                  : Color(0xFFea8685),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                    ),
                                    child: InkWell(
                                      customBorder: const CircleBorder(),
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          width * 0.012,
                                        ), // تحكم في حجم الأيقونة
                                        child: Icon(
                                          Icons.looks_two_outlined,
                                          size: width * 0.028,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }),
                            ),
                          ),
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              shape: const CircleBorder(),
                              child: Obx(() {
                                if (controller.first_team_phone.value == 0 &&
                                    controller.last_answer == 1 &&
                                    page == 2) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xFFea8685),
                                        width: 2,
                                      ),
                                      color:
                                          controller
                                                  .first_team_phone_active
                                                  .value
                                              ? Color(0xFFea8685)
                                              : null,
                                    ),
                                    child: InkWell(
                                      customBorder: const CircleBorder(),
                                      onTap: () {
                                        // action
                                        controller
                                            .first_team_phone_active
                                            .value = !controller
                                                .first_team_phone_active
                                                .value;
                                        if (controller
                                            .first_team_phone_active
                                            .value) {
                                          Get.dialog(
                                            barrierDismissible: false,
                                            MediaQuery(
                                              data: MediaQuery.of(
                                                context,
                                              ).copyWith(
                                                viewInsets: EdgeInsets.zero,
                                              ),
                                              child: HelperPhoneDialog(),
                                            ),
                                          );
                                        }
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          width * 0.012,
                                        ), // تحكم في حجم الأيقونة
                                        child: Icon(
                                          Icons.phone,
                                          size: width * 0.028,
                                          color:
                                              controller
                                                      .first_team_phone_active
                                                      .value
                                                  ? Colors.white
                                                  : Color(0xFFea8685),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                    ),
                                    child: InkWell(
                                      customBorder: const CircleBorder(),
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          width * 0.012,
                                        ), // تحكم في حجم الأيقونة
                                        child: Icon(
                                          Icons.phone,
                                          size: width * 0.028,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }),
                            ),
                          ),
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              shape: const CircleBorder(),
                              child: Obx(() {
                                if (controller.first_team_hole.value == 0 &&
                                    controller.last_answer == 1 &&
                                    page == 1) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xFFea8685),
                                        width: 2,
                                      ),
                                      color:
                                          controller
                                                  .first_team_hole_active
                                                  .value
                                              ? Color(0xFFea8685)
                                              : null,
                                    ),
                                    child: InkWell(
                                      customBorder: const CircleBorder(),
                                      onTap: () {
                                        // action
                                        controller
                                            .first_team_hole_active
                                            .value = !controller
                                                .first_team_hole_active
                                                .value;
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          width * 0.012,
                                        ), // تحكم في حجم الأيقونة
                                        child: Icon(
                                          Icons.swap_vert,
                                          size: width * 0.028,
                                          color:
                                              controller
                                                      .first_team_hole_active
                                                      .value
                                                  ? Colors.white
                                                  : Color(0xFFea8685),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                    ),
                                    child: InkWell(
                                      customBorder: const CircleBorder(),
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          width * 0.012,
                                        ), // تحكم في حجم الأيقونة
                                        child: Icon(
                                          Icons.swap_vert,
                                          size: width * 0.028,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFFea8685),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          controller.mygame['second_team'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.015,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 5),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Visibility(
                                visible: showControls,
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                child: IconButton(
                                  iconSize: width * 0.02,
                                  color: Colors.white,
                                  onPressed: () {
                                    controller.second_team_score.value =
                                        controller.second_team_score.value +
                                        100;
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Obx(
                                  () => Text(
                                    "${controller.second_team_score}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.012,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Visibility(
                                visible: showControls,
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                child: IconButton(
                                  iconSize: width * 0.02,
                                  color: Colors.white,
                                  onPressed: () {
                                    controller.second_team_score.value =
                                        controller.second_team_score.value -
                                        100;
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "وسائل المساعدة",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.015,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              shape: const CircleBorder(),
                              child: Obx(() {
                                if (controller.second_team_two.value == 0 &&
                                    controller.last_answer == 2 &&
                                    page == 2) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xFFea8685),
                                        width: 2,
                                      ),
                                      color:
                                          controller
                                                  .second_team_two_active
                                                  .value
                                              ? Color(0xFFea8685)
                                              : null,
                                    ),
                                    child: InkWell(
                                      customBorder: const CircleBorder(),
                                      onTap: () {
                                        // action
                                        controller
                                            .second_team_two_active
                                            .value = !controller
                                                .second_team_two_active
                                                .value;
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          width * 0.012,
                                        ), // تحكم في حجم الأيقونة
                                        child: Icon(
                                          Icons.looks_two_outlined,
                                          size: width * 0.028,
                                          color:
                                              controller
                                                      .second_team_two_active
                                                      .value
                                                  ? Colors.white
                                                  : Color(0xFFea8685),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                    ),
                                    child: InkWell(
                                      customBorder: const CircleBorder(),
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          width * 0.012,
                                        ), // تحكم في حجم الأيقونة
                                        child: Icon(
                                          Icons.looks_two_outlined,
                                          size: width * 0.028,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }),
                            ),
                          ),
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              shape: const CircleBorder(),
                              child: Obx(() {
                                if (controller.second_team_phone.value == 0 &&
                                    controller.last_answer == 2 &&
                                    page == 2) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xFFea8685),
                                        width: 2,
                                      ),
                                      color:
                                          controller
                                                  .second_team_phone_active
                                                  .value
                                              ? Color(0xFFea8685)
                                              : null,
                                    ),
                                    child: InkWell(
                                      customBorder: const CircleBorder(),
                                      onTap: () {
                                        // action
                                        controller
                                            .second_team_phone_active
                                            .value = !controller
                                                .second_team_phone_active
                                                .value;
                                        if (controller
                                            .second_team_phone_active
                                            .value) {
                                          Get.dialog(
                                            barrierDismissible: false,
                                            MediaQuery(
                                              data: MediaQuery.of(
                                                context,
                                              ).copyWith(
                                                viewInsets: EdgeInsets.zero,
                                              ),
                                              child: HelperPhoneDialog(),
                                            ),
                                          );
                                        }
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          width * 0.012,
                                        ), // تحكم في حجم الأيقونة
                                        child: Icon(
                                          Icons.phone,
                                          size: width * 0.028,
                                          color:
                                              controller
                                                      .second_team_phone_active
                                                      .value
                                                  ? Colors.white
                                                  : Color(0xFFea8685),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                    ),
                                    child: InkWell(
                                      customBorder: const CircleBorder(),
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          width * 0.012,
                                        ), // تحكم في حجم الأيقونة
                                        child: Icon(
                                          Icons.phone,
                                          size: width * 0.028,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }),
                            ),
                          ),
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              shape: const CircleBorder(),
                              child: Obx(() {
                                if (controller.second_team_hole.value == 0 &&
                                    controller.last_answer == 2 &&
                                    page == 1) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xFFea8685),
                                        width: 2,
                                      ),
                                      color:
                                          controller
                                                  .second_team_hole_active
                                                  .value
                                              ? Color(0xFFea8685)
                                              : null,
                                    ),
                                    child: InkWell(
                                      customBorder: const CircleBorder(),
                                      onTap: () {
                                        // action
                                        controller
                                            .second_team_hole_active
                                            .value = !controller
                                                .second_team_hole_active
                                                .value;
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          width * 0.012,
                                        ), // تحكم في حجم الأيقونة
                                        child: Icon(
                                          Icons.swap_vert,
                                          size: width * 0.028,
                                          color:
                                              controller
                                                      .second_team_hole_active
                                                      .value
                                                  ? Colors.white
                                                  : Color(0xFFea8685),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                    ),
                                    child: InkWell(
                                      customBorder: const CircleBorder(),
                                      onTap: () {
                                        // action
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          width * 0.012,
                                        ), // تحكم في حجم الأيقونة
                                        child: Icon(
                                          Icons.swap_vert,
                                          size: width * 0.028,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
