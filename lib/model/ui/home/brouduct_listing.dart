import 'package:flutter/material.dart';
import 'package:magdsoftfluttertask/model/api/response/product.dart';
import 'package:magdsoftfluttertask/model/ui/home/product_item.dart';

class ProductListing extends StatelessWidget {
  const ProductListing({Key? key, required this.products}) : super(key: key);
  final List<Products> products;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        children: List.generate(products.length, (index) {
          return Column(
            crossAxisAlignment: index % 2 == 0
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              ProductItem(product: products[index]),
            ],
          );
        }),
      ),
    );
  }
}
