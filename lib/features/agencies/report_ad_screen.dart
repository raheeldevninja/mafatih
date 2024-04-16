import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:mafatih/features/agencies/model/neighborhood.dart';

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
    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Report Ad',
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

                Widgets.labels('Subject'),
                const SizedBox(
                  height: 10,
                ),
                AppTextField(
                  controller: _subjectController,
                  keyboardType: TextInputType.text,
                  hintText: 'Enter your subject',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),


                Widgets.labels('Property Type'),
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


                Widgets.labels('Priority'),
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

                Widgets.labels('Message'),
                const SizedBox(
                  height: 10,
                ),

                AppTextField(
                  controller: _messageController,
                  maxLines: 4,
                  keyboardType: TextInputType.text,
                  hintText: 'Enter your message ...',
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
                    text: 'Submit',
                    callback: () {},
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
