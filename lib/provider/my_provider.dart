import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";

   changeLanguage(String lanCode) {
    languageCode=lanCode;
     notifyListeners();

  }
}
// if (languageCode == "en") {
//   languageCode = "ar";
// } else {
//   languageCode = "en";
// }