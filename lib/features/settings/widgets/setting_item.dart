import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/extension/context.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    required this.label,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String label;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          width: 36,
          height: 36,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: SvgPicture.asset(icon)
      ),
      title: Text(label, style: context.textTheme.bodyMedium),
      onTap: onTap,
    );
  }
}
