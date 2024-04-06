import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/features/search/widgets/property_attribute.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.secondaryColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.backBtnColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child:
                  const Icon(Icons.arrow_back, color: AppColors.secondaryColor),
            ),
          ),
        ),
        centerTitle: true,
        title: TextFormField(
          controller: _searchController,
          maxLines: 1,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.secondaryColor,
            contentPadding: const EdgeInsets.all(12.0),
            hintText: 'Search',
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.3), width: 1.0),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.lightGrey, width: 1.0),
              borderRadius: BorderRadius.circular(12.0),
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(
            height: 20,
            content: SizedBox(),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MainHeading(heading: 'Search Results'),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.58,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  Images.propertyImagePng,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    'Appartment for rent',
                                    style: TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: const PropertyAttribute(
                                          icon: Images.areaIcon,
                                          value: '90m2',
                                        ),
                                      ),

                                      const SizedBox(width: 4),

                                      Expanded(
                                        child: PropertyAttribute(
                                          icon: Images.bedIcon,
                                          value: '1',
                                        ),
                                      ),


                                      const SizedBox(width: 4),

                                      Expanded(
                                        child: PropertyAttribute(
                                          icon: Images.tvLoungeIcon,
                                          value: '2',
                                        ),
                                      ),

                                      const SizedBox(width: 4),

                                      Expanded(
                                        child: PropertyAttribute(
                                          icon: Images.bathIcon,
                                          value: '1',
                                        ),
                                      ),


                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  //price
                                  Text(
                                    '1000 SAR',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        Images.selectedLocationIcon,
                                        width: 20,
                                        height: 20,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'ZA Heights',
                                        style: const TextStyle(
                                            fontSize: 14, fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),

                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _searchController.dispose();
  }
}


