import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/core/models/property.dart';
import 'package:mafatih/core/ui/app_drawer.dart';
import 'package:mafatih/core/ui/bottom_sheets.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/features/home/pages/explore/widgets/heading_and_see_all_button.dart';
import 'package:mafatih/features/home/pages/explore/widgets/project_data.dart';
import 'package:mafatih/features/home/pages/explore/widgets/project_item.dart';
import 'package:mafatih/features/home/pages/explore/widgets/property_item.dart';
import 'package:mafatih/features/search/search_screen.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Property> properties = [];
  List<Property> projects = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initPropertiesList();
      _initProjectsList();
    });
  }

  _initPropertiesList() {
    properties.add(
      Property(
        propertyName: 'Property Name',
        price: '44000',
        area: '90m2',
        beds: '2',
        tvLounge: '1',
        bath: '1',
        address: 'ZA Heights Riyadh',
        addOwner: 'Adeen Real Estate',
        ownerImage: 'https://via.placeholder.com/60x60',
        images: [
          Images.propertyImagePort,
          Images.propertyImagePort,
          Images.propertyImagePort,
        ],
      ),
    );

    properties.add(
      Property(
        propertyName: 'Property Name',
        price: '44000',
        area: '90m2',
        beds: '2',
        tvLounge: '1',
        bath: '1',
        address: 'ZA Heights Riyadh',
        addOwner: 'Adeen Real Estate',
        ownerImage: 'https://via.placeholder.com/40x40',
        images: [
          Images.propertyImagePort,
          Images.propertyImagePort,
          Images.propertyImagePort,
        ],
      ),
    );

    properties.add(
      Property(
        propertyName: 'Property Name',
        price: '44000',
        area: '90m2',
        beds: '2',
        tvLounge: '1',
        bath: '1',
        address: 'ZA Heights Riyadh',
        addOwner: 'Adeen Real Estate',
        ownerImage: 'https://via.placeholder.com/40x40',
        images: [
          Images.propertyImagePort,
          Images.propertyImagePort,
          Images.propertyImagePort,
        ],
      ),
    );

    properties.add(
      Property(
        propertyName: 'Property Name',
        price: '44000',
        area: '90m2',
        beds: '2',
        tvLounge: '1',
        bath: '1',
        address: 'ZA Heights Riyadh',
        addOwner: 'Adeen Real Estate',
        ownerImage: 'https://via.placeholder.com/40x40',
        images: [
          Images.propertyImagePort,
          Images.propertyImagePort,
          Images.propertyImagePort,
        ],
      ),
    );

    setState(() {});
  }

  _initProjectsList() {
    projects.add(
      Property(
        propertyName: 'Property Name',
        price: '44000',
        area: '90m2',
        beds: '2',
        tvLounge: '1',
        bath: '1',
        address: 'ZA Heights Riyadh',
        addOwner: 'Adeen Real Estate',
        ownerImage: 'https://via.placeholder.com/60x60',
        images: [
          Images.projectImageLand,
          Images.projectImageLand,
          Images.projectImageLand,
        ],
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final languageCode = AppLocalizations.of(context)!.localeName;
    final isEnglishLang = languageCode == 'en';

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.secondaryBgColor,
      drawer: const AppDrawer(),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.secondaryColor,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: SvgPicture.asset(
            Images.menuIcon,
            width: 24,
            height: 24,
          ),
        ),
        centerTitle: true,
        title: SvgPicture.asset(
          width: 50,
          height: 50,
          isEnglishLang ? Images.mafatihLogoEn : Images.mafatihLogoAr,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            icon: SvgPicture.asset(
              width: 20,
              height: 20,
              Images.searchIcon,
            ),
          ),
          IconButton(
            onPressed: () {
              BottomSheets.showFilterBottomSheet(context);
            },
            icon: SvgPicture.asset(
              width: 20,
              height: 20,
              Images.filterIcon,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(
              height: 20,
              content: SizedBox(),
            ),

            ///properties and see all button row
            HeadingAndSeeAllButton(
              heading: l10n.propertiesLabel,
              sellAllOnPressed: () {},
            ),

            ///properties listview
            SizedBox(
              height: 260,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _showPropertyDialog(properties[index]);
                    },
                    child: PropertyItem(property: properties[index]),
                  );
                },
              ),
            ),

            ///daily rentals and see all button row
            HeadingAndSeeAllButton(
              heading: l10n.dailyRentalsLabel,
              sellAllOnPressed: () {},
            ),

            ///daily rentals listview
            SizedBox(
              height: 260,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _showPropertyDialog(properties[index]);
                    },
                    child: PropertyItem(property: properties[index]),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            ///rounded corner banner image
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(Images.bannerImage)),
            ),

            const SizedBox(height: 8),

            ///projects and see all button row
            HeadingAndSeeAllButton(
              heading: l10n.projectsLabel,
              sellAllOnPressed: () {},
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              scrollDirection: Axis.vertical,
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ProjectItem(
                  property: projects[index],
                  onTap: () {
                    _showProjectDialog(projects[index]);
                  },
                );
              },
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _showPropertyDialog(Property property) {
    int current = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Container(
              height: 380,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyColor.withOpacity(0.4),
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Stack(
                              children: [
                                CarouselSlider(
                                  options: CarouselOptions(
                                    height: 200.0,
                                    viewportFraction: 1,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                  ),
                                  items: property.images.map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Image.asset(
                                          'assets/images/property_image.png',
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: property.images
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      return GestureDetector(
                                        onTap: () => {},
                                        child: Container(
                                          width: 10.0,
                                          height: 10.0,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 2.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: (Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? AppColors.whiteColor
                                                      : AppColors.blackColor)
                                                  .withOpacity(
                                                      current == entry.key
                                                          ? 0.9
                                                          : 0.4)),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    property.propertyName,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        Images.areaIcon,
                                        width: 20,
                                        height: 20,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        property.area,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(width: 8),
                                      SvgPicture.asset(
                                        Images.bedIcon,
                                        width: 20,
                                        height: 20,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        property.beds,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(width: 8),
                                      SvgPicture.asset(
                                        Images.tvLoungeIcon,
                                        width: 20,
                                        height: 20,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        property.tvLounge,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(width: 8),
                                      SvgPicture.asset(
                                        Images.bathIcon,
                                        width: 20,
                                        height: 20,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        property.bath,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      SizedBox(
                                        height: 40,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.asset(
                                            Images.ownerImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 32),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          height: 50,
                                          child: SimpleButton(
                                              text: '3500 SAR',
                                              callback: () {}),
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: TextButton(
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SvgPicture.asset(
                                                  Images.distanceIcon,
                                                  width: 20,
                                                  height: 20,
                                                  color: AppColors.primaryColor,
                                                ),
                                                const SizedBox(width: 4),
                                                const Expanded(
                                                    child: Text(
                                                  '14.1 km - 26 min',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: AppColors
                                                          .primaryColor,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationColor: AppColors
                                                          .primaryColor),
                                                )),
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),

                  //close button
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.whiteColor,
                          child: Icon(Icons.close, color: AppColors.blackColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showProjectDialog(Property property) {
    int current = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Container(
              height: 380,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyColor.withOpacity(0.4),
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Stack(
                              children: [
                                CarouselSlider(
                                  options: CarouselOptions(
                                    height: 200.0,
                                    viewportFraction: 1,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                  ),
                                  items: property.images.map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Image.asset(
                                          'assets/images/property_image.png',
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: property.images
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      return GestureDetector(
                                        onTap: () => {},
                                        child: Container(
                                          width: 10.0,
                                          height: 10.0,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 2.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: (Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? AppColors.whiteColor
                                                      : AppColors.blackColor)
                                                  .withOpacity(
                                                      current == entry.key
                                                          ? 0.9
                                                          : 0.4)),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Project Title',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Images.selectedLocationIcon,
                                                  width: 16,
                                                  height: 16,
                                                ),
                                                const SizedBox(width: 4),
                                                const Flexible(
                                                  child: Text(
                                                    'Riyadh',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                const Flexible(
                                                  child: Text(
                                                    '4km, 10 min',
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.asset(
                                                Images.ownerImage,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      const Expanded(
                                        child: ProjectData(
                                          title: 'No of Units',
                                          value: '20',
                                          titleSize: 10,
                                          valueSize: 12,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      const Expanded(
                                        child: ProjectData(
                                          title: 'Units Type',
                                          value: 'Residential',
                                          titleSize: 10,
                                          valueSize: 12,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      const Expanded(
                                        child: ProjectData(
                                          title: 'Area',
                                          value: '90m2 to 180m2',
                                          titleSize: 10,
                                          valueSize: 12,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      const Expanded(
                                        child: ProjectData(
                                          title: 'Rooms',
                                          value: '2 to 5',
                                          titleSize: 10,
                                          valueSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        property.price,
                                        style: const TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      const Text(
                                        'SAR',
                                        style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(width: 16),
                                      const Flexible(
                                        child: Text(
                                          'to',
                                          style: TextStyle(
                                              color: AppColors.greyColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Text(
                                        property.price,
                                        style: const TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(width: 4),
                                      const Text(
                                        'SAR',
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),

                  //close button
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.whiteColor,
                          child: Icon(Icons.close, color: AppColors.blackColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
