
import 'package:magdsoftfluttertask/domain/model/account.dart';

class OtpResponse {
  final int? status;
  final String? message;
  final Account? account;

  OtpResponse({
    required this.status,
    required this.message,
    required this.account,
  });

 
}
