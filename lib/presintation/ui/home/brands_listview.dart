import 'package:flutter/material.dart';
import 'package:magdsoftfluttertask/presintation/providers/home_provider.dart';
import 'package:magdsoftfluttertask/presintation/ui/custom_widgets/custom_homebranding_container.dart';
import 'package:provider/provider.dart';

class BrandsListView extends StatelessWidget {
  const BrandsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BrandSelectionNotifier>(
      builder: (context, notifier, _) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHomeBrandingContainer(
              imagePath: 'assets/images/all.png',
              brandName: 'All',
              isSelected: notifier.selectedBrand == 'All',
              onTap: () => notifier.setSelectedBrand('All'),
            ),
            CustomHomeBrandingContainer(
              imagePath: 'assets/images/acer.png',
              brandName: 'Acer',
              isSelected: notifier.selectedBrand == 'Acer',
              onTap: () => notifier.setSelectedBrand('Acer'),
            ),
            CustomHomeBrandingContainer(
              imagePath: 'assets/images/razer.png',
              brandName: 'Razer',
              isSelected: notifier.selectedBrand == 'Razer',
              onTap: () => notifier.setSelectedBrand('Razer'),
            ),
            CustomHomeBrandingContainer(
              imagePath: 'assets/images/apple.png',
              brandName: 'Apple',
              isSelected: notifier.selectedBrand == 'Apple',
              onTap: () => notifier.setSelectedBrand('Apple'),
            ),
          ],
        );
      },
    );
  }
}
