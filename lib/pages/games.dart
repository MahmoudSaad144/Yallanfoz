import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/api/linkserver.dart';
import 'package:yallanfoz/components/appbar.dart';
import 'package:yallanfoz/components/showcustomdialog.dart';
import 'package:yallanfoz/controller/games_controller.dart';

class Games extends GetView<GamesController> {
  const Games({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Timer? _debounce;
    return Obx(() {
      final listWidth = controller.selected.isNotEmpty ? width * 0.2 : 0.0;
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
                                "اختار الفئات",
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
                                  " ٣ فئات لفريقك، و ٣ فئات للفريق المنافس، بمجموع ٦ فئات بـ ٣٦ سؤال مختلف، اختاروا الفئات بعناية عشان تضمنون الفرصة الأكبر للفوز ",
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
                            margin: EdgeInsets.only(right: listWidth),
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
                                          await controller.GetGames(
                                            isInitial: true,
                                          );
                                        },
                                      );
                                    },
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      labelText: " ابحث باسم الفئة ",
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
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
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          controller.country.value = '';
                                          await controller.GetGames(
                                            isInitial: true,
                                          );
                                        },
                                        child: Container(
                                          height: 50,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color:
                                                controller.country.value == ''
                                                    ? Colors.grey[200]
                                                    : Colors.grey[300],
                                            border:
                                                controller.country.value == ''
                                                    ? Border.all(
                                                      color: Color.fromARGB(
                                                        255,
                                                        208,
                                                        114,
                                                        151,
                                                      ),
                                                      width: 2,
                                                    )
                                                    : null,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              bottomRight: Radius.circular(15),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                              width * 0.002,
                                            ),
                                            child: Text(
                                              "الكل",
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                controller.countrys.length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () async {
                                                  controller.country.value =
                                                      controller
                                                          .countrys[index]['id']
                                                          .toString();
                                                  await controller.GetGames(
                                                    isInitial: true,
                                                  );
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        controller.countrys[index]['id']
                                                                    .toString() ==
                                                                controller
                                                                    .country
                                                                    .value
                                                            ? Colors.grey[200]
                                                            : Colors.grey[300],
                                                    border:
                                                        controller.countrys[index]['id']
                                                                    .toString() ==
                                                                controller
                                                                    .country
                                                                    .value
                                                            ? Border.all(
                                                              color:
                                                                  Color.fromARGB(
                                                                    255,
                                                                    208,
                                                                    114,
                                                                    151,
                                                                  ),
                                                              width: 2,
                                                            )
                                                            : null,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          8.0,
                                                        ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                            Radius.circular(
                                                              200,
                                                            ),
                                                          ),
                                                      child: Image.network(
                                                        '$serverlink/${controller.countrys[index]["photo"]}',
                                                        width: 40,
                                                        height: 40,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
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
                            margin: EdgeInsets.only(right: listWidth),
                            alignment: Alignment.center,
                            child:
                                controller.loading.value
                                    ? Padding(
                                      padding: EdgeInsets.all(height * 0.2),
                                      child: CircularProgressIndicator(
                                        color: Colors.deepOrange,
                                      ),
                                    )
                                    : controller.games.isEmpty
                                    ? Padding(
                                      padding: EdgeInsets.all(height * 0.2),
                                      child: Text(' لا يوجد ببيانات '),
                                    )
                                    : GridView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 180,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 5,
                                            mainAxisExtent: 200,
                                          ),
                                      itemCount: controller.games.length,
                                      itemBuilder: (ctx, i) {
                                        final isSelected = controller.selected
                                            .any(
                                              (s) =>
                                                  s['id'] ==
                                                  controller.games[i]['id'],
                                            );

                                        return GestureDetector(
                                          onTap: () {
                                            if (isSelected)
                                              controller.selected.remove(
                                                controller.games[i],
                                              );
                                            else if (controller
                                                    .selected
                                                    .length <
                                                6)
                                              controller.selected.add(
                                                controller.games[i],
                                              );
                                          },
                                          child: Opacity(
                                            opacity:
                                                controller.selected.length >
                                                            5 &&
                                                        !isSelected
                                                    ? 0.5
                                                    : 1,
                                            child: Card(
                                              elevation: isSelected ? 12 : 2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                                side:
                                                    isSelected
                                                        ? BorderSide(
                                                          color: Color(
                                                            0xFFFFECB3,
                                                          ),
                                                          width: 4,
                                                        )
                                                        : BorderSide.none,
                                              ),
                                              child: Stack(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: 130,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                topLeft:
                                                                    Radius.circular(
                                                                      15,
                                                                    ),
                                                                topRight:
                                                                    Radius.circular(
                                                                      15,
                                                                    ),
                                                              ),
                                                          color: Colors.black,
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.vertical(
                                                                top:
                                                                    Radius.circular(
                                                                      15,
                                                                    ),
                                                              ),
                                                          child: Image.network(
                                                            '$serverlink/${controller.games[i]['photo']}',
                                                            height:
                                                                height * 0.25,
                                                            width: width * 0.1,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            color:
                                                                Color.fromARGB(
                                                                  184,
                                                                  238,
                                                                  134,
                                                                  137,
                                                                ),
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
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            controller
                                                                .games[i]['name'],
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  width * 0.018,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Positioned(
                                                    top: 0,
                                                    left: 0,
                                                    child: IconButton(
                                                      color: Color(0xFFFFECB3),
                                                      icon: Icon(
                                                        Icons.info_outline,
                                                      ),
                                                      onPressed:
                                                          () => ShowDialogGameInfo(
                                                            context,
                                                            controller
                                                                .games[i]['description'],
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                          ),
                        ),

                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),

              // 2) قائمة المحددات ثابتة على اليمين
              if (controller.selected.isNotEmpty)
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  width: listWidth,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // لون الشادو
                          spreadRadius: 8, // مدى انتشار الشادو
                          blurRadius: 3, // درجة النعومة
                          offset: Offset(0, 4), // اتجاه الشادو (يمين/تحت)
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: controller.selected.length,
                      itemBuilder: (ctx, i) {
                        return Column(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 130,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                        color: Colors.black,
                                      ),
                                      alignment: Alignment.center,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(15),
                                        ),
                                        child: Image.network(
                                          '$serverlink/${controller.selected[i]['photo']}',
                                          height: height * 0.25,
                                          width: width * 0.1,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(
                                          255,
                                          225,
                                          116,
                                          119,
                                        ),
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(9),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        controller.selected[i]['name'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.015,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: -10,
                                  right: -10,
                                  child: IconButton(
                                    color: Color(0xFFFFECB3),
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                    icon: Icon(Icons.close, size: 16),
                                    onPressed:
                                        () => controller.selected.removeAt(i),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              if (controller.selected.length > 5)
                Positioned(
                  bottom: 0,
                  right: width * 0.25,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 20,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(right: listWidth),
                      width: width * 0.2,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.dialog(
                            MediaQuery(
                              data: MediaQuery.of(
                                context,
                              ).copyWith(viewInsets: EdgeInsets.zero),
                              child: GameStartDialog(
                                create: true,
                                controller: controller,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 8,
                          backgroundColor: Colors.deepOrange,
                        ),
                        child: const Text(
                          ' تحديد الفرق ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
