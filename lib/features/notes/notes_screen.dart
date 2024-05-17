import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/notes/add_new_note_screen.dart';
import 'package:mafatih/features/notes/model/note_model.dart';
import 'package:mafatih/features/notes/widgets/note_list_tile.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<NoteModel> notesList = [];

  @override
  void initState() {
    super.initState();

    _initNotesList();
  }

  _initNotesList() {
    notesList.add(
      NoteModel(title: 'Note 1', description: 'This is note 1'),
    );

    notesList.add(
      NoteModel(title: 'Note 2', description: 'This is note 2'),
    );

    notesList.add(
      NoteModel(title: 'Note 3', description: 'This is note 3'),
    );

    notesList.add(
      NoteModel(title: 'Note 4', description: 'This is note 4'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.notesTitle,
        onTapBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Header(
            height: 20,
            content: SizedBox(),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 1000),
                child: SlideAnimation(
                  horizontalOffset: 50.0,
                  child: NoteListTile(note: notesList[index]),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: const AddNewNoteScreen(),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child: const Icon(
          Icons.add,
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
