import '../../model/product_dto.dart';

class GetProuductResponse {
  GetProuductResponse({
    this.status,
    this.message,
    this.products,
  });

  GetProuductResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductsDTO.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<ProductsDTO>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
