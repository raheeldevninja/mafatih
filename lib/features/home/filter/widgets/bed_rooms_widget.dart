import 'package:flutter/material.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/models/bed_room.dart';
import 'package:mafatih/features/home/filter/widgets/bed_room.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BedRoomsWidget extends StatefulWidget {
  const BedRoomsWidget({super.key});

  @override
  State<BedRoomsWidget> createState() => _BedRoomsWidgetState();
}

class _BedRoomsWidgetState extends State<BedRoomsWidget> {
  List<BedRoomModel> bedRoomList = [];

  @override
  void initState() {
    super.initState();

    bedRoomList = [
      BedRoomModel(id: '1', name: '1'),
      BedRoomModel(id: '2', name: '2'),
      BedRoomModel(id: '3', name: '3'),
      BedRoomModel(id: '4', name: '4'),
      BedRoomModel(id: '5', name: '5'),
      BedRoomModel(id: '6', name: '6'),
      BedRoomModel(id: '7', name: '7'),
      BedRoomModel(id: '8', name: '8'),
      BedRoomModel(id: '9', name: '9'),
      BedRoomModel(id: '10', name: '10'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.bedRoomsLabel,
          style: context.textTheme.bodyLarge,
        ),

        const SizedBox(height: 8),

        ///beds list
        SizedBox(
          height: 45,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: bedRoomList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return BedRoom(
                bedRoomModel: bedRoomList[index],
                onTap: () {
                  setState(() {
                    bedRoomList[index] = bedRoomList[index]
                        .copyWith(isSelected: !bedRoomList[index].isSelected);
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
