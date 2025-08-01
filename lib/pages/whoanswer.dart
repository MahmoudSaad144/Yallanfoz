import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/components/game_appbar.dart';
import 'package:yallanfoz/components/game_footer.dart';
import 'package:yallanfoz/controller/gamepage_controller.dart';

class WhoAnswerpage extends GetView<GamePageController> {
  const WhoAnswerpage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    width: width * 0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${controller.question['points']} نقطة",
                                      style: TextStyle(
                                        fontSize: width * 0.025,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    width: width * 0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${controller.current_game['name']}",
                                      style: TextStyle(
                                        fontSize: width * 0.025,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),

                                Expanded(
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(8),
                                    minWidth: width * 0.2,
                                    color: Colors.grey,
                                    onPressed: () {
                                      Get.offNamed(
                                        "/answer",
                                        arguments: {
                                          'mygame': controller.mygame,
                                          'current_game':
                                              controller.current_game,
                                          'question': controller.question,
                                        },
                                      );
                                    },
                                    child: Text(
                                      " العودة للإجابة ",
                                      style: TextStyle(
                                        fontSize: width * 0.025,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.06,
                            ),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    " من جاوب صح ؟ ",
                                    style: TextStyle(
                                      fontSize: width * 0.028,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () async {
                                            await controller.WhoAnswer(
                                              answer: 1,
                                            );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            width: width * 0.2,
                                            decoration: BoxDecoration(
                                              color: Colors.deepOrange,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${controller.mygame['first_team']}",
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () async {
                                            await controller.WhoAnswer(
                                              answer: 2,
                                            );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            width: width * 0.2,
                                            decoration: BoxDecoration(
                                              color: Colors.deepOrange,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${controller.mygame['second_team']}",
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await controller.WhoAnswer(answer: 3);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      width: width * 0.3,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        " ولا وأحد ",
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: Colors.white,
                                        ),
                                      ),
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
                ),
              ),
            ),
            SizedBox(height: 10),
            GameFooter(page: 3),
          ],
        ),
      ),
    );
  }
}
