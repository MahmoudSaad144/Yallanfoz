import 'package:flutter/material.dart';

class AppbarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppbarComponent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //iconTheme علشان لو عايز اغير ايقون ال drawer للون اللي عايزه بسهولة
      iconTheme: IconThemeData(color: Colors.white),
      //centerTitle علشان اخليه في النص
      // leading: IconButton(
      //   onPressed: () {},
      //   icon: Icon(Icons.menu),
      //   color: Colors.white,
      // ),
      centerTitle: true,
      shadowColor: const Color.fromARGB(66, 98, 96, 96),
      //elevation نسبه انتشار الشادو
      elevation: 20.0,
      title: Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
      backgroundColor: Color.fromARGB(255, 0, 183, 255),
      // actions لو انا عايز احط مجموعه من الزراير تقوم بعمل شي ما في
      actions: [
        // IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        // IconButton(onPressed: () {}, icon: Icon(Icons.percent)),
        // IconButton(onPressed: () {}, icon: Icon(Icons.list)),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); //ده اللي بيحدد للـ Flutter إن الارتفاع الطبيعي للـ AppBar هو ارتفاع الـ toolbar العادي (kToolbarHeight = 56.0).
}
