import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        color: Theme.of(context).primaryColor,
        height: 1,
      ),
    );
  }
}
