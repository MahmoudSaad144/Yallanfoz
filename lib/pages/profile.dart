import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yallanfoz/components/country_picker_code.dart';
import 'package:yallanfoz/components/only_country_picker.dart';
import 'package:yallanfoz/controller/profile_controller.dart';

class Profile extends GetView<ProfileController> {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.15,
                left: 40,
                right: 40,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                ),
              ),
              child: SafeArea(
                child: ListView(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                textColor: Color(0xFFFFFFFF),
                                color: Color(0xFFF4A300),
                                minWidth: 150,
                                elevation: 10.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    constraints: BoxConstraints(
                                      // هنا بنلغي القيد الافتراضي ونخليه بحد أقصى عرض الشاشة فعلياً
                                      maxWidth:
                                          MediaQuery.of(context).size.width,
                                    ),
                                    builder:
                                        (context) => Container(
                                          padding: EdgeInsets.all(20),
                                          height:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.4, // نص الشاشة مثلاً
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(25),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                "اختار صورة ",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  File? image = await controller
                                                      .pickImage(
                                                        ImageSource.gallery,
                                                      );
                                                  if (image != null) {
                                                    controller.file.value =
                                                        image;
                                                  }
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.width,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(Icons.image),
                                                      Text(
                                                        " من المعرض  ",
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  File? image = await controller
                                                      .pickImage(
                                                        ImageSource.camera,
                                                      );
                                                  if (image != null) {
                                                    controller.file.value =
                                                        image;
                                                  }
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.width,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(Icons.camera_alt),
                                                      Text(
                                                        " من الكاميرا ",
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.edit),
                                    Text("تغير الصورة"),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Obx(
                                () => ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(200),
                                  ),
                                  child:
                                      controller.file.value != null
                                          ? Image.file(
                                            controller.file.value!,
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.cover,
                                          )
                                          : Image.network(
                                            controller.photo.value,
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (_, __, ___) => Icon(
                                                  Icons.person,
                                                  size: 70,
                                                ),
                                          ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Form(
                            key: controller.updateUserForm,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: controller.name,
                                        validator: (name) {
                                          if (name!.isEmpty) {
                                            return " هذا الحقل مطلوب ";
                                          }
                                          return null;
                                        },
                                        //autovalidateMode علشان اخليه يعمل validate بشكل ريل تايم
                                        autovalidateMode:
                                            AutovalidateMode.onUnfocus,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          labelText: " الأسم ",
                                          labelStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 2),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: const Color(
                                                0xFFfff5e1,
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
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: CountryCodePickerField(
                                        controller: controller.phone,
                                        label: "رقم الهاتف",
                                        onCountryCodeChanged: (code) {
                                          controller.phone_code.value = code;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        enabled: false,
                                        controller: controller.email,
                                        validator: (email) {
                                          if (email!.isEmpty) {
                                            return " هذا الحقل مطلوب ";
                                          }

                                          if (!RegExp(
                                            r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                                          ).hasMatch(email)) {
                                            return " البريد الإلكتروني غير صحيح";
                                          }
                                          return null;
                                        },
                                        //autovalidateMode علشان اخليه يعمل validate بشكل ريل تايم
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        autovalidateMode:
                                            AutovalidateMode.onUnfocus,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          labelText: "البريد الاكتروني",
                                          labelStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 2),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: const Color(
                                                0xFFfff5e1,
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
                                          disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),

                                    Expanded(
                                      child: CountryOnlyPickerField(
                                        label: "الدولة",
                                        onCountrySelected: (countryName) {
                                          print(countryName);
                                          controller.country.value =
                                              countryName;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Obx(
                                  () => MaterialButton(
                                    onPressed: () {
                                      controller.updateUser();
                                    },
                                    color: Color(0xFFF4A300),
                                    textColor: Colors.white,
                                    minWidth: 200,
                                    elevation: 10.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child:
                                        controller.isloading.value
                                            ? CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                            : Text(" تحديث "),
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
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_forward, color: Color(0xFFFFECB3)),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
}
