import 'package:flutter/material.dart';

class CustomColorGridContainer extends StatelessWidget {
  const CustomColorGridContainer({super.key, this.child});
 final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xd80062bd), Color(0x000062bd)],
        ),
      ),
      child: child,
    );
  }
}
