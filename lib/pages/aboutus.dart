import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/components/appbar.dart';
import 'package:yallanfoz/controller/appinfo_controller.dart';

class AboutUs extends GetView<AppInfoController> {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppbarComponent(),
      body: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        ' من نحن ',
                        style: TextStyle(
                          color: Color(0xFFFFECB3),
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Html(
                        data: controller.appInfo['about'],
                        style: {
                          "*": Style(
                            color: Colors.white,
                            // fontSize: FontSize.medium,
                          ),
                        },
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        ' تواصل معنا عبر ',
                        style: TextStyle(
                          color: Color(0xFFFFECB3),
                          fontSize: width * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.1),

                    Container(
                      width: width * 0.5,
                      alignment: Alignment.topRight,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 100,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 80,
                        ),
                        itemCount: controller.socialIcons.length,
                        itemBuilder: (ctx, i) {
                          final item = controller.socialIcons[i];
                          final isWhatsapp = item['isWhatsapp'] == true;
                          final isMap = item['isMap'] == true;
                          final key = item['key'] ?? item['urlKey'];

                          String url = '';
                          String? fallbackUrl;

                          if (isWhatsapp) {
                            final phone = controller.contactus['phone'] ?? '';
                            final formattedPhone =
                                phone.startsWith('20') ? phone : '20$phone';
                            url = 'whatsapp://send?phone=$formattedPhone';
                            fallbackUrl = 'https://wa.me/$formattedPhone';
                          } else if (isMap) {
                            final address = Uri.encodeComponent(
                              controller.contactus['address'] ?? '',
                            );
                            url = 'geo:0,0?q=$address';
                            fallbackUrl =
                                'https://www.google.com/maps/search/?api=1&query=$address';
                          } else {
                            url = controller.contactus[key] ?? '';
                            fallbackUrl = url;
                          }

                          return Tooltip(
                            message: item['label'],
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            textStyle: TextStyle(color: Colors.white),
                            child: Material(
                              color: item['color'],
                              shape: CircleBorder(),
                              child: InkWell(
                                customBorder: CircleBorder(),
                                onTap: () async {
                                  await controller.launchUniversalLink(
                                    url,
                                    fallbackUrl!,
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(width * 0.015),
                                  child: Icon(
                                    item['icon'],
                                    size: width * 0.04,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
