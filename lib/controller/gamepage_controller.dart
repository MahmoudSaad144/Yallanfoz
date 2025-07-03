import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yallanfoz/api/curd.dart';
import 'package:yallanfoz/api/linkserver.dart';

class GamePageController extends GetxController {
  final RxMap<String, dynamic> mygame = <String, dynamic>{}.obs;
  final loading = false.obs;
  final first_team_score = 0.obs;
  final second_team_score = 0.obs;
  final count = 1.obs;
  final last_answer = 1.obs;
  final RxList<int> answeredQuestions = <int>[].obs;
  final first_team_two_active = 1.obs;
  final first_team_phone_active = 1.obs;
  final first_team_hole_active = 1.obs;
  final second_team_two_active = 1.obs;
  final second_team_phone_active = 1.obs;
  final second_team_hole_active = 1.obs;
  final RxMap<String, dynamic> question = <String, dynamic>{}.obs;
  final RxMap<String, dynamic> current_game = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void LoadGameData(data) {
    mygame.value = data;
    first_team_score.value = mygame['first_team_score'] ?? 0;
    second_team_score.value = mygame['second_team_score'] ?? 0;
    last_answer.value = mygame['last_answer'] == 1 ? 2 : 1;
    count.value = mygame['count'] ?? 1;
    answeredQuestions.value = List<int>.from(mygame['answered_questions']);
    first_team_two_active.value = (mygame['first_team_two'] == 1 ? 1 : 0);
    first_team_phone_active.value = (mygame['first_team_phone'] == 1 ? 1 : 0);
    first_team_hole_active.value = (mygame['first_team_hole'] == 1 ? 1 : 0);
    second_team_two_active.value = (mygame['second_team_two'] == 1 ? 1 : 0);
    second_team_phone_active.value = (mygame['second_team_phone'] == 1 ? 1 : 0);
    second_team_hole_active.value = (mygame['second_team_hole'] == 1 ? 1 : 0);
    question.value = {};
    current_game.value = {};
    print(mygame);
  }

  Future<void> UpdateMyGame({bool finished = false, int? answer}) async {
    loading.value = true;
    final token = GetStorage().read('token');
    final Map<String, dynamic> body = {
      "id": mygame['id'],
      "first_team_score": first_team_score.value,
      "second_team_score": second_team_score.value,
      "last_answer": last_answer.value,
      "first_team_two": first_team_two_active.value,
      "first_team_phone": first_team_phone_active.value,
      "first_team_hole": first_team_hole_active.value,
      "second_team_two": second_team_two_active.value,
      "second_team_phone": second_team_phone_active.value,
      "second_team_hole": second_team_hole_active.value,
    };

    if (finished) {
      body.addAll({"count": count.value + 1});
    }

    if (question.isNotEmpty && answer != null) {
      body.addAll({"questions_id": question['id']});
    }

    final response = await ApiService.postRequest(
      "$serverlink/api/updatemygame",
      token,
      body,
    );
    if (response != null) {
      LoadGameData(response['data']);
    }
  }

  void resetGame() {
    mygame.value = {};
    loading.value = false;
    first_team_score.value = 0;
    second_team_score.value = 0;
    count.value = 1;
    last_answer.value = 1;
    answeredQuestions.clear();
    first_team_two_active.value = 0;
    first_team_phone_active.value = 0;
    first_team_hole_active.value = 0;
    second_team_two_active.value = 0;
    second_team_phone_active.value = 0;
    second_team_hole_active.value = 0;
    question.value = {};
    current_game.value = {};
  }

  Future<void> WhoAnswer({required int answer}) async {
    if (answer != 3) {
      last_answer.value = answer;
      if (answer == 1) {
        first_team_score.value += (question['points'] as int);
        if (mygame['first_team_hole'] == 0 &&
            first_team_hole_active.value == 1) {
          second_team_score.value =
              second_team_score.value - (question['points'] as int);
        }
      } else {
        second_team_score.value += (question['points'] as int);
        if (mygame['second_team_hole'] == 0 &&
            second_team_hole_active.value == 1) {
          first_team_score.value =
              first_team_score.value - (question['points'] as int);
        }
      }
    }
    await UpdateMyGame(answer: answer);
    Get.offNamedUntil('/gamepage', (route) => route.settings.name == '/home');
  }
}
