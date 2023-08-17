import 'package:flutter/material.dart';

import '../../../domain/model/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      borderRadius: BorderRadius.circular(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                // padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(product.image ?? '',
                            height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .4,
                            fit: BoxFit.cover),
                      ),
                    ),
                    const Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.favorite_border_outlined)),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(product.company ?? '',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(product.name ?? '', style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 4),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(product.price ?? '',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle add to cart action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: -10),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(0, 98, 189, 3),
                            Color.fromRGBO(0, 98, 189, 0),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      padding: const EdgeInsets.all(11),
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
