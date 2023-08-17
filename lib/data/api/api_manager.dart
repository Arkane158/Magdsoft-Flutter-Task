import 'dart:convert';

import 'package:magdsoftfluttertask/data/api/request/login_request.dart';
import 'package:http/http.dart' as http;
import 'package:magdsoftfluttertask/data/api/request/otp_request.dart';
import 'package:magdsoftfluttertask/data/api/response/get_help_response.dart';
import 'package:magdsoftfluttertask/data/api/response/login_response_dto.dart';
import 'package:magdsoftfluttertask/data/api/response/otp_response_dto.dart';
import 'package:magdsoftfluttertask/data/model/product_dto.dart';

class ApliManager {
  final String baseUrl = 'magdsoft.ahmedshawky.fun';
  final String loginUrl = '/api/verifyPhone';
  final String otpUrl = '/api/otp';
  final String getProductsUrl = 'api/getProducts';
  final String getHelpUrl = 'api/getHelp';
  static ApliManager? _instane;

  ApliManager._();
  static ApliManager getInstance() {
    _instane ??= ApliManager._();
    return _instane!;
  }

  Future<LoginResponseDTO> loginRequest(String name, String phone) async {
    var requestBody = LoginRequest(name: name, phone: phone);
    var url = Uri.https(baseUrl, loginUrl);
    var response = await http.post(url, body: requestBody.toJson());
    return LoginResponseDTO.fromJson(jsonDecode(response.body));
  }

  Future<OtpResponseDTO> otpRequest(String code, String phoneNumber) async {
    var requestBody = OtpRequest(phone: phoneNumber, code: code);
    var url = Uri.https(baseUrl, otpUrl);
    var respnse = await http.post(url, body: requestBody.toJson());
    return OtpResponseDTO.fromJson(jsonDecode(respnse.body));
  }

  Future<List<ProductsDTO>> getProducts() async {
    var url = Uri.https(baseUrl, getProductsUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> productsData = jsonData['products'];

      // Map the dynamic data to the Products model objects
      final products = productsData.map((productJson) {
        return ProductsDTO.fromJson(productJson);
      }).toList();

      return products;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<GetHelpResponse> getHelp() async {
    var url = Uri.https(baseUrl, getHelpUrl);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return GetHelpResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load help items');
    }
  }
}
