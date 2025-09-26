import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.ontap,
  });
  final IconData? icon;
  final String title;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 4.0,
      ),

      onTap: ontap,
      title: Text(title),

      leading: Icon(icon),
    );
  }
}
