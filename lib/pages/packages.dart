import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/components/appbar.dart';

class Packages extends StatefulWidget {
  const Packages({Key? key}) : super(key: key);

  @override
  _PackagesPageState createState() => _PackagesPageState();
}

class _PackagesPageState extends State<Packages> {
  // بيانات الباقات
  final List<Map<String, dynamic>> packages = [
    {
      'name': 'باقة البرونز',
      'price': '5',
      'number': '2',
      'color': Colors.orangeAccent,
    },
    {
      'name': 'باقة الفضة',
      'price': '10',
      'number': '5',
      'color': Colors.lightBlueAccent,
    },
    {
      'name': 'باقة البلاتين',
      'price': '20',
      'number': '10',
      'color': Colors.purpleAccent,
    },
    {
      'name': 'باقة الذهب',
      'price': '30',
      'number': '15',
      'color': Colors.amber,
    },
  ];

  // المتغير لتعقب الفئة المحددة
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppbarComponent(),
      body: Container(
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xFFff9a9e), const Color(0xFFfad0c4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 72,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      itemCount: packages.length,
                      itemBuilder: (context, index) {
                        final isSelected =
                            index == _selectedIndex ? true : false;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: Center(
                            child: Card(
                              elevation: isSelected ? 10 : 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side:
                                    isSelected
                                        ? const BorderSide(
                                          color: Colors.white,
                                          width: 3,
                                        )
                                        : BorderSide.none,
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              child: Container(
                                width: width * 0.9,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: packages[index]['color'],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      packages[index]['name'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "${packages[index]['number']} لعبة",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        '\$${packages[index]['price']}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  flex: 28,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // النص الرئيسي
                        Text(
                          "الألعاب المتبقية",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // خط تحت التيكست
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          height: 2,
                          width: 120,
                          color: Colors.white,
                        ),

                        // الرقم بجريدين أورنج
                        ShaderMask(
                          shaderCallback:
                              (bounds) => const LinearGradient(
                                colors: [Colors.orange, Colors.deepOrange],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds),
                          child: const Text(
                            "0",
                            style: TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // زر الدفع
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20,
              ),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedIndex != null) {
                      // طباعه بيانات الباقة المختارة
                      print(
                        'Selected Package:  ${packages[_selectedIndex!]["id"]}',
                      );
                      // هنا ممكن تضيف منطق الدفع الأونلاين
                    } else {
                      Get.snackbar(
                        "خطاء",
                        " اختار باقة اولا  ",
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        ' ادفع الأن ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${_selectedIndex != null ? packages[_selectedIndex!]["price"] : 0.00} \$",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
