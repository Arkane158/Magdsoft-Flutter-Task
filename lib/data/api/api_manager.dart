import 'dart:convert';

import 'package:magdsoftfluttertask/data/api/request/login_request.dart';
import 'package:http/http.dart' as http;
import 'package:magdsoftfluttertask/data/api/request/otp_request.dart';
import 'package:magdsoftfluttertask/data/api/response/get_help_response.dart';
import 'package:magdsoftfluttertask/data/api/response/login_response_dto.dart';
import 'package:magdsoftfluttertask/data/api/response/otp_response_dto.dart';
import 'package:magdsoftfluttertask/data/model/product_dto.dart';

/// ApliManager - API Management Class
///
/// This class handles various API requests related to user authentication, OTP verification,
/// fetching products, and help information.
class ApliManager {
  final String baseUrl = 'magdsoft.ahmedshawky.fun';
  final String loginUrl = '/api/verifyPhone';
  final String otpUrl = '/api/otp';
  final String getProductsUrl = 'api/getProducts';
  final String getHelpUrl = 'api/getHelp';
  static ApliManager? _instane;

  /// Private constructor to enforce singleton pattern.
  ApliManager._();

  /// Singleton instance creation method.
  static ApliManager getInstance() {
    _instane ??= ApliManager._();
    return _instane!;
  }

  /// Request user login.
  ///
  /// Parameters:
  ///   - name: User's name
  ///   - phone: User's phone number
  ///
  /// Returns a [LoginResponseDTO] object containing authentication response.
  Future<LoginResponseDTO> loginRequest(String name, String phone) async {
    // Construct request body
    var requestBody = LoginRequest(name: name, phone: phone);
    var url = Uri.https(baseUrl, loginUrl);
    var response = await http.post(url, body: requestBody.toJson());

    // Parse and return the response
    return LoginResponseDTO.fromJson(jsonDecode(response.body));
  }

  /// Request OTP verification.
  ///
  /// Parameters:
  ///   - code: OTP code
  ///   - phoneNumber: User's phone number
  ///
  /// Returns an [OtpResponseDTO] object containing OTP verification response.
  Future<OtpResponseDTO> otpRequest(String code, String phoneNumber) async {
    // Construct request body
    var requestBody = OtpRequest(phone: phoneNumber, code: code);
    var url = Uri.https(baseUrl, otpUrl);
    var response = await http.post(url, body: requestBody.toJson());

    // Parse and return the response
    return OtpResponseDTO.fromJson(jsonDecode(response.body));
  }

  /// Fetches a list of products.
  ///
  /// Returns a list of [ProductsDTO] containing product details.
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

  /// Fetches help information.
  ///
  /// Returns a [GetHelpResponse] object containing help information.
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
