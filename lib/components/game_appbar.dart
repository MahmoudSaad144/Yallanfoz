import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/controller/gamepage_controller.dart';

class GameappbarComponent extends GetView<GamePageController>
    implements PreferredSizeWidget {
  final String name;

  const GameappbarComponent({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: preferredSize.height,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFff9a9e), Color.fromARGB(255, 196, 161, 152)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 20, spreadRadius: 10),
          ],
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // الجزء اليسار
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 80,
                  width: 80,
                  fit: BoxFit.fill,
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    controller.last_answer.value =
                        controller.last_answer.value == 1 ? 2 : 1;
                  },
                  child: Container(
                    width: width * 0.18,
                    height: height * 0.07,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Obx(
                          () => Text(
                            "دور فريق : ${controller.last_answer.value == 1 ? controller.mygame['first_team'] : controller.mygame['second_team']}",
                            style: TextStyle(
                              fontSize: width * 0.015,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.change_circle_outlined,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // اسم المستخدم في النص
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                " $name ",
                style: TextStyle(
                  fontSize: width * 0.03,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // الجزء اليمين - التنقل
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async {
                    await controller.UpdateMyGame(finished: true);
                    Get.offNamedUntil(
                      '/mygames',
                      (route) => route.settings.name == '/home',
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        'انهاء اللعبة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.015,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.flag, color: Colors.white),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.offNamedUntil(
                      '/gamepage',
                      (route) => route.settings.name == '/home',
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        ' الرجوع للوحة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.015,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.apps, color: Colors.white),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await controller.UpdateMyGame();
                    Get.offNamedUntil(
                      '/mygames',
                      (route) => route.settings.name == '/home',
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        ' الخروج',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.015,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.logout, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
