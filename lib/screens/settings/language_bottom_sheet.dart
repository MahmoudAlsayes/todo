import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/my_provider.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Container(
      color: provider.modeApp==ThemeMode.light?Colors.white:Color(0xff141922),

      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                provider.changeLanguage("en");
              },
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.eng,
                      style: TextStyle(fontSize: 25, color:  provider.languageCode=="en"? Colors.blue:(provider.modeApp==ThemeMode.light?Colors.black:Colors.white))),
                  Spacer(),
                  provider.languageCode=="en"
                      ? Icon(
                          Icons.done,
                          color: primaryColor,
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                provider.changeLanguage("ar");
              },
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.arabic,
                      style: TextStyle(
                        fontSize: 25,
                         color: provider.languageCode=="ar"? Colors.blue:(provider.modeApp==ThemeMode.light?Colors.black:Colors.white),
                      )),
                  Spacer(),
                  provider.languageCode=="en"
                      ? SizedBox.shrink()
                      : Icon(
                          Icons.done,
                          color: primaryColor,
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 bool isEnglish=true;
