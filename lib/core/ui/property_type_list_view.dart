import 'package:flutter/material.dart';
import 'package:mafatih/core/images/images.dart';
import 'package:mafatih/core/models/property_type_model.dart';
import 'package:mafatih/core/ui/type_item.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PropertyTypeListView extends StatefulWidget {
  const PropertyTypeListView({super.key});

  @override
  State<PropertyTypeListView> createState() => _PropertyTypeListViewState();
}

class _PropertyTypeListViewState extends State<PropertyTypeListView> {

  List<PropertyTypeModel> propertyTypesList = [];

  @override
  void initState() {
    super.initState();

    _initPropertyTypesList();
  }

  _initPropertyTypesList() {
    propertyTypesList.add(
      PropertyTypeModel(
          icon: Images.villaIcon, title: 'Apartment', isSelected: true),
    );

    propertyTypesList.add(
      PropertyTypeModel(icon: Images.villaIcon, title: 'Villa'),
    );

    propertyTypesList.add(
      PropertyTypeModel(icon: Images.villaIcon, title: 'Land'),
    );
  }

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Widgets.labels(context, l10n.propertyTypeLabel),
        const SizedBox(
          height: 10,
        ),

        SizedBox(
          height: 130,
          child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.horizontal,
            itemCount: propertyTypesList.length,
            itemBuilder: (context, index) {
              return TypeItem(
                propertyType: propertyTypesList[index],
                onTap: () {
                  for (int i = 0;
                  i < propertyTypesList.length;
                  i++) {
                    if (i == index) {
                      propertyTypesList[i] =
                          propertyTypesList[i]
                              .copyWith(isSelected: true);
                    } else {
                      propertyTypesList[i] =
                          propertyTypesList[i]
                              .copyWith(isSelected: false);
                    }
                  }

                  setState(() {});
                },
              );
            },
          ),
        ),

      ],
    );
  }
}
