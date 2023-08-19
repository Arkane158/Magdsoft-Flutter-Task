import 'package:flutter/material.dart';

/// CustomAvatar - Reusable Avatar Widget
///
/// This widget creates a circular avatar with a customizable image.
class CustomAvatar extends StatelessWidget {
  /// Constructs a CustomAvatar widget.
  ///
  /// Parameters:
  ///   - imagePath: The path to the image asset.
  const CustomAvatar({Key? key, required this.imagePath}) : super(key: key);

  /// The path to the image asset used in the avatar.
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.12,
        height: MediaQuery.of(context).size.width * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
