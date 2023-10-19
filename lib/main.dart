import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/provider/my_provider.dart';
import 'package:todo/screens/login/login.dart';
import 'package:todo/screens/tasks/task_edit.dart';
import 'package:todo/shared/styles/my_theme_data.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    //   localizationsDelegates: [
    //   AppLocalizations.delegate,
    //   GlobalMaterialLocalizations.delegate,
    //   GlobalWidgetsLocalizations.delegate,
    //   GlobalCupertinoLocalizations.delegate,
    // ],
    //   supportedLocales: [
    //     Locale('en'), // English
    //     Locale('ar'), // Spanish
    //   ],
      locale: Locale(pro.languageCode),
      debugShowCheckedModeBanner: false,
      initialRoute:LoginScreen.routeName ,
      routes:{
        HomeLayout.routeName:(context) => HomeLayout(),
        TaskEdit.routeName:(context) => TaskEdit(),
        LoginScreen.routeName:(context) => LoginScreen(),
      },
      themeMode: pro.modeApp,
      theme:  MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,

    );
  }
}

