import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sombot_pc/firebase_options.dart';
import 'package:sombot_pc/presentation/router/app_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/config/l10n/generated/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      title: "SOMBOT PC",
      locale: const Locale('km'),
      supportedLocales: const [
        Locale('en'),
        Locale('km'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
