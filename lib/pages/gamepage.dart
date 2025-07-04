import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/api/linkserver.dart';
import 'package:yallanfoz/components/game_appbar.dart';
import 'package:yallanfoz/components/game_footer.dart';
import 'package:yallanfoz/controller/gamepage_controller.dart';

class Gamepage extends GetView<GamePageController> {
  const Gamepage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: GameappbarComponent(name: controller.mygame['name']),
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
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Container(
                  child: Obx(() {
                    final List<Map<String, dynamic>> games =
                        List<Map<String, dynamic>>.from(
                          controller.mygame['games'] ?? [],
                        );
                    return GridView.builder(
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
                        final Map<String, List<dynamic>> questions =
                            Map<String, List<dynamic>>.from(
                              games[index]['questions'] ?? {},
                            );
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
                                        onTap:
                                            controller.answeredQuestions
                                                    .contains(
                                                      questions['200']?[0]['id'],
                                                    )
                                                ? null
                                                : () {
                                                  Get.offNamed(
                                                    "/question",
                                                    arguments: {
                                                      'mygame':
                                                          controller.mygame,
                                                      'current_game':
                                                          games[index],
                                                      'question':
                                                          questions['200']?[0],
                                                    },
                                                  );
                                                },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                controller.answeredQuestions
                                                        .contains(
                                                          questions['200']?[0]['id'],
                                                        )
                                                    ? Colors.grey
                                                    : Color(0xFFea8685),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                          alignment: Alignment.center,

                                          child: Text(
                                            "${questions['200']?[0]['points']}",
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
                                        onTap:
                                            controller.answeredQuestions
                                                    .contains(
                                                      questions['400']?[0]['id'],
                                                    )
                                                ? null
                                                : () {
                                                  Get.offNamed(
                                                    "/question",
                                                    arguments: {
                                                      'mygame':
                                                          controller.mygame,
                                                      'current_game':
                                                          games[index],
                                                      'question':
                                                          questions['400']?[0],
                                                    },
                                                  );
                                                },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                controller.answeredQuestions
                                                        .contains(
                                                          questions['400']?[0]['id'],
                                                        )
                                                    ? Colors.grey
                                                    : Color(0xFFea8685),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                          alignment: Alignment.center,

                                          child: Text(
                                            "${questions['400']?[0]['points']}",
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
                                        onTap:
                                            controller.answeredQuestions
                                                    .contains(
                                                      questions['600']?[0]['id'],
                                                    )
                                                ? null
                                                : () {
                                                  Get.offNamed(
                                                    "/question",
                                                    arguments: {
                                                      'mygame':
                                                          controller.mygame,
                                                      'current_game':
                                                          games[index],
                                                      'question':
                                                          questions['600']?[0],
                                                    },
                                                  );
                                                },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                controller.answeredQuestions
                                                        .contains(
                                                          questions['600']?[0]['id'],
                                                        )
                                                    ? Colors.grey
                                                    : Color(0xFFea8685),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                          alignment: Alignment.center,

                                          child: Text(
                                            "${questions['600']?[0]['points']}",
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
                                          '$serverlink/${games[index]['photo']}',
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
                                        onTap:
                                            controller.answeredQuestions
                                                    .contains(
                                                      questions['200']?[1]['id'],
                                                    )
                                                ? null
                                                : () {
                                                  Get.offNamed(
                                                    "/question",
                                                    arguments: {
                                                      'mygame':
                                                          controller.mygame,
                                                      'current_game':
                                                          games[index],
                                                      'question':
                                                          questions['200']?[1],
                                                    },
                                                  );
                                                },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                controller.answeredQuestions
                                                        .contains(
                                                          questions['200']?[1]['id'],
                                                        )
                                                    ? Colors.grey
                                                    : Color(0xFFea8685),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${questions['200']?[1]['points']}",
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
                                        onTap:
                                            controller.answeredQuestions
                                                    .contains(
                                                      questions['400']?[1]['id'],
                                                    )
                                                ? null
                                                : () {
                                                  Get.offNamed(
                                                    "/question",
                                                    arguments: {
                                                      'mygame':
                                                          controller.mygame,
                                                      'current_game':
                                                          games[index],
                                                      'question':
                                                          questions['400']?[1],
                                                    },
                                                  );
                                                },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                controller.answeredQuestions
                                                        .contains(
                                                          questions['400']?[1]['id'],
                                                        )
                                                    ? Colors.grey
                                                    : Color(0xFFea8685),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${questions['400']?[1]['points']}",
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
                                        onTap:
                                            controller.answeredQuestions
                                                    .contains(
                                                      questions['600']?[1]['id'],
                                                    )
                                                ? null
                                                : () {
                                                  Get.offNamed(
                                                    "/question",
                                                    arguments: {
                                                      'mygame':
                                                          controller.mygame,
                                                      'current_game':
                                                          games[index],
                                                      'question':
                                                          questions['600']?[1],
                                                    },
                                                  );
                                                },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                controller.answeredQuestions
                                                        .contains(
                                                          questions['600']?[1]['id'],
                                                        )
                                                    ? Colors.grey
                                                    : Color(0xFFea8685),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${questions['600']?[1]['points']}",
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
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 10),
            GameFooter(page: 1),
          ],
        ),
      ),
    );
  }
}
