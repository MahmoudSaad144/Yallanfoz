import 'package:flutter/material.dart';
import 'package:yallanfoz/components/appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => __Home();
}

class __Home extends State<Home> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? name = "Mahmoud Saad";
    String? photo = "https://giftdose.dev-swift.com/imgs/users/default-img.png";
    // String? email = "MahmoudSaad@gmail.com";

    return Scaffold(
      appBar: AppbarComponent(title: "Home", name: name, photo: photo),
      body: Container(
        //MediaQuery.of(context).size.width علشان اجيب عرض الشاشه كامل
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150)),
        ),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 330,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF1E1E2F), Color(0xFFFFD700)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(150),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "يلا",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontFamily: "Cairo",
                                color: Color(0xFFFFECB3),
                              ),
                            ),
                            SizedBox(width: 10),
                            Image.asset(
                              "images/logo.png",
                              height: 150,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),

                            Text(
                              "نفوز",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontFamily: "Cairo",
                                color: Color(0xFFFFECB3),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          " تحدي الاصدقاء في لعبة سؤال وجاوب مع وسائل مساعدة ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "  لعبة جماعية تفاعلية تختبروا  بها معرفتكم وثقافتكم مع جماعتكم  ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.02,
                          ),
                        ),
                        SizedBox(height: 15),
                        MaterialButton(
                          onPressed: () {},
                          color: Color(0xFFF4A300),
                          textColor: Colors.white,
                          padding: EdgeInsets.all(12),
                          minWidth: 200,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.add, color: Colors.white),
                              SizedBox(width: 2),
                              Text("إنشاء لعبة"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
