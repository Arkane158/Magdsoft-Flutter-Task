import 'package:magdsoftfluttertask/domain/model/login_response.dart';

class LoginResponseDTO {
  LoginResponseDTO({
    this.status,
    this.message,
    this.code,
  });

  LoginResponseDTO.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
  }
  int? status;
  String? message;
  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['code'] = code;
    return map;
  }

  LoginResponse toDomainLoginResponse() {
    return LoginResponse(status: status, message: message, code: code);
  }
}
