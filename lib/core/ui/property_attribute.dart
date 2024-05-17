import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/extension/context.dart';

class PropertyAttribute extends StatelessWidget {
  const PropertyAttribute({
    required this.icon,
    required this.value,
    super.key,
  });

  final String icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          icon,
          width: 12,
          height: 12,
        ),
        const SizedBox(width: 2),
        Flexible(
          child: Text(
            value,
            style: context.textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}