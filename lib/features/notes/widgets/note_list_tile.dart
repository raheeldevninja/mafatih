import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/features/notes/model/note_model.dart';

class NoteListTile extends StatelessWidget {
  const NoteListTile({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Container(
          width: 4,
          color: AppColors.primaryColor,
        ),
        contentPadding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
        minLeadingWidth: 4,
        title: Text(
          note.title,
          style: context.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          note.description,
          style: context.textTheme.bodySmall,
        ),
      ),
    );
  }
}
