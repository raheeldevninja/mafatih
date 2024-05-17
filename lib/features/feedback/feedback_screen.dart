import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/static_pages/view_model/static_pages_provider.dart';
import 'package:mafatih/core/ui/app_text_field.dart';
import 'package:mafatih/core/ui/custom_app_bar.dart';
import 'package:mafatih/core/ui/header.dart';
import 'package:mafatih/core/ui/shimmers/form_page_shimmer.dart';
import 'package:mafatih/core/ui/simple_button.dart';
import 'package:mafatih/core/ui/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mafatih/features/feedback/model/feedback_data.dart';
import 'package:provider/provider.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _commentController = TextEditingController();
  double ratingValue = 0.0;


  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final height = MediaQuery.of(context).size.height;

    final staticPagesProvider = context.watch<StaticPagesProvider>();

    return Scaffold(
      backgroundColor: AppColors.secondaryBgColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.feedbackTitle,
        onTapBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: staticPagesProvider.getLoading ? const FormPageShimmer() : Column(
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
                  Text(
                    l10n.rateExperienceLabel,
                    style: context.textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemSize: 34,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 30,
                      ),
                      onRatingUpdate: (rating) {
                        ratingValue = rating;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Widgets.labels(context, l10n.commentLabel),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: AppTextField(
                      controller: _commentController,
                      keyboardType: TextInputType.text,
                      hintText: l10n.commentHint,
                      maxLines: 4,
                      validator: (value) {

                        if (value!.isEmpty) {
                          return l10n.emptyFeedbackValidation;
                        }

                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: SimpleButton(
                      text: l10n.sendFeedbackBtnText,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {

                          await staticPagesProvider.feedback(
                            context,
                            FeedbackData(
                              rating: ratingValue,
                              message: _commentController.text.trim(),
                            ),
                          );

                          _commentController.clear();
                          ratingValue = 3.5;

                          setState(() {});

                        }
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

    _commentController.dispose();

    super.dispose();
  }
}
