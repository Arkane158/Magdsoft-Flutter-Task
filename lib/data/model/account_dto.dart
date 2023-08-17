import 'package:magdsoftfluttertask/domain/model/account.dart';

class AccountDTO {
  final int id;
  final String name;
  final String phone;

  AccountDTO({required this.id, required this.name, required this.phone});

  factory AccountDTO.fromJson(Map<String, dynamic> json) {
    return AccountDTO(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
  Account toDomainAccount() {
    return Account(id: id, name: name, phone: phone);
  }
}
