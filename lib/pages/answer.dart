import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/components/game_appbar.dart';
import 'package:yallanfoz/components/game_footer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Answerpage extends StatefulWidget {
  const Answerpage({super.key});

  @override
  _AnswerpageState createState() => _AnswerpageState();
}

class _AnswerpageState extends State<Answerpage> {
  late Map<String, dynamic> mygame;
  late Map<String, dynamic> current_game;
  late Map<String, dynamic> question;
  late YoutubePlayerController _controller; // علشان لو عندي فيديو يوتيوب

  @override
  void initState() {
    mygame = Get.arguments['mygame'];
    current_game = Get.arguments['current_game'];
    question = Get.arguments['question'];

    if (question['answer_video'] != null) {
      final videoId = YoutubePlayer.convertUrlToId(question['answer_video']);
      // بتنشئ الكونترولر بالـID المستخرج
      _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(autoPlay: false),
      );
    }

    print(mygame);
    print(current_game);
    print(question);
    super.initState();
  }

  @override
  void dispose() {
    if (question['answer_video'] != null) {
      _controller.pause();
      _controller.dispose();
    }
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
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            "${question['points']} نقطة",
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
                                            "${current_game['name']}",
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
                                          color: Colors.blueAccent,
                                          onPressed: () {
                                            Get.offNamed(
                                              "/whoanswer",
                                              arguments: {
                                                'mygame': mygame,
                                                'current_game': current_game,
                                                'question': question,
                                              },
                                            );
                                          },
                                          child: Text(
                                            " من جاوب ؟ ",
                                            style: TextStyle(
                                              fontSize: width * 0.025,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(height: 5),

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
                                              "/question",
                                              arguments: {
                                                'mygame': mygame,
                                                'current_game': current_game,
                                                'question': question,
                                              },
                                            );
                                          },
                                          child: Text(
                                            " ارجع للسؤال ",
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
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${question['answer_answer']} ",
                                        style: TextStyle(
                                          fontSize: width * 0.028,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      if (question['answer_photo'] != null)
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: width,
                                    height: height,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      child: Image.network(
                                        "${question['answer_photo']}",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (question['answer_video'] != null)
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: width,
                                    height: height,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      child: YoutubePlayer(
                                        controller: _controller,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            GameFooter(mygame: mygame, page: 3),
          ],
        ),
      ),
    );
  }
}
