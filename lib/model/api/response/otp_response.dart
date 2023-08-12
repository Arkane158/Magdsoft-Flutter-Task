import 'account.dart';

class  OtpResponse {
  final int ?status;
  final String? message;
  final Account? account;

  OtpResponse({
    required this.status,
    required this.message,
    required this.account,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      status: json['status'],
      message: json['message'],
      account: Account.fromJson(json['account']),
    );
  }
}
