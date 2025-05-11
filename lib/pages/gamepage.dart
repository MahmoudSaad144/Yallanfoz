import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/components/appbar.dart';

class Gamepage extends StatefulWidget {
  const Gamepage({Key? key}) : super(key: key);

  @override
  _GamepageState createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {
  @override
  void initState() {
    super.initState();
    final selected = Get.arguments;
    print(selected);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppbarComponent(
        title: "باقة الألعاب",
        name: "Mahmoud Saad",
        photo: "https://giftdose.dev-swift.com/imgs/users/default-img.png",
      ),
      body: Container(),
    );
  }
}
