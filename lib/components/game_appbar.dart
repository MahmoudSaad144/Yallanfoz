import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameappbarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final String name;
  const GameappbarComponent({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 12),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/logo.png', height: 25),
                      Text(
                        ' يلا نفوز ',
                        style: TextStyle(
                          fontFamily: "Cario",
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      print("asd");
                    },
                    child: Container(
                      width: width * 0.18,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "دور فريق : red",
                            style: TextStyle(
                              fontSize: width * 0.015,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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

            // أزرار التنقل على اليمين
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Get.offNamed("/games");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'انهاء اللعبة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.015,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.flag, color: Colors.white),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offNamed("/gamepage");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          ' الرجوع للوحة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.015,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.apps, color: Colors.white),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offNamed("/mygames");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          ' الخروج',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.015,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.logout, color: Colors.white),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
