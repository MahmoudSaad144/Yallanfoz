import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/components/appbar.dart';
import 'package:yallanfoz/components/game_appbar.dart';

class Gamepage extends StatefulWidget {
  const Gamepage({Key? key}) : super(key: key);

  @override
  _GamepageState createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {
  final Map<String, dynamic> game = {
    'id': 1,
    'name': 'friends',
    'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
    'description': 'يحتوي على أسئلة تتعلق بالمطاعم والأكلات',
    'games': [
      {
        'id': 1,
        'name': 'المطاعم',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'description': 'يحتوي على أسئلة تتعلق بالمطاعم والأكلات',
      },
      {
        'id': 2,
        'name': 'رياضة',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'description': 'يحتوي على أسئلة تتعلق بالرياضة',
      },
      {
        'id': 3,
        'name': 'أفلام',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'description': 'يحتوي على أسئلة تتعلق بالأفلام',
      },
      {
        'id': 4,
        'name': 'فن',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'description': 'يحتوي على أسئلة تتعلق بالفن',
      },
      {
        'id': 5,
        'name': 'اسم اللاعب',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'description': 'يحتوي على أسئلة تتعلق باللاعبين',
      },
      {
        'id': 6,
        'name': 'مهن',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'description': 'يحتوي على أسئلة تتعلق بالمهن',
      },
    ],
  };

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
      appBar: GameappbarComponent(name: 'Friends'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFff9a9e), Color(0xFFfad0c4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150)),
        ),
      ),
    );
  }
}
