import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/models/bed_room.dart';

class BedRoom extends StatelessWidget {
  const BedRoom({
    required this.bedRoomModel,
    required this.onTap,
    super.key});

  final BedRoomModel bedRoomModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onTap,
          child: Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bedRoomModel.isSelected
                  ? AppColors.selectedColor
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              bedRoomModel.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: bedRoomModel.isSelected
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: bedRoomModel.isSelected
                    ? Colors.white
                    : AppColors.blackColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
