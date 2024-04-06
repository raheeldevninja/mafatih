import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/bed_room.dart';
import 'package:mafatih/core/models/keyword.dart';
import 'package:mafatih/core/models/property_type.dart';
import 'package:mafatih/core/models/property_usage.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/core/ui/simple_button.dart';


class FiltersBottomSheet extends StatefulWidget {
  const FiltersBottomSheet({super.key});

  @override
  State<FiltersBottomSheet> createState() => _FiltersBottomSheetState();
}

class _FiltersBottomSheetState extends State<FiltersBottomSheet> {

  List<PropertyUsage> propertyUsageList = [];
  List<PropertyType> propertyTypeList = [];
  List<BedRoom> bedRoomList = [];
  List<Keyword> keywordsList = [];

  final _keywordController = TextEditingController();
  final _locationFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();

    propertyUsageList = [
      PropertyUsage(id: '1', name: 'Residential'),
      PropertyUsage(id: '2', name: 'Commercial'),
      PropertyUsage(id: '3', name: 'Industrial'),
      PropertyUsage(id: '4', name: 'Agricultural'),
    ];

    propertyTypeList = [
      PropertyType(id: '1', name: 'Apartment'),
      PropertyType(id: '2', name: 'Villa'),
      PropertyType(id: '3', name: 'Flood'),
      PropertyType(id: '4', name: 'Room'),
      PropertyType(id: '5', name: 'Office'),
      PropertyType(id: '6', name: 'Chalet'),
      PropertyType(id: '7', name: 'Farm'),
      PropertyType(id: '8', name: 'Building'),
      PropertyType(id: '10', name: 'Shop'),
      PropertyType(id: '11', name: 'Warehouse'),
      PropertyType(id: '12', name: 'Land'),
    ];

    bedRoomList = [
      BedRoom(id: '1', name: '1'),
      BedRoom(id: '2', name: '2'),
      BedRoom(id: '3', name: '3'),
      BedRoom(id: '4', name: '4'),
      BedRoom(id: '5', name: '5'),
      BedRoom(id: '6', name: '6'),
      BedRoom(id: '7', name: '7'),
      BedRoom(id: '8', name: '8'),
      BedRoom(id: '9', name: '9'),
      BedRoom(id: '10', name: '10'),
    ];
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.8,
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 100,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Row(
              children: [
                MainHeading(heading: 'Filters'),
              ],
            ),

            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'You are searching for ',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.blackColor,
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Riyadh',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Change Location',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor,
                      )),
                ),
              ],
            ),

            const SizedBox(height: 16),


            const MainHeading(heading: 'Property Usage'),

            const SizedBox(height: 8),

            ///property usage list
            SizedBox(
              height: 30,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: propertyUsageList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {

                            //single select
                            for (int i = 0; i < propertyUsageList.length; i++) {
                              if (i != index) {
                                propertyUsageList[i] = propertyUsageList[i].copyWith(isSelected: false);
                              }
                              else {
                                propertyUsageList[i] = propertyUsageList[i].copyWith(isSelected: true);

                              }
                            }

                            setState(() {

                            });


                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: propertyUsageList[index].isSelected
                                  ? AppColors.selectedColor
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              propertyUsageList[index].name,
                              style: TextStyle(
                                color: propertyUsageList[index].isSelected
                                    ? Colors.white
                                    : AppColors.blackColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    );
                },
              ),
            ),

            const SizedBox(height: 20),

            const MainHeading(heading: 'Property Type'),

            const SizedBox(height: 8),

            ///property type list
            SizedBox(
              height: 30,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: propertyTypeList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {

                            //single select
                            for (int i = 0; i < propertyTypeList.length; i++) {
                              if (i != index) {
                                propertyTypeList[i] = propertyTypeList[i].copyWith(isSelected: false);
                              }
                              else {
                                propertyTypeList[i] = propertyTypeList[i].copyWith(isSelected: true);

                              }
                            }

                            setState(() {

                            });

                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: propertyTypeList[index].isSelected
                                  ? AppColors.selectedColor
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              propertyTypeList[index].name,
                              style: TextStyle(
                                color: propertyTypeList[index].isSelected
                                    ? Colors.white
                                    : AppColors.blackColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    );
                },
              ),
            ),

            const SizedBox(height: 20),

            const MainHeading(heading: 'Bed Rooms'),

            const SizedBox(height: 8),

            ///beds list
            SizedBox(
              height: 45,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: bedRoomList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            setState(() {
                              bedRoomList[index] = bedRoomList[index].copyWith(isSelected: !bedRoomList[index].isSelected);
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: bedRoomList[index].isSelected
                                  ? AppColors.selectedColor
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              bedRoomList[index].name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: bedRoomList[index].isSelected ? FontWeight.bold : FontWeight.normal,
                                color: bedRoomList[index].isSelected
                                    ? Colors.white
                                    : AppColors.blackColor,

                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    );
                },
              ),
            ),

            const SizedBox(height: 20),

            const MainHeading(heading: 'Keywords'),

            const SizedBox(height: 8),

            ///keyword text field
            TextField(
              controller: _keywordController,
              onSubmitted: (value) {

                //add keyword to list
                keywordsList.add(Keyword(id: '${keywordsList.length + 1}', value: _keywordController.text));
                _keywordController.clear();

                setState(() {

                });

              },
              decoration: InputDecoration(
                hintText: 'Enter Keywords',
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                suffixIcon: IconButton(
                  onPressed: () {

                    //add keyword to list
                    keywordsList.add(Keyword(id: '${keywordsList.length + 1}', value: _keywordController.text));
                    _keywordController.clear();

                    setState(() {

                    });

                  },
                  icon: const Icon(Icons.search),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ///horizontal keywords listview width cross
            keywordsList.isEmpty ? const SizedBox() : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: keywordsList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return
                        InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {

                            //remove
                            keywordsList.removeAt(index);

                            setState(() {
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  keywordsList[index].value,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.close, size: 20,),
                              ],
                            ),
                          ),
                        );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),

            const MainHeading(heading: 'Location'),

            const SizedBox(height: 8),

            TextField(
              controller: _locationFieldController,
              onSubmitted: (value) {},
              decoration: InputDecoration(
                hintText: 'Enter location',
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 8),

            //use current location
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  SvgPicture.asset(
                    Images.currentLocationIcon,
                    width: 24,
                    height: 24,
                  ),

                  const SizedBox(width: 4),

                  const Text('Use current location',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.blackColor,
                  ),),

                ],
              ),
            ),

            const SizedBox(height: 20),


            ///save filters button
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text('Save Filters',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    )),
              ),
            ),

            const SizedBox(height: 4),

            ///find now button
            SizedBox(
              width: width,
              height: 50,
              child: SimpleButton(
                text: 'Find Now',
                callback: () {},
              ),
            ),

            const SizedBox(height: 20),


          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _keywordController.dispose();
    _locationFieldController.dispose();
  }
}
