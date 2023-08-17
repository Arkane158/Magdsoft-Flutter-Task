import 'package:flutter/material.dart';

class CustomHomeBrandingContainer extends StatelessWidget {
  const CustomHomeBrandingContainer({
    Key? key,
    required this.imagePath,
    required this.brandName,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String imagePath;
  final String brandName;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        // Use InkWell instead of Material to handle tap.
        onTap: onTap, // Call the onTap function when the brand is tapped.
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width * .25,
            height: MediaQuery.of(context).size.height * .05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isSelected
                  ? const Color(0xff0062bd)
                  : Colors.white, // Set the color based on isSelected.
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Center(
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                    child: Text(
                  brandName,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
