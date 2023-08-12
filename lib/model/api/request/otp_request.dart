class OtpRequest {
  OtpRequest({
    required  this.phone, 
   required   this.code,});

  OtpRequest.fromJson(dynamic json) {
    phone = json['phone'];
    code = json['code'];
  }
  String? phone;
  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['code'] = code;
    return map;
  }

}