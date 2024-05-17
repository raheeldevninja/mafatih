import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/features/home/filter/pages/filter_page_1.dart';
import 'package:mafatih/features/home/filter/pages/filter_page_2.dart';

class SavedFilterMainContent extends StatefulWidget {
  const SavedFilterMainContent({super.key});

  @override
  State<SavedFilterMainContent> createState() => _SavedFilterMainContentState();
}

class _SavedFilterMainContentState extends State<SavedFilterMainContent> {
  final pageController = PageController();

  List<Widget> _pages = [
    FilterPage1(),
    FilterPage2(),
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (page) {
              setState(() {
                _current = page;
              });
            },
            children: _pages,
          ),

          //indicators
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:

                  //get pages from controller

                  _pages.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => {},
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.greyColor
                          .withOpacity(_current == entry.key ? 1 : 0.0),
                      border: Border.all(
                        color: AppColors.greyColor,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
