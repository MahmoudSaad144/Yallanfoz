import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/api/linkserver.dart';
import 'package:yallanfoz/components/appbar.dart';
import 'package:yallanfoz/components/showcustomdialog.dart';
import 'package:yallanfoz/controller/mygames_controller.dart';

class Mygames extends GetView<MyGamesController> {
  const Mygames({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Timer? _debounce;
    return Scaffold(
      appBar: AppbarComponent(),
      body: SafeArea(
        child: Stack(
          children: [
            // 1) المحتوى القابل للتمرير
            Positioned.fill(
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),

                  width: double.infinity,
                  child: Column(
                    children: [
                      // الهيدر بعرض الشاشة كاملة
                      Container(
                        width: width,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(150),
                            bottomRight: Radius.circular(150),
                          ),
                          color: Colors.black,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "اختار من العابك",
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: Color(0xFFFFECB3),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              " لعبة جماعية تفاعلية نختبر فيها معرفتكم و ثقافتكم ",
                              style: TextStyle(
                                fontSize: width * 0.025,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: width * .8,
                              child: Text(
                                " لإنشاء لعبة جديدة اضغط على (انشاء لعبة جديدة )",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: width * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 5),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          child: Wrap(
                            spacing: 80,
                            runSpacing: 8,
                            children: [
                              Container(
                                width: width * 0.34,
                                child: TextFormField(
                                  controller: controller.search,
                                  onChanged: (value) {
                                    if (_debounce?.isActive ?? false)
                                      _debounce!.cancel();

                                    _debounce = Timer(
                                      const Duration(milliseconds: 800),
                                      () async {
                                        await controller.GetMyGames(
                                          isInitial: true,
                                        );
                                      },
                                    );
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    labelText: " ابحث باسم اللعبة ",
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 2),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                          255,
                                          208,
                                          114,
                                          151,
                                        ), // لون البوردر العادي
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFFFECB3,
                                        ), // لون البوردر وقت الفوكس
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Container(
                                width: width * 0.34,
                                height: 50,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Get.offNamedUntil(
                                      '/games',
                                      (route) => route.settings.name == '/home',
                                    );
                                  },
                                  icon: const Icon(Icons.add, size: 18),
                                  label: const Text('انشاء لعبة جديدة'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange[700],
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 5),

                      // الـGrid نفسه
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          child: Obx(() {
                            if (controller.loading.value) {
                              return Padding(
                                padding: EdgeInsets.all(height * 0.2),
                                child: CircularProgressIndicator(
                                  color: Colors.deepOrange,
                                ),
                              );
                            } else if (controller.mygames.isEmpty) {
                              return Padding(
                                padding: EdgeInsets.all(height * 0.2),
                                child: Text('لا يوجد بيانات'),
                              );
                            } else {
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: width * 0.25,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 5,
                                      mainAxisExtent: height * 0.45,
                                    ),
                                itemCount: controller.mygames.length,
                                itemBuilder: (ctx, i) {
                                  int? selected;
                                  final isSelected =
                                      selected == controller.mygames[i]['id'];
                                  final List<Map<String, dynamic>> game =
                                      List<Map<String, dynamic>>.from(
                                        controller.mygames[i]['games'],
                                      );

                                  return GestureDetector(
                                    onTap: () {
                                      controller.myGameId.value =
                                          controller.mygames[i]['id'];
                                      selected = controller.mygames[i]['id'];
                                      Get.dialog(
                                        ShowDialogMyGame(
                                          context,
                                          controller.mygames[i]['id'],
                                          controller,
                                        ),
                                      );
                                    },
                                    child: Card(
                                      elevation: 20,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      color: Colors.black,
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(height: height * 0.07),
                                              GridView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                gridDelegate:
                                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                                      maxCrossAxisExtent:
                                                          width * 0.09,
                                                      crossAxisSpacing: 0,
                                                      mainAxisSpacing: 0,
                                                      mainAxisExtent:
                                                          height * 0.15,
                                                    ),
                                                itemCount: game.length,
                                                itemBuilder: (ctx, index) {
                                                  return Column(
                                                    children: [
                                                      Expanded(
                                                        flex: 4,
                                                        child: ClipRRect(
                                                          child: Image.network(
                                                            '$serverlink/${game[index]['photo']}',
                                                            fit: BoxFit.fill,
                                                            width: width * 0.1,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                color:
                                                                    Colors
                                                                        .black,
                                                              ),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            game[index]['name'],
                                                            style: TextStyle(
                                                              color: Color(
                                                                0xFFFFECB3,
                                                              ),
                                                              fontSize:
                                                                  width * 0.012,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                9,
                                                              ),
                                                          bottomRight:
                                                              Radius.circular(
                                                                9,
                                                              ),
                                                        ),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    controller
                                                        .mygames[i]['name'],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Color(0xFFFFECB3),
                                                      fontSize: width * 0.018,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            left: 0,
                                            child: Container(
                                              width: width * 0.2,
                                              height: height * 0.08,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(9),
                                                  topRight: Radius.circular(9),
                                                ),
                                                color: Colors.black,
                                              ),
                                              child: Text(
                                                " عدد مرات اللعب : ${controller.mygames[i]['count']} ",
                                                style: TextStyle(
                                                  fontSize: width * 0.016,
                                                  color: Color(0xFFFFECB3),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          }),
                        ),
                      ),

                      SizedBox(height: 50),
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
