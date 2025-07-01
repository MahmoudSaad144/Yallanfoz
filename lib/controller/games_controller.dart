import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yallanfoz/api/curd.dart';
import 'package:yallanfoz/api/linkserver.dart';
import 'package:yallanfoz/controller/gamepage_controller.dart';
import 'package:yallanfoz/controller/user_controller.dart';

class GamesController extends GetxController {
  final RxList<Map<String, dynamic>> games = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> countrys = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> selected = <Map<String, dynamic>>[].obs;
  final load = 10.obs;
  Rxn<int> isSelectedIndex = Rxn<int>();
  final search = TextEditingController();
  final country = ''.obs;
  final userController = Get.find<UserController>();
  final loading = false.obs;
  final scrollController = ScrollController();
  final isFetchingMore = false.obs;
  final RxInt currentPage = 1.obs;
  final RxInt lastPage = 1.obs;

  final startGame = GlobalKey<FormState>();
  final teamname = TextEditingController();
  final firstTeam = TextEditingController();
  final secondTeam = TextEditingController();
  final gamepagecontroller = Get.find<GamePageController>();
  @override
  Future<void> onInit() async {
    scrollController.addListener(scrollListener);
    await GetGamesCountry();
    await GetGames();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> GetGames({bool isInitial = false}) async {
    if (isInitial) {
      currentPage.value = 1;
      games.clear();
    }
    if (!isFetchingMore.value) {
      loading.value = true;
    }
    final token = GetStorage().read('token');
    final response = await ApiService.getRequest(
      "$serverlink/api/games?country_id=$country&search=${search.text}&load=$load&page=${currentPage.value}",
      token,
    );
    if (response != null) {
      final data = List<Map<String, dynamic>>.from(response['data']['data']);
      if (isInitial) {
        games.value = data;
      } else {
        games.addAll(data);
      }
      lastPage.value = response['data']['last_page'];
      print('$load ========= $games');
      loading.value = false;
    }
  }

  Future<void> GetGamesCountry() async {
    loading.value = true;
    final token = GetStorage().read('token');
    final response = await ApiService.getRequest(
      "$serverlink/api/gamescountry",
      token,
    );
    if (response != null) {
      countrys.value = List<Map<String, dynamic>>.from(response['data']);
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
          await GetGames();
          isFetchingMore.value = false;
        }
      }
    }
  }

  Future<void> StartGame() async {
    List<String> ids = selected.map((item) => item["id"].toString()).toList();

    if (startGame.currentState!.validate()) {
      loading.value = true;
      final token = GetStorage().read('token');
      final Map<String, dynamic> body = {
        "name": teamname.text,
        "first_team": firstTeam.text,
        "second_team": secondTeam.text,
        "games": ids,
      };

      final response = await ApiService.postRequest(
        "$serverlink/api/mygames",
        token,
        body,
      );

      if (response != null) {
        gamepagecontroller.mygame.value = response['data'];
        userController.userData.value = response['user'];
        Get.offNamedUntil(
          '/gamepage',
          (route) => route.settings.name == '/home',
        );
      }

      loading.value = false;
    }
  }
}
