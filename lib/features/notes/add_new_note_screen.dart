import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AddNewNoteScreen extends StatefulWidget {
  const AddNewNoteScreen({super.key});

  @override
  State<AddNewNoteScreen> createState() => _AddNewNoteScreenState();
}

class _AddNewNoteScreenState extends State<AddNewNoteScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

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
          'Add New Note',
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
      body: Column(
        children: [
          const Header(
            height: 20,
            content: SizedBox(),
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                shrinkWrap: true,
                primary: true,
                children: [

                  const SizedBox(
                    height: 20,
                  ),


                  Widgets.labels('Title'),
                  const SizedBox(
                    height: 10,
                  ),

                  AppTextField(
                    controller: _titleController,
                    keyboardType: TextInputType.text,
                    hintText: 'Enter your title',
                    validator: (value) {
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Widgets.labels('Description'),
                  const SizedBox(
                    height: 10,
                  ),

                  AppTextField(
                    controller: _descriptionController,
                    keyboardType: TextInputType.text,
                    hintText: 'Enter description ...',
                    maxLines: 4,
                    validator: (value) {
                      return null;
                    },
                  ),

                  SizedBox(
                    height: height * 0.05,
                  ),

                  //register button
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: SimpleButton(
                      text: 'Submit',
                      callback: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 10,
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

    _titleController.dispose();
    _descriptionController.dispose();
  }
}
