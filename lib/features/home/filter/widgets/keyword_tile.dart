import 'package:flutter/material.dart';
import 'package:mafatih/core/extension/context.dart';

class KeywordTile extends StatelessWidget {
  const KeywordTile({
    required this.value,
    required this.onTap,
    super.key});

  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.close,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
