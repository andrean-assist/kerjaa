import 'package:assist_hadir/shared/shared_enum.dart';
import 'package:assist_hadir/shared/shared_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomModal extends StatelessWidget {
  final String imagePath;
  final double? imageHeight;
  final String title;
  final String description;

  const CustomModal({
    super.key,
    required this.imagePath,
    this.imageHeight,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 38,
            height: 4,
            decoration: BoxDecoration(
              color: theme.disabledColor,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(height: 32),
          (imagePath.isVectorFileName)
              ? SvgPicture.asset(
                  imagePath,
                  height: imageHeight,
                )
              : Image.asset(
                  imagePath,
                  height: 250,
                  fit: BoxFit.cover,
                ),
          const SizedBox(height: 24),
          Text(
            title,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: SharedTheme.semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: SharedTheme.semiBold,
              color: theme.hintColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
