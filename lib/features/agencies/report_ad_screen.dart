import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReportAdScreen extends StatefulWidget {
  const ReportAdScreen({super.key});

  @override
  State<ReportAdScreen> createState() => _ReportAdScreenState();
}

class _ReportAdScreenState extends State<ReportAdScreen> {
  String _selectedType = 'Type 1';
  String _selectedPriority = 'High';

  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.reportAdTitle,
        onTapBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(
            height: 16,
            content: SizedBox(),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [

                Widgets.labels(context, l10n.subjectLabel),
                const SizedBox(
                  height: 10,
                ),
                AppTextField(
                  controller: _subjectController,
                  keyboardType: TextInputType.text,
                  hintText: l10n.subjectHint,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),


                Widgets.labels(context, l10n.propertyTypeLabel),
                const SizedBox(
                  height: 10,
                ),

                Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: _selectedType,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined,
                        size: 24),
                    isExpanded: true,
                    iconSize: 24,
                    elevation: 16,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    style: const TextStyle(color: AppColors.blackColor),
                    underline: const SizedBox(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedType = newValue!;
                      });
                    },
                    items: <String>['Type 1', 'Type 2']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 20),


                Widgets.labels(context, l10n.priorityLabel),
                const SizedBox(
                  height: 10,
                ),

                Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: _selectedPriority,

                    icon: const Icon(Icons.keyboard_arrow_down_outlined,
                        size: 24),
                    isExpanded: true,
                    iconSize: 24,
                    elevation: 16,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    style: const TextStyle(color: AppColors.blackColor),
                    underline: const SizedBox(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPriority = newValue!;
                      });
                    },
                    items: <String>['High', 'Medium', 'Low']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),


                const SizedBox(height: 20),

                Widgets.labels(context, l10n.messageLabel),
                const SizedBox(
                  height: 10,
                ),

                AppTextField(
                  controller: _messageController,
                  maxLines: 4,
                  keyboardType: TextInputType.text,
                  hintText: l10n.writeYourMessageHint,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                SizedBox(
                  height: 50,
                  child: SimpleButton(
                    text: l10n.submitBtnText,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
