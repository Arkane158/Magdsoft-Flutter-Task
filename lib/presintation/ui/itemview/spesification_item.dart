import 'package:flutter/material.dart';

class SpesificationItem extends StatelessWidget {
  const SpesificationItem(
      {super.key, required this.text,required this.isSelected });
  final String text;
  final String isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
              color:
                  isSelected == text ? Colors.black : const Color(0xffB1B1B1)),
        ),
        const SizedBox(
          height: 3,
        ),
        Center(
            child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isSelected == text ? Colors.blue : Colors.transparent,
          ),
          width: 5,
          height: 5,
        ))
      ],
    );
  }
}
