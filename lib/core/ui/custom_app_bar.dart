import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    required this.onTapBackButton,
    this.canGoBack = true,
    this.actions,
    super.key,
  });

  final String title;
  final VoidCallback onTapBackButton;
  final List<Widget>? actions;
  final bool canGoBack;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.secondaryColor,
      surfaceTintColor: Colors.transparent,
      title: Text(
        widget.title,
        style: context.textTheme.titleMedium,
      ),
      centerTitle: true,
      leading: widget.canGoBack ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.backBtnColor,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: const Icon(Icons.arrow_back,
                color: AppColors.secondaryColor),
          ),
        ),
      ) : null,
      actions: widget.actions,
    );
  }
}
