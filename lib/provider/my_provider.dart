import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";
  ThemeMode modeApp=ThemeMode.light;

  void changeLanguage(String lanCode) {
    languageCode=lanCode;
     notifyListeners();

  }

  changeTheme(ThemeMode mode)
  {
    modeApp=mode;
    // if(modeApp==ThemeMode.light)
    //   {
    //     modeApp=ThemeMode.dark;
    //   }
    // else
    //   {
    //     modeApp=ThemeMode.light;
    //   }
    notifyListeners();
  }


}
