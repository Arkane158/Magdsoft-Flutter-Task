import 'package:flutter/material.dart';

/// CustomCrouseContainer - Reusable Custom Container with Background Image
///
/// This widget creates a customizable container with a background image.
class CustomCrouseContainer extends StatelessWidget {
  /// Constructs a CustomCrouseContainer widget.
  ///
  /// Parameters:
  ///   - imagePath: The path to the image asset used as the background.
  const CustomCrouseContainer({Key? key, required this.imagePath})
      : super(key: key);

  /// The path to the image asset used as the background of the container.
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
