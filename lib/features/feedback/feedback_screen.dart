import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/main_heading.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _commentController = TextEditingController();
  double ratingValue = 0.0;

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
          'Feedback',
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
                    height: 10,
                  ),

                  const MainHeading(heading: 'How would you rate your experience ?'),

                  const SizedBox(
                    height: 10,
                  ),

                  Center(
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemSize: 30,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        ratingValue = rating;
                      },
                    ),

                  ),


                  const SizedBox(
                    height: 20,
                  ),

                  Widgets.labels('Comment'),
                  const SizedBox(
                    height: 10,
                  ),

                  AppTextField(
                    controller: _commentController,
                    keyboardType: TextInputType.text,
                    hintText: 'Add your feedback here ...',
                    maxLines: 4,
                    validator: (value) {
                      return null;
                    },
                  ),

                  SizedBox(
                    height: height * 0.05,
                  ),

                  //submit button
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: SimpleButton(
                      text: 'Send Feedback',
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

    _commentController.dispose();
  }
}
