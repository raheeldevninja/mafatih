import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property.dart';
import 'package:mafatih/core/ui/simple_button.dart';


class PropertyDetailsScreen extends StatefulWidget {
  const PropertyDetailsScreen({
    required this.property,
    super.key});

  final Property property;

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {

              if(Navigator.canPop(context)) {
                Navigator.pop(context);
              }

            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.backBtnColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: const Icon(Icons.arrow_back, color: AppColors.secondaryColor),
            ),
          ),
        ),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {


            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.backBtnColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: SvgPicture.asset(
                width: 24,
                height: 24,
                Images.favouriteIcon,
              ),
            ),
          ),

          const SizedBox(width: 10,),

          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.backBtnColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: SvgPicture.asset(
                width: 24,
                height: 24,
                Images.shareIcon,
              ),
            ),
          ),
          const SizedBox(width: 20,),

        ],
      ),
      body: Stack(
        children: [

          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Stack(
              children: [

                Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 300.0,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              //current = index;
                            });
                          },
                        ),
                        items: widget.property.images.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return CachedNetworkImage(
                                imageUrl: 'https://via.placeholder.com/1000x600',
                                fit: BoxFit.fill,
                                progressIndicatorBuilder: (context, url, downloadProgress) =>
                                const CupertinoActivityIndicator(),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),



                  ],
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.property.images.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => {},
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness == Brightness.dark
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor)
                                  .withOpacity(current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ),

              ],
            ),
          ),


          Positioned(
            left: 0,
            right: 0,
            top: 300,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(widget.property.propertyName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                  const SizedBox(height: 16),

                  Row(
                    children: [

                      SvgPicture.asset(
                        Images.selectedLocationIcon,
                        width: 24,
                        height: 24,
                      ),

                      const SizedBox(width: 8),

                      Expanded(child: Text(widget.property.address, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)),



                      SizedBox(
                        width: 130,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shadowColor: Colors.transparent,
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              SvgPicture.asset(
                                Images.seeVideosIcon,
                                width: 14,
                                height: 14,
                              ),

                              const SizedBox(width: 8),

                              Text(
                                'See Videos',
                                style: const TextStyle(fontSize: 14, color: AppColors.whiteColor, fontWeight: FontWeight.normal,),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),








        ],
      ),

    );
  }
}
