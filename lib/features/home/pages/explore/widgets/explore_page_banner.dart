import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';

class ExplorePageBanner extends StatefulWidget {
  const ExplorePageBanner({super.key});

  @override
  State<ExplorePageBanner> createState() => _ExplorePageBannerState();
}

class _ExplorePageBannerState extends State<ExplorePageBanner> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  Animation<double>? _bannerAnimation;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animateBanner();
    });

  }

  _animateBanner() {

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000), // Adjust animation duration as needed
    );
    _bannerAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
    _controller.forward();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _bannerAnimation != null ? FadeTransition(
      opacity: _bannerAnimation!,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(Images.bannerImage)),
      ),
    ) : const SizedBox();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

}
