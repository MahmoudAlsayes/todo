import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/my_provider.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ModelBottomSheet extends StatelessWidget {
  const ModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<MyProvider>(context);
    return Container(
      color: provider.modeApp==ThemeMode.light?Colors.white:Color(0xff141922),

      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.drk,style: TextStyle(fontSize: 25,color:
                  provider.modeApp==ThemeMode.dark?
                  primaryColor:Colors.black)),
                  Spacer(),
                  provider.modeApp==ThemeMode.dark?
                  Icon(Icons.done,color: primaryColor,):SizedBox.shrink(),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.lig,style: TextStyle(fontSize: 25,color:
                  provider.modeApp==ThemeMode.light ? primaryColor:
                  Colors.white,)),
                  Spacer(),
                  provider.modeApp==ThemeMode.dark?SizedBox.shrink():
                  Icon(Icons.done,color:  primaryColor,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
