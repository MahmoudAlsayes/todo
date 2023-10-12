import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/my_provider.dart';
import 'package:todo/screens/settings/language_bottom_sheet.dart';
import 'package:todo/shared/styles/colors.dart';

import 'mode_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var proo=Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.lang,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold,
              color:  proo.modeApp==ThemeMode.light?Colors.black:Colors.white),
            ),
            SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                chooseForm();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: primaryColor)),
                child: Row(
                  children: [
                    Text(proo.languageCode=="en" ?AppLocalizations.of(context)!.eng:AppLocalizations.of(context)!.arabic,
                        style: TextStyle(fontSize: 20, color: primaryColor),
                        textAlign: TextAlign.left),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              AppLocalizations.of(context)!.mod,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold,
                  color:  proo.modeApp==ThemeMode.light?Colors.black:Colors.white,),
            ),
            SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                chooseMode();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),

                    border: Border.all(color: primaryColor)),
                child: Row(
                  children: [
                    Text(proo.modeApp==ThemeMode.light?AppLocalizations.of(context)!.lig:AppLocalizations.of(context)!.drk,
                        style: TextStyle(fontSize: 20, color: primaryColor),
                        textAlign: TextAlign.left),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

   chooseForm() {
    showModalBottomSheet(
      context: context,


      shape: OutlineInputBorder(

        borderSide: BorderSide(color: Colors.transparent, ),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12), )

      ),

      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }
   chooseMode() {
    showModalBottomSheet(
      context: context,


      shape: OutlineInputBorder(

        borderSide: BorderSide(color: Colors.transparent, ),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12), )

      ),

      builder: (context) {
        return ModelBottomSheet();
      },
    );
  }
}
