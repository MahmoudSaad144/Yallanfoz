import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/components/showcustomdialog.dart';

class GameFooter extends StatefulWidget {
  final Map<String, dynamic> mygame;
  final int page;
  const GameFooter({super.key, required this.mygame, required this.page});

  @override
  _GameFooterState createState() => _GameFooterState();
}

class _GameFooterState extends State<GameFooter> {
  int? first_team_score;
  int? second_team_score;
  int? first_team_two;
  int? first_team_phone;
  int? first_team_hole;
  int? second_team_two;
  int? second_team_phone;
  int? second_team_hole;

  bool first_team_two_active = false;
  bool first_team_phone_active = false;
  bool first_team_hole_active = false;
  bool second_team_two_active = false;
  bool second_team_phone_active = false;
  bool second_team_hole_active = false;

  @override
  void initState() {
    first_team_score = widget.mygame['first_team_score'] ?? 0;
    second_team_score = widget.mygame['second_team_score'] ?? 0;
    first_team_two = widget.mygame['first_team_two'] ?? 0;
    first_team_phone = widget.mygame['first_team_phone'] ?? 0;
    first_team_hole = widget.mygame['first_team_hole'] ?? 0;
    second_team_two = widget.mygame['second_team_two'] ?? 0;
    second_team_phone = widget.mygame['second_team_phone'] ?? 0;
    second_team_hole = widget.mygame['second_team_hole'] ?? 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool showControls = widget.page == 1;

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
                          widget.mygame['first_team'],
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
                                    setState(() {
                                      first_team_score =
                                          first_team_score! + 100;
                                      print(first_team_score);
                                      print(
                                        first_team_score! -
                                            widget.mygame['first_team_score'],
                                      );
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "${first_team_score}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.015,
                                    fontWeight: FontWeight.bold,
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
                                    setState(() {
                                      first_team_score =
                                          first_team_score! - 100;

                                      print(first_team_score);
                                      print(
                                        first_team_score! -
                                            widget.mygame['first_team_score'],
                                      );
                                    });
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
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
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

                    SizedBox(height: 5),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              shape: const CircleBorder(),
                              child:
                                  first_team_two == 0 && widget.page == 2
                                      ? Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0xFFea8685),
                                            width: 2,
                                          ),
                                          color:
                                              first_team_two_active
                                                  ? Color(0xFFea8685)
                                                  : null,
                                        ),
                                        child: InkWell(
                                          customBorder: const CircleBorder(),
                                          onTap: () {
                                            // action
                                            setState(() {
                                              first_team_two_active =
                                                  !first_team_two_active;
                                              print(first_team_two_active);
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                              width * 0.015,
                                            ), // تحكم في حجم الأيقونة
                                            child: Icon(
                                              Icons.looks_two_outlined,
                                              size: width * 0.028,
                                              color:
                                                  first_team_two_active
                                                      ? Colors.white
                                                      : Color(0xFFea8685),
                                            ),
                                          ),
                                        ),
                                      )
                                      : Container(
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
                                              width * 0.015,
                                            ), // تحكم في حجم الأيقونة
                                            child: Icon(
                                              Icons.looks_two_outlined,
                                              size: width * 0.028,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                            ),
                          ),
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              shape: const CircleBorder(),
                              child:
                                  first_team_phone == 0 && widget.page == 2
                                      ? Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0xFFea8685),
                                            width: 2,
                                          ),
                                          color:
                                              first_team_phone_active
                                                  ? Color(0xFFea8685)
                                                  : null,
                                        ),
                                        child: InkWell(
                                          customBorder: const CircleBorder(),
                                          onTap: () {
                                            // action
                                            setState(() {
                                              first_team_phone_active =
                                                  !first_team_phone_active;
                                              if (first_team_phone_active) {
                                                Get.dialog(
                                                  barrierDismissible: false,
                                                  MediaQuery(
                                                    data: MediaQuery.of(
                                                      context,
                                                    ).copyWith(
                                                      viewInsets:
                                                          EdgeInsets.zero,
                                                    ),
                                                    child: HelperPhoneDialog(
                                                      helperteam:
                                                          'first_team_phone_active',
                                                    ),
                                                  ),
                                                );
                                              }
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                              width * 0.015,
                                            ), // تحكم في حجم الأيقونة
                                            child: Icon(
                                              Icons.phone,
                                              size: width * 0.028,
                                              color:
                                                  first_team_phone_active
                                                      ? Colors.white
                                                      : Color(0xFFea8685),
                                            ),
                                          ),
                                        ),
                                      )
                                      : Container(
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
                                              width * 0.015,
                                            ), // تحكم في حجم الأيقونة
                                            child: Icon(
                                              Icons.phone,
                                              size: width * 0.028,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                            ),
                          ),
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              shape: const CircleBorder(),
                              child:
                                  first_team_hole == 0 && widget.page == 1
                                      ? Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0xFFea8685),
                                            width: 2,
                                          ),
                                          color:
                                              first_team_hole_active
                                                  ? Color(0xFFea8685)
                                                  : null,
                                        ),
                                        child: InkWell(
                                          customBorder: const CircleBorder(),
                                          onTap: () {
                                            // action
                                            setState(() {
                                              first_team_hole_active =
                                                  !first_team_hole_active;
                                              print(first_team_hole_active);
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                              width * 0.015,
                                            ), // تحكم في حجم الأيقونة
                                            child: Icon(
                                              Icons.swap_vert,
                                              size: width * 0.028,
                                              color:
                                                  first_team_hole_active
                                                      ? Colors.white
                                                      : Color(0xFFea8685),
                                            ),
                                          ),
                                        ),
                                      )
                                      : Container(
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
                                              width * 0.015,
                                            ), // تحكم في حجم الأيقونة
                                            child: Icon(
                                              Icons.swap_vert,
                                              size: width * 0.028,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
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
                          widget.mygame['second_team'],
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
                                    setState(() {
                                      second_team_score =
                                          second_team_score! + 100;
                                    });
                                    print(second_team_score);
                                    print(
                                      second_team_score! -
                                          widget.mygame['second_team_score'],
                                    );
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "${second_team_score}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.015,
                                    fontWeight: FontWeight.bold,
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
                                    setState(() {
                                      second_team_score =
                                          second_team_score! - 100;
                                      print(second_team_score);
                                      print(
                                        second_team_score! -
                                            widget.mygame['second_team_score'],
                                      );
                                    });
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
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
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

                    SizedBox(height: 5),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              shape: const CircleBorder(),
                              child:
                                  second_team_two == 0 && widget.page == 2
                                      ? Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0xFFea8685),
                                            width: 2,
                                          ),
                                          color:
                                              second_team_two_active
                                                  ? Color(0xFFea8685)
                                                  : null,
                                        ),
                                        child: InkWell(
                                          customBorder: const CircleBorder(),
                                          onTap: () {
                                            // action
                                            setState(() {
                                              second_team_two_active =
                                                  !second_team_two_active;
                                              print(second_team_two_active);
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                              width * 0.015,
                                            ), // تحكم في حجم الأيقونة
                                            child: Icon(
                                              Icons.looks_two_outlined,
                                              size: width * 0.028,
                                              color:
                                                  second_team_two_active
                                                      ? Colors.white
                                                      : Color(0xFFea8685),
                                            ),
                                          ),
                                        ),
                                      )
                                      : Container(
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
                                              width * 0.015,
                                            ), // تحكم في حجم الأيقونة
                                            child: Icon(
                                              Icons.looks_two_outlined,
                                              size: width * 0.028,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                            ),
                          ),
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              shape: const CircleBorder(),
                              child:
                                  second_team_phone == 0 && widget.page == 2
                                      ? Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0xFFea8685),
                                            width: 2,
                                          ),
                                          color:
                                              second_team_phone_active
                                                  ? Color(0xFFea8685)
                                                  : null,
                                        ),
                                        child: InkWell(
                                          customBorder: const CircleBorder(),
                                          onTap: () {
                                            // action
                                            setState(() {
                                              second_team_phone_active =
                                                  !second_team_phone_active;
                                              if (second_team_phone_active) {
                                                Get.dialog(
                                                  barrierDismissible: false,
                                                  MediaQuery(
                                                    data: MediaQuery.of(
                                                      context,
                                                    ).copyWith(
                                                      viewInsets:
                                                          EdgeInsets.zero,
                                                    ),
                                                    child: HelperPhoneDialog(
                                                      helperteam:
                                                          'second_team_phone_active',
                                                    ),
                                                  ),
                                                );
                                              }
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                              width * 0.015,
                                            ), // تحكم في حجم الأيقونة
                                            child: Icon(
                                              Icons.phone,
                                              size: width * 0.028,
                                              color:
                                                  second_team_phone_active
                                                      ? Colors.white
                                                      : Color(0xFFea8685),
                                            ),
                                          ),
                                        ),
                                      )
                                      : Container(
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
                                              width * 0.015,
                                            ), // تحكم في حجم الأيقونة
                                            child: Icon(
                                              Icons.phone,
                                              size: width * 0.028,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                            ),
                          ),
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              shape: const CircleBorder(),
                              child:
                                  second_team_hole == 0 && widget.page == 1
                                      ? Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0xFFea8685),
                                            width: 2,
                                          ),
                                          color:
                                              second_team_hole_active
                                                  ? Color(0xFFea8685)
                                                  : null,
                                        ),
                                        child: InkWell(
                                          customBorder: const CircleBorder(),
                                          onTap: () {
                                            // action
                                            setState(() {
                                              second_team_hole_active =
                                                  !second_team_hole_active;
                                              print(second_team_hole_active);
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                              width * 0.015,
                                            ), // تحكم في حجم الأيقونة
                                            child: Icon(
                                              Icons.swap_vert,
                                              size: width * 0.028,
                                              color:
                                                  second_team_hole_active
                                                      ? Colors.white
                                                      : Color(0xFFea8685),
                                            ),
                                          ),
                                        ),
                                      )
                                      : Container(
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
                                              width * 0.015,
                                            ), // تحكم في حجم الأيقونة
                                            child: Icon(
                                              Icons.swap_vert,
                                              size: width * 0.028,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
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
