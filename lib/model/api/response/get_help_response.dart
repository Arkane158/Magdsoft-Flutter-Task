import 'help.dart';

class GetHelpResponse {
  GetHelpResponse({
      this.status, 
      this.message, 
      this.help,});

  GetHelpResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['help'] != null) {
      help = [];
      json['help'].forEach((v) {
        help?.add(Help.fromJson(v));
      });
    }
  }
  int ?status;
  String? message;
  List<Help> ?help;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (help != null) {
      map['help'] = help?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}