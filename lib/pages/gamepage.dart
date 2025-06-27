import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/components/game_appbar.dart';
import 'package:yallanfoz/components/game_footer.dart';

class Gamepage extends StatefulWidget {
  const Gamepage({super.key});

  @override
  _GamepageState createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {
  final Map<String, dynamic> mygame = {
    'id': 1,
    'name': 'Friends',
    'first_team': 'red',
    'second_team': 'green',
    'last_answer': 'green',
    'first_team_score': 0,
    'second_team_score': 0,
    'first_team_two': 0,
    'first_team_phone': 0,
    'first_team_hole': 0,
    'second_team_two': 0,
    'second_team_phone': 0,
    'second_team_hole': 0,
    'answered_questions': [1, 6, 15, 13],

    'games': [
      {
        'id': 1,
        'name': 'المطاعم',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'questions': [
          {
            '200': [
              {
                'id': 1,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 200,
              },
              {
                'id': 2,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 200,
              },
            ],
          },
          {
            '400': [
              {
                'id': 3,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 400,
              },
              {
                'id': 4,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 400,
              },
            ],
          },
          {
            '600': [
              {
                'id': 5,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 600,
              },
              {
                'id': 6,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 600,
              },
            ],
          },
        ],
      },
      {
        'id': 2,
        'name': 'رياضة',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'questions': [
          {
            '200': [
              {
                'id': 1,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 200,
              },
              {
                'id': 2,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 200,
              },
            ],
          },
          {
            '400': [
              {
                'id': 3,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 400,
              },
              {
                'id': 4,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 400,
              },
            ],
          },
          {
            '600': [
              {
                'id': 5,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 600,
              },
              {
                'id': 6,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 600,
              },
            ],
          },
        ],
      },
      {
        'id': 3,
        'name': 'افلام',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'questions': [
          {
            '200': [
              {
                'id': 1,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 200,
              },
              {
                'id': 2,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 200,
              },
            ],
          },
          {
            '400': [
              {
                'id': 3,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 400,
              },
              {
                'id': 4,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 400,
              },
            ],
          },
          {
            '600': [
              {
                'id': 5,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 600,
              },
              {
                'id': 6,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 600,
              },
            ],
          },
        ],
      },
      {
        'id': 4,
        'name': 'فن',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'questions': [
          {
            '200': [
              {
                'id': 1,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 200,
              },
              {
                'id': 2,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 200,
              },
            ],
          },
          {
            '400': [
              {
                'id': 3,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 400,
              },
              {
                'id': 4,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 400,
              },
            ],
          },
          {
            '600': [
              {
                'id': 5,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 600,
              },
              {
                'id': 6,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 600,
              },
            ],
          },
        ],
      },
      {
        'id': 5,
        'name': 'اسم اللاعب',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'questions': [
          {
            '200': [
              {
                'id': 1,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 200,
              },
              {
                'id': 2,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 200,
              },
            ],
          },
          {
            '400': [
              {
                'id': 3,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 400,
              },
              {
                'id': 4,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 400,
              },
            ],
          },
          {
            '600': [
              {
                'id': 5,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 600,
              },
              {
                'id': 6,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 600,
              },
            ],
          },
        ],
      },
      {
        'id': 6,
        'name': 'مهن',
        'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
        'questions': [
          {
            '200': [
              {
                'id': 1,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 200,
              },
              {
                'id': 2,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 200,
              },
            ],
          },
          {
            '400': [
              {
                'id': 3,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 400,
              },
              {
                'id': 4,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 400,
              },
            ],
          },
          {
            '600': [
              {
                'id': 5,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 600,
              },
              {
                'id': 6,
                'question':
                    'ما اسم اللاعب الذي كان يرتدي رقم 22 في الأهلي المصري ',
                'question_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'question_video': null,
                'answer': ' ابو تريكه ',
                'answer_photo':
                    'https://giftdose.dev-swift.com/imgs/users/default-img.png',
                'answer_video': null,
                'points': 600,
              },
            ],
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
    games = mygame['games'];
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
      appBar: GameappbarComponent(name: mygame['name']),
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
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: width * 0.4,
                      crossAxisSpacing: width * 0.01,
                      mainAxisSpacing: height * 0.02,
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
                                    child: InkWell(
                                      onTap: () {
                                        Get.offNamed(
                                          "/question",
                                          arguments: {
                                            'mygame': mygame,
                                            'current_game': games[index],
                                            'question': questions[0]['200'][0],
                                          },
                                        );
                                        print(questions[0]['200'][0]);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFea8685),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        alignment: Alignment.center,

                                        child: Text(
                                          "${questions[0]['200'][0]['points']}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.02,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: InkWell(
                                      onTap: () {
                                        Get.offNamed(
                                          "/question",
                                          arguments: {
                                            'mygame': mygame,
                                            'current_game': games[index],
                                            'question': questions[1]['400'][0],
                                          },
                                        );
                                        print(questions[1]['400'][0]);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFea8685),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        alignment: Alignment.center,

                                        child: Text(
                                          "${questions[1]['400'][0]['points']}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.02,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: InkWell(
                                      onTap: () {
                                        Get.offNamed(
                                          "/question",
                                          arguments: {
                                            'mygame': mygame,
                                            'current_game': games[index],
                                            'question': questions[2]['600'][0],
                                          },
                                        );
                                        print(questions[2]['600'][0]);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFea8685),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        alignment: Alignment.center,

                                        child: Text(
                                          "${questions[2]['600'][0]['points']}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.02,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                                        color: Color.fromARGB(
                                          184,
                                          195,
                                          109,
                                          111,
                                        ),
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
                                    child: InkWell(
                                      onTap: () {
                                        Get.offNamed(
                                          "/question",
                                          arguments: {
                                            'mygame': mygame,
                                            'current_game': games[index],
                                            'question': questions[0]['200'][1],
                                          },
                                        );
                                        print(questions[0]['200'][1]);
                                      },
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
                                          "${questions[0]['200'][1]['points']}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.02,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: InkWell(
                                      onTap: () {
                                        Get.offNamed(
                                          "/question",
                                          arguments: {
                                            'mygame': mygame,
                                            'current_game': games[index],
                                            'question': questions[1]['400'][1],
                                          },
                                        );
                                        print(questions[1]['400'][1]);
                                      },
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
                                          "${questions[1]['400'][1]['points']}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.02,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: InkWell(
                                      onTap: () {
                                        Get.offNamed(
                                          "/question",
                                          arguments: {
                                            'mygame': mygame,
                                            'current_game': games[index],
                                            'question': questions[2]['600'][1],
                                          },
                                        );
                                        print(questions[2]['600'][1]);
                                      },
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
                                          "${questions[2]['600'][1]['points']}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.02,
                                            fontWeight: FontWeight.bold,
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
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            GameFooter(mygame: mygame, page: 1),
          ],
        ),
      ),
    );
  }
}
