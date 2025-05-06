import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String name;
  final dynamic photo;
  const AppbarComponent({
    super.key,
    required this.title,
    required this.name,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // جزء المستخدم مع Dropdown
            PopupMenuButton<String>(
              position: PopupMenuPosition.under,
              color: Colors.white,
              menuPadding: EdgeInsets.all(15),
              onSelected: (value) {
                if (value == 'profile') {
                  Get.toNamed("/profile");
                } else if (value == 'mygames') {
                  Get.toNamed("/mygames");
                } else if (value == 'settings') {
                  Get.toNamed("/settings");
                } else if (value == 'logout') {
                  Get.offAllNamed("/login");
                }
              },
              itemBuilder:
                  (context) => [
                    const PopupMenuItem(
                      value: 'profile',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Icon(Icons.person), Text(' حسابي ')],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'mygames',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.games_outlined),
                          Text(' العابي '),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'settings',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Icon(Icons.settings), Text('الاعدادات')],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'logout',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Icon(Icons.exit_to_app), Text('خروج')],
                      ),
                    ),
                  ],
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage:
                        photo is File
                            ? FileImage(photo as File)
                            : NetworkImage(photo),
                    backgroundColor: Colors.grey[200],
                  ),
                  const SizedBox(width: 8),
                  Text(
                    name,
                    style: const TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.black54),
                ],
              ),
            ),

            // الأزرار الملونة في النص
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Get.toNamed("/package");
                  },
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('شراء العاب جديدة'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),

            // أزرار التنقل على اليمين
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.toNamed("/games");
                  },
                  child: const Text('العب'),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed("/mygames");
                  },
                  child: const Text('تواصل معنا'),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed("/contactus");
                  },
                  child: const Text('ألعابي'),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    Get.offAllNamed("/home");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/logo.png', height: 25),
                      Text(
                        ' يلا نفوز ',
                        style: TextStyle(
                          fontFamily: "Cario",
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
