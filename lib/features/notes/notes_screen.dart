import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/notes/add_new_note_screen.dart';
import 'package:mafatih/features/notes/model/note_model.dart';
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

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Notes',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
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
                  title: Text(notesList[index].title),
                  subtitle: Text(notesList[index].description),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        onPressed: () {

          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: const AddNewNoteScreen(),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );

        },
        child: const Icon(Icons.add, color: AppColors.secondaryColor, size: 32,),
      ),
    );
  }

}
