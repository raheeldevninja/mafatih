import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/images/images.dart';

class DismissibleTile2 extends StatefulWidget {
  const DismissibleTile2({
    required this.child,
    required this.onDismissed,
    super.key});

  final Widget child;
  final Function(DismissDirection)? onDismissed;

  @override
  State<DismissibleTile2> createState() => _DismissibleTile2State();
}

class _DismissibleTile2State extends State<DismissibleTile2> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      dismissThresholds: const {
        DismissDirection.endToStart: 0.75,
      },
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColors.redColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Images.deleteIcon, width: 32, height: 32, color: AppColors.redColor),
            const SizedBox(height: 8),
            Text('Delete', style: context.textTheme.bodySmall,),
          ],
        ),
      ),
      onDismissed: widget.onDismissed,
      child: widget.child,
    );
  }
}
