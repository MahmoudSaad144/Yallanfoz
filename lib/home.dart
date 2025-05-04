import 'package:flutter/material.dart';
import 'package:yallanfoz/components/appbar.dart';
import 'package:yallanfoz/components/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => __Home();
}

class __Home extends State<Home> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? name = "Mahmoud Saad";
    String? photo = "https://giftdose.dev-swift.com/imgs/users/default-img.png";
    String? email = "MahmoudSaad@gmail.com";
    return Scaffold(
      appBar: AppbarComponent(title: "Home"),
      drawer: DrawerComponent(name: name, photo: photo, email: email),
      body: ListView(children: [

        ],
      ),
    );
  }
}
