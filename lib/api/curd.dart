import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // دالة GET
  static Future<dynamic> getRequest(String url, String? token) async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': 'ar',
      };

      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
      final response = await http.get(Uri.parse(url), headers: headers);
      final responseData = jsonDecode(response.body);
      return handleResponse(response.statusCode, responseData);
    } catch (e) {
      print("خطأ أثناء الطلب: $e");
      Get.snackbar(
        "خطأ",
        "حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }

  // دالة POST
  static Future<dynamic> postRequest(
    String url,
    String? token,
    Map<String, dynamic>? body,
  ) async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': 'ar',
      };

      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body != null ? jsonEncode(body) : {},
      );
      final responseData = jsonDecode(response.body);

      return handleResponse(response.statusCode, responseData);
    } catch (e) {
      print("خطأ أثناء الطلب: $e");
      Get.snackbar(
        "خطأ",
        "حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }

  static Future<dynamic> sendPostWithMultipart({
    required String url,
    required String? token,
    Map<String, dynamic>? body,
    File? file,
    String fileField = "photo",
  }) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(url));

      // Add headers
      request.headers.addAll({
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
      });

      // Add body
      if (body != null) {
        request.fields.addAll(
          body.map((key, value) => MapEntry(key, value.toString())),
        );
      }

      // Add file if exists
      if (file != null) {
        final multipartFile = await http.MultipartFile.fromPath(
          fileField,
          file.path,
        );
        request.files.add(multipartFile);
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      final responseData = jsonDecode(response.body);

      return handleResponse(response.statusCode, responseData);
    } catch (e) {
      print("خطأ أثناء الطلب: $e");
      Get.snackbar(
        "خطأ",
        "حدث خطأ غير متوقع، حاول مرة تانية.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }

  static handleResponse(int statusCode, dynamic responseData) {
    if (statusCode == 200) {
      int successCode = responseData["status_code"] ?? 0;

      if ([406, 407, 401].contains(successCode)) {
        Get.snackbar(
          "خطأ",
          responseData['message'],
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        if (successCode == 407) {
          return responseData;
        }
        return null;
      }

      return responseData;
    } else if (statusCode == 422) {
      Get.snackbar(
        "خطأ",
        responseData['errors'],
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    } else if (statusCode == 401) {
      GetStorage().remove('token');
      Get.offAllNamed("/login");

      Get.snackbar(
        "",
        "تم طردك بسبب انتهاء الجلسة أو الحظر.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    } else {
      Get.snackbar(
        "خطأ",
        responseData['errors'],
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }
}
