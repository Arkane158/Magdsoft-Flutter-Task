import 'package:magdsoftfluttertask/domain/model/otp_response.dart';

import '../../model/account_dto.dart';

class OtpResponseDTO {
  final int? status;
  final String? message;
  final AccountDTO? account;

  OtpResponseDTO({
    required this.status,
    required this.message,
    required this.account,
  });

  factory OtpResponseDTO.fromJson(Map<String, dynamic> json) {
    return OtpResponseDTO(
      status: json['status'],
      message: json['message'],
      account: AccountDTO.fromJson(json['account']),
    );
  }
  OtpResponse toDomainOtpResponse() {
    return OtpResponse(account: account?.toDomainAccount(), status: status, message: message);
  }
}
