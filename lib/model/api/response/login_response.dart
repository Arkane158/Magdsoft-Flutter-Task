class LoginResponse {
  LoginResponse({
      this.status, 
      this.message, 
      this.code,});

  LoginResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
  }
  int? status;
  String? message;
  String ?code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['code'] = code;
    return map;
  }

}