import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ModelBottomSheet extends StatelessWidget {
  const ModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(AppLocalizations.of(context)!.drk,style: TextStyle(fontSize: 25,color: primaryColor)),
              Spacer(),
              Icon(Icons.done,color: primaryColor,),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(AppLocalizations.of(context)!.lig,style: TextStyle(fontSize: 25,color: Colors.black,)),
              Spacer(),
              Icon(Icons.done,color:  primaryColor,),
            ],
          ),
        ],
      ),
    );
  }
}
