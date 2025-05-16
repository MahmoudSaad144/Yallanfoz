import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppbarComponent(title: "Home", name: name, photo: photo),
      body: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150)),
        ),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: width,
                    height: 330,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFff9a9e),
                          const Color(0xFFfad0c4),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(150),
                        bottomRight: Radius.circular(150),
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
                                fontSize: width * 0.05,
                                fontFamily: "Cairo",
                                color: Colors.orange[700],
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
                                fontSize: width * 0.05,
                                fontFamily: "Cairo",
                                color: Colors.orange[700],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          " تحدي الاصدقاء في لعبة سؤال وجواب مع وسائل مساعدة ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "  لعبة جماعية تفاعلية تختبروا  بها معرفتكم وثقافتكم مع جماعتكم  ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.02,
                          ),
                        ),
                        SizedBox(height: 15),
                        MaterialButton(
                          onPressed: () {
                            Get.toNamed("/games");
                          },
                          color: Colors.orange[700],
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
            SizedBox(height: 30),

            Container(
              padding: EdgeInsets.all(8),
              child: Wrap(
                spacing: 20,
                runSpacing: 8,
                children: [
                  Container(
                    width: width * 0.3,
                    height: height * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.grey[300],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 20,
                          spreadRadius: 8,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          " اتصل بصديق ",
                          style: TextStyle(
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),

                        Text(
                          " صديقك اللي يعرف كل شي هذا وقته دق عليه ! ",
                          style: TextStyle(fontSize: width * 0.025),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),

                        Icon(
                          Icons.phone,
                          size: width * 0.1,
                          color: Colors.green,
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: width * 0.5,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.deepOrange,
                          ),
                          child: Text(
                            "تستخدمها بعد ماتشوف السؤال",
                            style: TextStyle(
                              fontSize: width * 0.023,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),

                  Container(
                    width: width * 0.3,
                    height: height * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.grey[300],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 20,
                          spreadRadius: 8,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          " اتصل بصديق ",
                          style: TextStyle(
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),

                        Expanded(
                          child: Text(
                            " !متردد بجوابين؟ هذي لك جاوب بالأثنين عشان تضمن النقاط ",
                            style: TextStyle(fontSize: width * 0.025),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10),

                        Icon(
                          Icons.looks_two_outlined,
                          size: width * 0.1,
                          color: Colors.lightBlue,
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: width * 0.5,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.deepOrange,
                          ),
                          child: Text(
                            "تستخدمها بعد ماتشوف السؤال",
                            style: TextStyle(
                              fontSize: width * 0.023,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),

                  Container(
                    width: width * 0.3,
                    height: height * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.grey[300],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 20,
                          spreadRadius: 8,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          " اتصل بصديق ",
                          style: TextStyle(
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),

                        Expanded(
                          child: Text(
                            " جاوب صح، و اخصم عدد النقاط اللي فزت فيها من نقاط الفريق الثاني ",
                            style: TextStyle(fontSize: width * 0.025),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10),

                        Icon(
                          Icons.swap_vert,
                          size: width * 0.1,
                          color: Colors.brown,
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: width * 0.5,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.deepOrange,
                          ),
                          child: Text(
                            "تستخدمها قبل ماتشوف السؤال",
                            style: TextStyle(
                              fontSize: width * 0.023,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
