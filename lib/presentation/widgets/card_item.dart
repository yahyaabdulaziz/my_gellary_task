import 'package:flutter/material.dart';
import 'package:my_gallery_task/presentation/utils/app_assets.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        AppAssets.imPerson,
        fit: BoxFit.fill,
      ),
    );
  }
}
