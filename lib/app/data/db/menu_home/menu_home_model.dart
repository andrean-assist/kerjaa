import 'dart:ui';

class MenuHomeModel {
  final String iconPath;
  final Color color;
  final String label;
  final Function() onPressed;

  MenuHomeModel({
    required this.iconPath,
    required this.color,
    required this.label,
    required this.onPressed,
  });
}
