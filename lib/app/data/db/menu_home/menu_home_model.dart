import 'dart:ui';

class MenuHomeModel {
  final String icon;
  final Color color;
  final String label;
  final Function() onPressed;

  MenuHomeModel({
    required this.icon,
    required this.color,
    required this.label,
    required this.onPressed,
  });
}
