import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/components/showcustomdialog.dart';
import 'package:yallanfoz/components/appbar.dart';

class Mygames extends StatefulWidget {
  const Mygames({Key? key}) : super(key: key);

  @override
  _MygamesPageState createState() => _MygamesPageState();
}

class _MygamesPageState extends State<Mygames> {
  // بيانات الباقات
  final List<Map<String, dynamic>> games = [
    {
      'id': 1,
      'name': ' تحدي الأسرة ',
      'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
      'description': ' يحتوي علي اسئلة تتعلق بالمطاعم و الاكلات  ',
    },
    {
      'id': 2,
      'name': ' الاخوات ',
      'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
      'description': ' يحتوي علي اسئلة تتعلق بالرياضة  ',
    },
    {
      'id': 3,
      'name': ' الأصدقاء ',
      'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
      'description': ' يحتوي علي اسئلة تتعلق بالمطاعم و الاكلات  ',
    },
  ];

  TextEditingController search = TextEditingController();
  Timer? _debounce;
  int? _selected;
  @override
  void dispose() {
    _debounce?.cancel();
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppbarComponent(
        title: " العابي ",
        name: "Mahmoud Saad",
        photo: "https://giftdose.dev-swift.com/imgs/users/default-img.png",
      ),
      body: Stack(
        children: [
          // 1) المحتوى القابل للتمرير
          Positioned.fill(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFfff5e1), // بيج فاتح جداً
                      Color(0xFFfdeef4), // بينك شفاف
                    ],
                  ),
                ),

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
                        gradient: LinearGradient(
                          colors: [Color(0xFFff9a9e), Color(0xFFfad0c4)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "اختار من العابك",
                            style: TextStyle(
                              fontSize: width * 0.03,
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            " لعبة جماعية تفاعلية نختبر فيها معرفتكم و ثقافتكم ",
                            style: TextStyle(
                              fontSize: width * 0.025,
                              fontWeight: FontWeight.bold,
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
                                controller: search,
                                onChanged: (value) {
                                  if (_debounce?.isActive ?? false)
                                    _debounce!.cancel();

                                  _debounce = Timer(
                                    const Duration(milliseconds: 800),
                                    () {
                                      // هنا بيبدأ البحث بعد ما يوقف كتابة لمدة 500ms
                                      setState(() {
                                        print("ابحث عن: $value");
                                        // هنا حط استدعاء البحث من السيرفر مثلاً
                                      });
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
                                      color: Color.fromARGB(
                                        255,
                                        208,
                                        114,
                                        151,
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
                                  Get.toNamed("/games");
                                },
                                icon: const Icon(Icons.add, size: 18),
                                label: const Text('انشاء لعبة جديدة'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepOrange,
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
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 180,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 5,
                                mainAxisExtent: 200,
                              ),
                          itemCount: games.length,
                          itemBuilder: (ctx, i) {
                            final isSelected = _selected == i ? true : false;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected) {
                                    _selected = null;
                                  } else {
                                    _selected = i;
                                  }
                                });
                                Get.dialog(
                                  ShowDialogMyGame(context, _selected),
                                );
                              },
                              child: Card(
                                elevation: isSelected ? 12 : 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(15),
                                          ),
                                          child: Image.network(
                                            games[i]['photo'],
                                            height: 130,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                184,
                                                238,
                                                134,
                                                137,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(9),
                                                bottomRight: Radius.circular(9),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              games[i]['name'],
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.018,
                                                fontWeight: FontWeight.w600,
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
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color.fromARGB(
                                                255,
                                                223,
                                                192,
                                                129,
                                              ), // بيج فاتح جداً
                                              Color.fromARGB(
                                                255,
                                                226,
                                                138,
                                                174,
                                              ), // بينك شفاف
                                            ],
                                          ),
                                        ),
                                        child: Text(
                                          " عدد مرات اللعب : 5 ",
                                          style: TextStyle(
                                            fontSize: width * 0.016,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
        ],
      ),
    );
  }
}
