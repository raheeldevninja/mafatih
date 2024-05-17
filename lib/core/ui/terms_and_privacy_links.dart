import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mafatih/core/app/app_colors.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/features/static_pages/privacy_policy_page.dart';
import 'package:mafatih/features/static_pages/terms_of_use_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsAndPrivacyLinks extends StatelessWidget {
  const TermsAndPrivacyLinks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: l10n.acceptLabel,
            style: context.textTheme.bodyMedium,
          ),
          TextSpan(
            text: l10n.termsOfUseLink,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const TermsOfUsePage(),
                  withNavBar: false,
                  pageTransitionAnimation:
                  PageTransitionAnimation.cupertino,
                );
              },
          ),
          TextSpan(
            text: l10n.and,
            style: context.textTheme.bodyMedium,
          ),
          TextSpan(
            text: l10n.privacyPolicyLink,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryColor,
            ),
            // Define an onTap handler to launch a URL
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const PrivacyPolicyPage(),
                  withNavBar: false,
                  pageTransitionAnimation:
                  PageTransitionAnimation.cupertino,
                );
              },
          ),
          const TextSpan(
            text: '.',
          ),
        ],
      ),
    );
  }
}