import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mafatih/core/app/style.dart';
import 'package:mafatih/core/static_pages/view_model/static_pages_provider.dart';
import 'package:mafatih/features/agencies/view_model/agency_provider.dart';
import 'package:mafatih/features/auth/view_model/auth_provider.dart';
import 'package:mafatih/features/my_account/complains/view_model/complains_provider.dart';
import 'package:mafatih/features/my_account/favourite_properties/view_model/favourite_provider.dart';
import 'package:mafatih/features/my_account/property_requests/view_model/property_requests_provider.dart';
import 'package:mafatih/features/my_account/view_records/view_model/viewed_records_provider.dart';
import 'package:mafatih/features/splash/splash_screen.dart';
import 'package:mafatih/l10n/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  _initializeGoogleFonts();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LocaleProvider()),
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => FavouriteProvider()),
      ChangeNotifierProvider(create: (context) => ComplainsProvider()),
      ChangeNotifierProvider(create: (context) => PropertyRequestsProvider()),
      ChangeNotifierProvider(create: (context) => ViewedRecordsProvider()),
      ChangeNotifierProvider(create: (context) => StaticPagesProvider()),
      ChangeNotifierProvider(create: (context) => AgencyProvider()),
    ], child: const MyApp()),
  );
}
void _initializeGoogleFonts() {
  GoogleFonts.config.allowRuntimeFetching = false;

  LicenseRegistry.addLicense(
        () async* {
      final license = await rootBundle.loadString('google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mafatih',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      locale: context.watch<LocaleProvider>().appLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // Add other delegates as needed
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
        // Add other supported locales
      ],
      home: const SplashScreen(),
    );
  }



}
