import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/api/linkserver.dart';
import 'package:yallanfoz/controller/user_controller.dart';

class AppbarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppbarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 4,
      automaticallyImplyLeading: false,
      toolbarHeight: preferredSize.height,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // المستخدم و Dropdown
          PopupMenuButton<String>(
            position: PopupMenuPosition.under,
            color: Colors.white,
            onSelected: (value) async {
              if (value == 'profile') {
                Get.toNamed("/profile");
              } else if (value == 'mygames') {
                Get.offNamedUntil(
                  '/mygames',
                  (route) => route.settings.name == '/home',
                );
              } else if (value == 'settings') {
                Get.toNamed("/settingpage");
              } else if (value == 'logout') {
                await userController.logout();
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
                      children: [Icon(Icons.games_outlined), Text(' العابي ')],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'settings',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Icon(Icons.settings), Text('الإعدادات')],
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
                Obx(
                  () => CircleAvatar(
                    radius: 18,
                    backgroundImage:
                        NetworkImage(
                              '$serverlink/${userController.userData['photo']}',
                            )
                            as ImageProvider,
                    backgroundColor: Colors.grey[200],
                  ),
                ),

                const SizedBox(width: 8),
                Obx(
                  () => Text(
                    userController.userData['name'] ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFFFECB3),
                    ),
                  ),
                ),

                const Icon(Icons.arrow_drop_down, color: Color(0xFFFFECB3)),
              ],
            ),
          ),

          // زر الشراء
          ElevatedButton.icon(
            onPressed: () {
              Get.toNamed("/packages");
            },
            icon: const Icon(Icons.add, size: 18),
            label: const Text('شراء العاب جديدة'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange[700],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          // التنقل
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Get.offNamedUntil(
                    '/games',
                    (route) => route.settings.name == '/home',
                  ); // ده بيخليني امسح كل الصفحات اللي فوق الهوم بس ويسيبها ويدخل علي الصفحه المطلوبه علشان نشغل زر الرجوع
                },
                child: const Text(
                  'العب',
                  style: TextStyle(color: Color(0xFFFFECB3)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed("/contactus");
                },
                child: const Text(
                  'تواصل معنا',
                  style: TextStyle(color: Color(0xFFFFECB3)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.offNamedUntil(
                    '/mygames',
                    (route) => route.settings.name == '/home',
                  );
                },
                child: const Text(
                  'ألعابي',
                  style: TextStyle(color: Color(0xFFFFECB3)),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  Get.offAllNamed("/home");
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/logo.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
