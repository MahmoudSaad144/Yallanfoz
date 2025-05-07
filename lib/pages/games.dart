import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/components/appbar.dart';

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<Games> {
  // بيانات الباقات
  final List<Map<String, dynamic>> games = [
    {
      'name': ' المطاعم',
      'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
      'description': ' يحتوي علي اسئلة تتعلق بالمطاعم و الاكلات  ',
    },
    {
      'name': ' رياضة',
      'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
      'description': ' يحتوي علي اسئلة تتعلق بالرياضة  ',
    },
    {
      'name': ' افلام',
      'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
      'description': ' يحتوي علي اسئلة تتعلق بالمطاعم و الاكلات  ',
    },
    {
      'name': ' فن',
      'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
      'description': ' يحتوي علي اسئلة تتعلق بالمطاعم و الاكلات  ',
    },
    {
      'name': ' اسم اللاعب',
      'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
      'description': ' يحتوي علي اسئلة تتعلق بالمطاعم و الاكلات  ',
    },
    {
      'name': ' مهن',
      'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
      'description': ' يحتوي علي اسئلة تتعلق بالمطاعم و الاكلات  ',
    },
    {
      'name': ' الدوريات ',
      'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
      'description': ' خمن الدوريات   ',
    },
    {
      'name': ' ملاعب ',
      'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
      'description': ' خمن الدوريات   ',
    },
    {
      'name': ' سيارات ',
      'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
      'description': ' خمن الدوريات   ',
    },
    {
      'name': ' ركز  ',
      'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
      'description': ' خمن الدوريات   ',
    },
    {
      'name': ' عام ',
      'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
      'description': ' خمن الدوريات   ',
    },
    {
      'name': ' تاريخ ',
      'photo': 'https://giftdose.dev-swift.com/imgs/users/default-img.png',
      'description': ' خمن الدوريات   ',
    },
  ];

  // المتغير لتعقب الفئة المحددة
  List<Map<String, dynamic>> _selected = [];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final listWidth = _selected.isNotEmpty ? width * 0.2 : 0.0;

    return Scaffold(
      appBar: AppbarComponent(
        title: "باقة الألعاب",
        name: "Mahmoud Saad",
        photo: "https://giftdose.dev-swift.com/imgs/users/default-img.png",
      ),
      body: Stack(
        children: [
          // 1) المحتوى القابل للتمرير
          Positioned.fill(
            child: SingleChildScrollView(
              child: Container(
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
                            "اختار الفئات",
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
                              " ٣ فئات لفريقك، و ٣ فئات للفريق المنافس، بمجموع ٦ فئات بـ ٣٦ سؤال مختلف، اختاروا الفئات بعناية عشان تضمنون الفرصة الأكبر للفوز ",
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

                    // الـGrid نفسه
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        margin: EdgeInsets.only(right: listWidth),

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
                            final isSelected = _selected.contains(games[i]);
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected)
                                    _selected.remove(games[i]);
                                  else if (_selected.length < 6)
                                    _selected.add(games[i]);
                                });
                              },
                              child: Opacity(
                                opacity:
                                    _selected.length > 5 && !isSelected
                                        ? 0.5
                                        : 1,
                                child: Card(
                                  elevation: isSelected ? 12 : 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                    side:
                                        isSelected
                                            ? BorderSide(
                                              color: Color(0xFFFFD700),
                                              width: 4,
                                            )
                                            : BorderSide.none,
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
                                              color: Colors.amber[800],
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
                                        left: 0,
                                        child: IconButton(
                                          icon: Icon(Icons.info_outline),
                                          onPressed:
                                              () => ShowDialogInfo(
                                                context,
                                                games[i]['description'],
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
          if (_selected.isNotEmpty)
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              width: listWidth,
              child: Container(
                color: Colors.grey[100],
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: _selected.length,
                  itemBuilder: (ctx, i) {
                    return Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(9),
                                  ),
                                  child: Image.network(
                                    _selected[i]['photo'],
                                    height: 80,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.amber[800],
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(9),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    _selected[i]['name'],
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
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                icon: Icon(Icons.close, size: 16),
                                onPressed:
                                    () => setState(() => _selected.removeAt(i)),
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
        ],
      ),
    );
  }
}

void ShowDialogInfo(context, String description) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.warning_amber_rounded,
              size: 50,
              color: const Color(0xFFff9a9e),
            ),
            SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Get.back();
              },

              child: Text("إلغاء"),
            ),
          ),
        ],
      );
    },
  );
}
