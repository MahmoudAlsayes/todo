import 'package:flutter/material.dart';
import 'package:todo/shared/styles/colors.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Setting"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Language",textAlign: TextAlign.start),
            SizedBox(
              height: 23,
            ),
           InkWell(
             onTap: () {
               // chooseForm(context);
             },
             child: Container(
               margin: EdgeInsets.symmetric(horizontal: 18),
               padding: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
               width: double.infinity,
               height: 50,

               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.all(Radius.zero),
                 border: Border.all(color: primaryColor)
               ),
               child: Text("English",style: TextStyle(fontSize:25,color: primaryColor),textAlign: TextAlign.left),

             ),
           ),
          ],
        ),
      ),
    );
  }
   // void chooseForm(BuildContext context) {
   //  showModalBottomSheet(context: context,
   //
   //    builder: (context) {
   //
   //  },);
   // }
}
