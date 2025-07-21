import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yallanfoz/api/curd.dart';
import 'package:yallanfoz/api/linkserver.dart';
import 'package:yallanfoz/controller/gamepage_controller.dart';

class MyGamesController extends GetxController {
  final RxList<Map<String, dynamic>> mygames = <Map<String, dynamic>>[].obs;
  final load = 10.obs;
  final search = TextEditingController();
  final loading = false.obs;
  final scrollController = ScrollController();
  final isFetchingMore = false.obs;
  final RxInt currentPage = 1.obs;
  final RxInt lastPage = 1.obs;
  final RxInt myGameId = 0.obs;
  final startGame = GlobalKey<FormState>();
  final teamname = TextEditingController();
  final firstTeam = TextEditingController();
  final secondTeam = TextEditingController();
  final gamepagecontroller = Get.find<GamePageController>();
  @override
  Future<void> onInit() async {
    scrollController.addListener(scrollListener);
    await GetMyGames();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(scrollListener); // تنظيف
    scrollController.dispose(); // مهم جدًا
    teamname.dispose();
    firstTeam.dispose();
    secondTeam.dispose();
    super.onClose();
  }

  Future<void> GetMyGames({bool isInitial = false}) async {
    if (isInitial) {
      currentPage.value = 1;
      mygames.clear();
    }
    if (!isFetchingMore.value) {
      loading.value = true;
    }
    final token = GetStorage().read('token');
    final response = await ApiService.getRequest(
      "$serverlink/api/mygames?search=${search.text}&load=$load&page=${currentPage.value}",
      token,
    );
    if (response != null) {
      final data = List<Map<String, dynamic>>.from(response['data']['data']);
      if (isInitial) {
        mygames.value = data;
      } else {
        mygames.addAll(data);
      }
      lastPage.value = response['data']['last_page'];
      loading.value = false;
    }
  }

  Future<void> ContinueGame(selected) async {
    loading.value = true;
    final token = GetStorage().read('token');
    final response = await ApiService.getRequest(
      "$serverlink/api/mygames/$selected",
      token,
    );
    if (response != null) {
      gamepagecontroller.resetGame();
      gamepagecontroller.LoadGameData(response['data']);
      Get.offNamedUntil('/gamepage', (route) => route.settings.name == '/home');
    }
    loading.value = false;
  }

  Future<void> StartGame() async {
    if (startGame.currentState!.validate()) {
      loading.value = true;
      final token = GetStorage().read('token');
      final Map<String, dynamic> body = {
        "id": myGameId.value,
        "first_team": firstTeam.text,
        "second_team": secondTeam.text,
      };

      final response = await ApiService.postRequest(
        "$serverlink/api/restgame",
        token,
        body,
      );

      if (response != null) {
        gamepagecontroller.resetGame();
        gamepagecontroller.LoadGameData(response['data']);
        Get.offNamedUntil(
          '/gamepage',
          (route) => route.settings.name == '/home',
        );
      }

      loading.value = false;
    }
  }

  void scrollListener() async {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent) {
      if (!loading.value && !isFetchingMore.value) {
        if (lastPage.value > currentPage.value) {
          isFetchingMore.value = true;
          currentPage.value += 1;
          await GetMyGames();
          isFetchingMore.value = false;
        }
      }
    }
  }
}
