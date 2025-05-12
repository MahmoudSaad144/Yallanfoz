import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/components/game_appbar.dart';

class Gamepage extends StatefulWidget {
  const Gamepage({Key? key}) : super(key: key);

  @override
  _GamepageState createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {
  final Map<String, dynamic> mygames = {
    'id': 1,
    'name': 'Friends',
    'first_team': 'red',
    'second_team': 'green',
    'last_answer': 'green',
    'first_team_score': 0,
    'second_team_score': 0,

    'games': [
      {
        'id': 1,
        'name': 'المطاعم',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'questions': [
          {
            'id': 1,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 200,
          },
          {
            'id': 2,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 200,
          },
          {
            'id': 3,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 400,
          },
          {
            'id': 4,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 400,
          },
          {
            'id': 5,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 600,
          },
          {
            'id': 6,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 600,
          },
        ],
      },
      {
        'id': 2,
        'name': 'رياضة',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'questions': [
          {
            'id': 1,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 200,
          },
          {
            'id': 2,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 200,
          },
          {
            'id': 3,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 400,
          },
          {
            'id': 4,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 400,
          },
          {
            'id': 5,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 600,
          },
          {
            'id': 6,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 600,
          },
        ],
      },
      {
        'id': 3,
        'name': 'أفلام',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'questions': [
          {
            'id': 1,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 200,
          },
          {
            'id': 2,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 200,
          },
          {
            'id': 3,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 400,
          },
          {
            'id': 4,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 400,
          },
          {
            'id': 5,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 600,
          },
          {
            'id': 6,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 600,
          },
        ],
      },
      {
        'id': 4,
        'name': 'فن',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'questions': [
          {
            'id': 1,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 200,
          },
          {
            'id': 2,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 200,
          },
          {
            'id': 3,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 400,
          },
          {
            'id': 4,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 400,
          },
          {
            'id': 5,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 600,
          },
          {
            'id': 6,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 600,
          },
        ],
      },
      {
        'id': 5,
        'name': 'اسم اللاعب',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'questions': [
          {
            'id': 1,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 200,
          },
          {
            'id': 2,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 200,
          },
          {
            'id': 3,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 400,
          },
          {
            'id': 4,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 400,
          },
          {
            'id': 5,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 600,
          },
          {
            'id': 6,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 600,
          },
        ],
      },
      {
        'id': 6,
        'name': 'مهن',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'questions': [
          {
            'id': 1,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 200,
          },
          {
            'id': 2,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 200,
          },
          {
            'id': 3,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 400,
          },
          {
            'id': 4,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 400,
          },
          {
            'id': 5,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 600,
          },
          {
            'id': 6,
            'question': 'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
            'answer': ' ابو تريكه ',
            'points': 600,
          },
        ],
      },
    ],
  };
  List<Map<String, dynamic>> games = [];
  List<Map<String, dynamic>> questions = [];

  @override
  void initState() {
    super.initState();
    final selected = Get.arguments;
    games = mygames['games'];
    // print("$selected $games");
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
      appBar: GameappbarComponent(name: mygames['name']),
      body: Container(
        width: width,
        padding: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFff9a9e), Color(0xFFfad0c4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: width * 0.4,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 5,
                    mainAxisExtent: height * 0.25,
                  ),
                  itemCount: games.length,
                  itemBuilder: (ctx, index) {
                    final List<Map<String, dynamic>> questions =
                        games[index]['questions'];
                    print(questions);
                    return Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFea8685),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    alignment: Alignment.center,

                                    child: Text(
                                      "200",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFea8685),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    alignment: Alignment.center,

                                    child: Text(
                                      "400",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFea8685),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    alignment: Alignment.center,

                                    child: Text(
                                      "600",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    child: Image.network(
                                      games[index]['photo'],
                                      fit: BoxFit.cover,
                                      width: width * 0.15,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(184, 195, 109, 111),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      games[index]['name'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.012,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFea8685),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "200",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFea8685),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "400",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFea8685),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "600",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
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
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      spreadRadius: 10,
                    ),
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
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xFFea8685),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                mygames['first_team'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.015,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            SizedBox(height: 5),

                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: IconButton(
                                      iconSize: width * 0.02,
                                      color: Colors.white,
                                      onPressed: () {},
                                      icon: Icon(Icons.add),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        "${mygames['first_team_score']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.015,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      iconSize: width * 0.02,
                                      color: Colors.white,
                                      onPressed: () {},
                                      icon: Icon(Icons.remove),
                                    ),
                                  ),
                                ],
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
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "وسائل المساعدة",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: width * 0.015,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            SizedBox(height: 5),

                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        iconSize: width * 0.03,
                                        color: Colors.grey,
                                        onPressed: () {},
                                        icon: Icon(Icons.looks_two_outlined),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        iconSize: width * 0.03,
                                        color: Colors.grey,
                                        onPressed: () {},
                                        icon: Icon(Icons.phone),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        iconSize: width * 0.02,
                                        color: Colors.grey,
                                        onPressed: () {},
                                        icon: Icon(Icons.swap_vert),
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
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xFFea8685),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                mygames['second_team'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.015,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            SizedBox(height: 5),

                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: IconButton(
                                      iconSize: width * 0.02,
                                      color: Colors.white,
                                      onPressed: () {},
                                      icon: Icon(Icons.add),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        "${mygames['second_team_score']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.015,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      iconSize: width * 0.02,
                                      color: Colors.white,
                                      onPressed: () {},
                                      icon: Icon(Icons.remove),
                                    ),
                                  ),
                                ],
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
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "وسائل المساعدة",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: width * 0.015,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            SizedBox(height: 5),

                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        iconSize: width * 0.03,
                                        color: Colors.grey,
                                        onPressed: () {},
                                        icon: Icon(Icons.looks_two_outlined),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        iconSize: width * 0.03,
                                        color: Colors.grey,
                                        onPressed: () {},
                                        icon: Icon(Icons.phone),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        iconSize: width * 0.02,
                                        color: Colors.grey,
                                        onPressed: () {},
                                        icon: Icon(Icons.swap_vert),
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
            ),
          ],
        ),
      ),
    );
  }
}
