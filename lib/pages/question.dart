import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/components/game_appbar.dart';
import 'package:yallanfoz/components/game_footer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Questionpage extends StatefulWidget {
  const Questionpage({super.key});

  @override
  _QuestionpageState createState() => _QuestionpageState();
}

class _QuestionpageState extends State<Questionpage> {
  late Map<String, dynamic> mygame;
  late Map<String, dynamic> current_game;
  late Map<String, dynamic> question;
  late YoutubePlayerController _controller; // علشان لو عندي فيديو يوتيوب

  Timer? _timer; // هانحتفظ بالـ Timer عشان نقدر نلغيّه أو نستأنفه
  int _seconds = 0; // عدد الثواني المجمّع
  bool _isRunning = false;

  String get _timeString {
    final minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _startAndResetTimer() {
    // إذا في تايمر شغال، نوقّفه
    _timer?.cancel();
    setState(() {
      _seconds = 0;
      _isRunning = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _pauseTimer() {
    if (_isRunning) {
      _timer?.cancel();
      setState(() {
        _isRunning = false;
      });
    }
  }

  void _resumeTimer() {
    if (!_isRunning) {
      setState(() {
        _isRunning = true;
      });
      _timer = Timer.periodic(Duration(seconds: 1), (_) {
        setState(() {
          _seconds++;
        });
      });
    }
  }

  @override
  void initState() {
    mygame = Get.arguments['mygame'];
    current_game = Get.arguments['current_game'];
    question = Get.arguments['question'];
    _startAndResetTimer();

    if (question['question_video'] != null) {
      final videoId = YoutubePlayer.convertUrlToId(question['question_video']);
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
    _timer?.cancel(); // مهم نلغي التايمر لو طلّعنا من الصفحة
    if (question['question_video'] != null) {
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
                                      Container(
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
                                      SizedBox(height: 10),
                                      Container(
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
                                      SizedBox(height: 10),

                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        padding: EdgeInsets.all(8),
                                        minWidth: width * 0.2,
                                        color: Colors.green,
                                        onPressed: () {
                                          Get.offNamed(
                                            "/answer",
                                            arguments: {
                                              'mygame': mygame,
                                              'current_game': current_game,
                                              'question': question,
                                            },
                                          );
                                        },
                                        child: Text(
                                          " الإجابة ",
                                          style: TextStyle(
                                            fontSize: width * 0.025,
                                            color: Colors.white,
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
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          width: width,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.deepOrange,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  _startAndResetTimer();
                                                },
                                                color: Colors.white,
                                                icon: Icon(
                                                  Icons.restart_alt_outlined,
                                                ),
                                              ),
                                              Text(
                                                "$_timeString",
                                                style: TextStyle(
                                                  fontSize: width * 0.025,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  _isRunning
                                                      ? _pauseTimer()
                                                      : _resumeTimer();
                                                },
                                                color: Colors.white,
                                                icon: Icon(
                                                  _isRunning
                                                      ? Icons
                                                          .pause_circle_outline
                                                      : Icons.play_arrow,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          "${question['question']} ",
                                          style: TextStyle(
                                            fontSize: width * 0.02,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
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
                      SizedBox(width: 10),
                      if (question['question_photo'] != null)
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
                                        "${question['question_photo']}",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (question['question_video'] != null)
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
            GameFooter(mygame: mygame, page: 2),
          ],
        ),
      ),
    );
  }
}
