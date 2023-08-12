import 'dart:convert';

import 'package:magdsoftfluttertask/model/api/request/login_request.dart';
import 'package:http/http.dart' as http;
import 'package:magdsoftfluttertask/model/api/request/otp_request.dart';
import 'package:magdsoftfluttertask/model/api/response/get_help_response.dart';
import 'package:magdsoftfluttertask/model/api/response/login_response.dart';
import 'package:magdsoftfluttertask/model/api/response/otp_response.dart';
import 'package:magdsoftfluttertask/model/api/response/product.dart';

class ApliManager {
  static const String baseUrl = 'magdsoft.ahmedshawky.fun';
  static const String loginUrl = '/api/verifyPhone';
  static const String otpUrl = '/api/otp';
  static const String getProductsUrl = 'api/getProducts';
  static const String getHelpUrl = 'api/getHelp';

  static Future<LoginResponse> loginRequest(String name, String phone) async {
    var requestBody = LoginRequest(name: name, phone: phone);
    var url = Uri.https(baseUrl, loginUrl);
    var response = await http.post(url, body: requestBody.toJson());
    return LoginResponse.fromJson(jsonDecode(response.body));
  }

  static Future<OtpResponse> otpRequest(String code, String phoneNumber) async {
    var requestBody = OtpRequest(phone: phoneNumber, code: code);
    var url = Uri.https(baseUrl, otpUrl);
    var respnse = await http.post(url, body: requestBody.toJson());
    return OtpResponse.fromJson(jsonDecode(respnse.body));
  }

  static Future<List<Products>> getProducts() async {
    var url = Uri.https(baseUrl, getProductsUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> productsData = jsonData['products'];

      // Map the dynamic data to the Products model objects
      final products = productsData.map((productJson) {
        return Products.fromJson(productJson);
      }).toList();

      return products;
    } else {
      throw Exception('Failed to load data');
    }
  }

 static Future<GetHelpResponse> getHelp() async {
    var url = Uri.https(baseUrl, getHelpUrl);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return GetHelpResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load help items');
    }
  }
}
