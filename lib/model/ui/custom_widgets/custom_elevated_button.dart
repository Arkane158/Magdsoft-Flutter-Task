import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      required this.radius,
      this.elevation = 0})
      : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final double radius;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        color: Colors.transparent,
        elevation: elevation,
        child: Container(
          height: MediaQuery.of(context).size.height * .05,
          width: MediaQuery.of(context).size.width * 1.5,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff0062bd),
                Color(0x7f0062bd),
                Color.fromARGB(134, 0, 98, 189)
              ],
            ),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ), // Set the button's color to transparent
              elevation: 0, // Remove any elevation shadow
            ),
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
